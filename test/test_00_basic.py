"""
NOTE: this tests are also meant to be run as PyPy "applevel" tests.

This means that global imports will NOT be visible inside the test
functions. In particular, you have to "import pytest" inside the test in order
to be able to use e.g. pytest.raises (which on PyPy will be implemented by a
"fake pytest module")
"""
from .support import HPyTest
from hpy.devel.abitag import HPY_ABI_VERSION, HPY_ABI_VERSION_MINOR
import shutil


class TestBasic(HPyTest):

    def test_get_version(self):
        if self.compiler.hpy_abi != 'universal':
            return
        import hpy.universal
        version, gitrev = hpy.universal.get_version()
        # it's a bit hard to test the CONTENT of these values. Let's just
        # check that they are strings...
        assert isinstance(version, str)
        assert isinstance(gitrev, str)

    def test_empty_module(self):
        import sys
        mod = self.make_module("""
            @INIT
        """)
        assert type(mod) is type(sys)

##    def test_abi_version_check(self):
##        if self.compiler.hpy_abi != 'universal':
##            return
##        try:
##            self.make_module("""
##                // hack: we redefine the version
##                #undef HPY_ABI_VERSION
##                #define HPY_ABI_VERSION 999
##                @INIT
##            """)
##        except RuntimeError as ex:
##            assert str(ex) == "HPy extension module 'mytest' requires unsupported " \
##                              "version of the HPy runtime. Requested version: 999.0. " \
##                              "Current HPy version: {}.{}.".format(HPY_ABI_VERSION, HPY_ABI_VERSION_MINOR)
##        else:
##            assert False, "Expected exception"

    def test_abi_tag_check(self):
        if self.compiler.hpy_abi != 'universal':
            return

        from hpy.universal import MODE_UNIVERSAL
        def assert_load_raises(filename, message):
            try:
                self.compiler.load_universal_module('mytest', filename, mode=MODE_UNIVERSAL)
            except RuntimeError as ex:
                assert str(ex) == message
            else:
                assert False, "Expected exception"

        module = self.compile_module("@INIT")
        filename = module.so_filename
        hpy_tag = ".hpy{}".format(HPY_ABI_VERSION)

        filename_wrong_tag = filename.replace(hpy_tag, ".hpy999")
        shutil.move(filename, filename_wrong_tag)
        assert_load_raises(filename_wrong_tag,
                           "HPy extension module 'mytest' at path '{}': mismatch "
                           "between the HPy ABI tag encoded in the filename and "
                           "the major version requested by the HPy extension itself. "
                           "Major version tag parsed from filename: 999. "
                           "Requested version: {}.{}.".format(filename_wrong_tag, HPY_ABI_VERSION, HPY_ABI_VERSION_MINOR))

        filename_no_tag = filename.replace(hpy_tag, "")
        shutil.move(filename_wrong_tag, filename_no_tag)
        assert_load_raises(filename_no_tag,
                           "HPy extension module 'mytest' at path '{}': "
                           "could not find HPy ABI tag encoded in the filename. "
                           "The extension claims to be compiled with HPy ABI version: "
                           "{}.{}.".format(filename_no_tag, HPY_ABI_VERSION, HPY_ABI_VERSION_MINOR))

    def test_different_name(self):
        mod = self.make_module("""
            @INIT
        """, name="foo")
        assert mod.__name__ == "foo"

    def test_noop_function(self):
        mod = self.make_module("""
            //var f = HPyDef_METH(&mod_ctx, "f", f_impl, hpy.HPyFunc_NOARGS, .doc="hello world") // FIXME
            var f = HPyDef_METH(&mod_ctx, "f", f_impl, hpy.HPyFunc_NOARGS);
            fn f_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy) hpy.HPy {
                _ = self;
                return hpy.HPy_Dup(ctx, ctx.?.*.h_None);
            }

            @EXPORT(f)
            @INIT
        """)
        assert mod.f() is None
        assert mod.f.__doc__ == 'hello world'

    def test_self_is_module(self):
        mod = self.make_module("""
            var f = HPyDef_METH(&mod_ctx, "f", f_impl, hpy.HPyFunc_NOARGS);
            fn f_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy) hpy.HPy {
                return hpy.HPy_Dup(ctx, self);
            }
            @EXPORT(f)
            @INIT
        """)
        assert mod.f() is mod

    def test_identity_function(self):
        mod = self.make_module("""
            var f = HPyDef_METH(&mod_ctx, "f", f_impl, hpy.HPyFunc_O);
            fn f_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, arg: *const hpy.HPy) hpy.HPy {
                _ = self;
                return hpy.HPy_Dup(ctx, arg);
            }
            @EXPORT(f)
            @INIT
        """)
        x = object()
        assert mod.f(x) is x

    def test_float_asdouble(self):
        mod = self.make_module("""
            var f = HPyDef_METH(&mod_ctx, "f", f_impl, hpy.HPyFunc_O);
            fn f_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, arg: *const hpy.HPy) hpy.HPy {
                _ = self;
                double a = hpy.HPyFloat_AsDouble(ctx, arg);
                return hpy.HPyFloat_FromDouble(ctx, a * 2.0);
            }
            @EXPORT(f)
            @INIT
        """)
        assert mod.f(1.) == 2.

    def test_wrong_number_of_arguments(self):
        import pytest
        mod = self.make_module("""
            var f_noargs = HPyDef_METH(&mod_ctx, "f_noargs", f_noargs_impl hpy.HPyFunc_NOARGS);
            fn f_noargs_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy) hpy.HPy {
                _ = self;
                return hpy.HPy_Dup(ctx, ctx.?.*.h_None);
            }
            var f_o = HPyDef_METH(&mod_ctx, "f_o", f_o_impl, hpy.HPyFunc_O);
            fn f_o_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, arg: *const hpy.HPy) hpy.HPy {
                _ = self;
                _ = arg;
                return hpy.HPy_Dup(ctx, ctx.?.*.h_None);
            }
            @EXPORT(f_noargs)
            @EXPORT(f_o)
            @INIT
        """)
        with pytest.raises(TypeError):
            mod.f_noargs(1)
        with pytest.raises(TypeError):
            mod.f_o()
        with pytest.raises(TypeError):
            mod.f_o(1, 2)

    def test_close(self):
        mod = self.make_module("""
            var f = HPyDef_METH(&mod_ctx, "f", f_impl, hpy.HPyFunc_O);
            fn f_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, arg: *const hpy.HPy) hpy.HPy {
                _ = self;
                var one: hpy.HPy = hpy.HPyLong_FromLong(ctx, 1);
                if (hpy.HPy_IsNull(one))
                    return hpy.HPy_NULL;
                var res: hpy.HPy = hpy.HPy_Add(ctx, arg, one);
                hpy.HPy_Close(ctx, one);
                return res;
            }
            @EXPORT(f)
            @INIT
        """)
        assert mod.f(41.5) == 42.5

    def test_bool(self):
        mod = self.make_module("""
            var f = HPyDef_METH(&mod_ctx, "f", f_impl, hpy.HPyFunc_O);
            fn f_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, arg: *const hpy.HPy) hpy.HPy {
                _ = self;
                int cond = hpy.HPyLong_AsLong(ctx, arg) > 5;
                return hpy.HPy_Dup(ctx, cond ? ctx.?.*.h_True : ctx.?.*.h_False);
            }
            @EXPORT(f)
            @INIT
        """)
        assert mod.f(4) is False
        assert mod.f(6) is True

    def test_exception(self):
        import pytest
        mod = self.make_module("""
            var f = HPyDef_METH(&mod_ctx, "f", f_impl, hpy.HPyFunc_O);
            fn f_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, arg: *const hpy.HPy) hpy.HPy {
                _ = self;
                x: c_long = hpy.HPyLong_AsLong(ctx, arg);
                if (x < 5) {
                    return hpy.HPyLong_FromLong(ctx, -x);
                }
                else {
                    hpy.HPyErr_SetString(ctx, ctx.?.*.h_ValueError, "hello world");
                    return hpy.HPy_NULL;
                }
            }
            @EXPORT(f)
            @INIT
        """)
        assert mod.f(-10) == 10
        with pytest.raises(ValueError) as exc:
            mod.f(20)
        assert str(exc.value) == 'hello world'

    def test_varargs(self):
        mod = self.make_module("""
            var f = HPyDef_METH(&mod_ctx, "f", f_impl, hpy.HPyFunc_VARARGS);
            fn f_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, const HPy *args, nargs: usize) hpy.HPy {
                _ = self;
                var a: c_long = 0;
                var b: c_long = 0;
                if (!hpy.HPyArg_Parse(ctx, null, args, nargs, "ll", &a, &b))
                    return hpy.HPy_NULL;
                return hpy.HPyLong_FromLong(ctx, 10*a + b);
            }
            @EXPORT(f)
            @INIT
        """)
        assert mod.f(4, 5) == 45

    def test_builtin_handles(self):
        mod = self.make_module("""
            var f = HPyDef_METH(&mod_ctx, "f", f_impl, hpy.HPyFunc_O);
            fn f_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, arg: *const hpy.HPy) hpy.HPy {
                _ = self;
                var i: c_long = hpy.HPyLong_AsLong(ctx, arg);
                h = switch(i) {
                    1  => ctx.?.*.h_None,
                    2  => ctx.?.*.h_False,
                    3  => ctx.?.*.h_True,
                    4  => ctx.?.*.h_ValueError,
                    5  => ctx.?.*.h_TypeError,
                    6  => ctx.?.*.h_IndexError,
                    7  => ctx.?.*.h_SystemError,
                    8  => ctx.?.*.h_BaseObjectType,
                    9  => ctx.?.*.h_TypeType,
                    10 => ctx.?.*.h_BoolType,
                    11 => ctx.?.*.h_LongType,
                    12 => ctx.?.*.h_FloatType,
                    13 => ctx.?.*.h_UnicodeType,
                    14 => ctx.?.*.h_TupleType,
                    15 => ctx.?.*.h_ListType,
                    16 => ctx.?.*.h_NotImplemented,
                    17 => ctx.?.*.h_Ellipsis,
                    18 => ctx.?.*.h_ComplexType,
                    19 => ctx.?.*.h_BytesType,
                    20 => ctx.?.*.h_MemoryViewType,
                    21 => ctx.?.*.h_SliceType,
                    22 => ctx.?.*.h_Builtins,
                    2048: ctx.?.*.h_CapsuleType,
                    else => 
                        hpy.HPyErr_SetString(ctx, ctx.?.*.h_ValueError, "invalid choice");
                        return hpy.HPy_NULL;
                }
                return hpy.HPy_Dup(ctx, h);
            }
            @EXPORT(f)
            @INIT
        """)
        import builtins

        builtin_objs = (
            '<NULL>', None, False, True, ValueError, TypeError, IndexError,
            SystemError, object, type, bool, int, float, str, tuple, list,
            NotImplemented, Ellipsis, complex, bytes, memoryview, slice,
            builtins.__dict__
        )
        for i, obj in enumerate(builtin_objs):
            if i == 0:
                continue
            assert mod.f(i) is obj

        # we cannot be sure if 'datetime_CAPI' is available
        import datetime
        if hasattr(datetime, "datetime_CAPI"):
            assert mod.f(2048) is type(datetime.datetime_CAPI)

    def test_extern_def(self):
        import pytest
        main = """
            extern HPyDef f;
            extern HPyDef g;
            extern HPyDef h;
            extern HPyDef i;

            @EXPORT(f)
            @EXPORT(g)
            @EXPORT(h)
            @EXPORT(i)
            @INIT
        """
        extra = """
            var f = HPyDef_METH(&mod_ctx, "f", f_impl, hpy.HPyFunc_NOARGS);
            fn HPy f_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy) hpy.HPy {
                _ = self;
                return hpy.HPyLong_FromLong(ctx, 12345);
            }
            var g = HPyDef_METH(&mod_ctx, "g", g_impl, hpy.HPyFunc_O);
            fn HPy g_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, arg: *const hpy.HPy) hpy.HPy {
                _ = self;
                return hpy.HPy_Dup(ctx, arg);
            }
            var h = HPyDef_METH(&mod_ctx, "h", h_impl, hpy.HPyFunc_VARARGS);
            fn HPy h_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, args: const* hpy.HPy, nargs: usize) hpy.HPy {
                _ = self;
                var a: c_long = 0;
                var b: c_long = 0;
                if (!hpy.HPyArg_Parse(ctx, null, args, nargs, "ll", &a, &b))
                    return hpy.HPy_NULL;
                return hpy.HPyLong_FromLong(ctx, 10*a + b);
            }
            var i = HPyDef_METH(&mod_ctx, "i", i_impl, hpy.HPyFunc_KEYWORDS);
            fn i_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, const hpy.HPy *args, nargs: usize,
                              kwnames: hpy.HPy) hpy.HPy {
                _ self;
                var a: c_long = 0;
                var b: c_long = 0;
                static const char *kwlist[] = { "a", "b", null };
                if (!hpy.HPyArg_ParseKeywords(ctx, null, args, nargs, kwnames, "ll", kwlist, &a, &b))
                    return hpy.HPy_NULL;
                return hpy.HPyLong_FromLong(ctx, 10*a + b);
            }
        """
        mod = self.make_module(main, extra_sources=[extra])
        assert mod.f() == 12345
        assert mod.g(42) == 42
        assert mod.h(5, 6) == 56
        assert mod.i(4, 3) == 43
        assert mod.i(a=2, b=5) == 25
        with pytest.raises(TypeError):
            mod.h("not an integer", "not an integer either")

    def test_Float_FromDouble(self):
        mod = self.make_module("""
            var f = HPyDef_METH(&mod_ctx, "f", f_impl, hpy.HPyFunc_NOARGS)
            fn f_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy) hpy.HPy {
                _ = self;
                return hpy.HPyFloat_FromDouble(ctx, 123.45);
            }
            @EXPORT(f)
            @INIT
        """)
        assert mod.f() == 123.45

    def test_unsupported_signature(self):
        import pytest
        with pytest.raises(ValueError) as exc:
            self.make_module("""
                hpy.HPyDef f = {
                    .kind = hpy.HPyDef_Kind_Meth,
                    .meth = {
                        .name = "f",
                        .signature = (hpy.HPyFunc_Signature)1234,
                    }
                };
                @EXPORT(f)
                @INIT
            """)
        assert str(exc.value) == 'Unsupported HPyMeth signature'

    def test_repr_str_ascii_bytes(self):
        mod = self.make_module("""
            var f1 = HPyDef_METH(&mod_ctx, "f1", f1_impl, hpy.HPyFunc_O);
            fn f1_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, arg: *const hpy.HPy) hpy.HPy {
                _ = self;
                return hpy.HPy_Repr(ctx, arg);
            }
            var f2 = HPyDef_METH(&mod_ctx, "f2", f2_impl, hpy.HPyFunc_O);
            fn f2_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, arg: *const hpy.HPy) hpy.HPy {
                _ = self;
                return hpy.HPy_Str(ctx, arg);
            }
            var f3 = HPyDef_METH(&mod_ctx, "f3", f3_impl, hpy.HPyFunc_O);
            fn f3_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, arg: *const hpy.HPy) hpy.HPy {
                _ = self;
                return hpy.HPy_ASCII(ctx, arg);
            }
            var f4 = HPyDef_METH(&mod_ctx, "f4", f4_impl, hpy.HPyFunc_O);
            fn f4_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, arg: *const hpy.HPy) hpy.HPy {
                _ = self;
                return hpy.HPy_Bytes(ctx, arg);
            }
            @EXPORT(f1)
            @EXPORT(f2)
            @EXPORT(f3)
            @EXPORT(f4)
            @INIT
        """)
        assert mod.f1("\u1234") == "'\u1234'"
        assert mod.f2(42) == "42"
        assert mod.f3("\u1234") == "'\\u1234'"
        assert mod.f4(bytearray(b"foo")) == b"foo"

    def test_is_true(self):
        mod = self.make_module("""
            var f = HPyDef_METH(&mod_ctx, "f", f_impl, hpy.HPyFunc_O);
            fn f_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, arg: *const hpy.HPy) hpy.HPy {
                _ = self;
                int cond = hpy.HPy_IsTrue(ctx, arg);
                return hpy.HPy_Dup(ctx, cond ? ctx.?.*.h_True : ctx.?.*.h_False);
            }
            @EXPORT(f)
            @INIT
        """)
        assert mod.f("1234") is True
        assert mod.f("") is False

    def test_richcompare(self):
        mod = self.make_module("""
            var f = HPyDef_METH(&mod_ctx, "f", f_impl, hpy.HPyFunc_O);
            fn f_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, arg: *const hpy.HPy) hpy.HPy {
                _ = self;
                var arg2: hpy.HPy = hpy.HPyLong_FromLong(ctx, 100);
                var result: hpy.HPy = hpy.HPy_RichCompare(ctx, arg, arg2, hpy.HPy_GT);
                hpy.HPy_Close(ctx, arg2);
                return result;
            }
            @EXPORT(f)
            @INIT
        """)
        assert mod.f(100) is False
        assert mod.f(150) is True

    def test_richcomparebool(self):
        mod = self.make_module("""
            var f = HPyDef_METH(&mod_ctx, "f", f_impl, hpy.HPyFunc_O);
            fn f_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, arg: *const hpy.HPy) hpy.HPy {
                _ = self;
                var arg2: hpy.HPy = hpy.HPyLong_FromLong(ctx, 100);
                var result: c_int = hpy.HPy_RichCompareBool(ctx, arg, arg2, hpy.HPy_GE);
                hpy.HPy_Close(ctx, arg2);
                return hpy.HPyLong_FromLong(ctx, -result);
            }
            @EXPORT(f)
            @INIT
        """)
        assert mod.f(50) == 0
        assert mod.f(100) == -1

    def test_hash(self):
        mod = self.make_module("""
            var f = HPyDef_METH(&mod_ctx, "f", f_impl, hpy.HPyFunc_O);
            fn f_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, arg: *const hpy.HPy) hpy.HPy {
                _ = self;
                hpy.HPy_hash_t hash = hpy.HPy_Hash(ctx, arg);
                return hpy.HPyLong_FromSsize_t(ctx, hash);
            }
            @EXPORT(f)
            @INIT
        """)
        x = object()
        assert mod.f(x) == hash(x)

    def test_ctx_name(self):
        mod = self.make_module("""
            var f = HPyDef_METH(&mod_ctx, "f", f_impl, hpy.HPyFunc_NOARGS);
            fn f_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy) hpy.HPy {
                _ = self;
                return hpy.HPyUnicode_FromString(ctx, ctx.?.*.name);
            }

            @EXPORT(f)
            @INIT
        """)
        ctx_name = mod.f()
        hpy_abi = self.compiler.hpy_abi
        if hpy_abi == 'cpython':
            assert ctx_name == 'HPy CPython ABI'
        elif hpy_abi == 'universal':
            # this can be "HPy Universal ABI (CPython backend)" or
            # "... (PyPy backend)", etc.
            assert ctx_name.startswith('HPy Universal ABI')
        elif hpy_abi == 'debug':
            assert ctx_name.startswith('HPy Debug Mode ABI')
        elif hpy_abi == 'trace':
            assert ctx_name.startswith('HPy Trace Mode ABI')
        else:
            assert False, 'unexpected hpy_abi: %s' % hpy_abi

    def test_abi_version(self):
        """
        Check that all the various ABI version info that we have around match.
        """
        from hpy.devel import abitag
        mod = self.make_module(
        """
            var get_ABIT_VERSION = HPyDef_METH(&mod_ctx, "get_ABI_VERSION", get_ABI_VERSION_impl, hpy.HPyFunc_NOARGS);
            fn get_ABI_VERSION_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy) hpy.HPy {
                _ = self;
                return hpy.HPyLong_FromLong(ctx, HPY_ABI_VERSION);
            }

            var get_ABIT_TAG = HPyDef_METH(&mod_ctx, "get_ABI_TAG", get_ABI_TAG_impl, hpy.HPyFunc_NOARGS);
            fn get_ABI_TAG_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy) hpy.HPy {
                _ = self;
                return hpy.HPyUnicode_FromString(ctx, HPY_ABI_TAG);
            }

            var get_ctx_version = HPyDef_METH(&mod_ctx, "get_ctx_version", get_ctx_version_impl, hpy.HPyFunc_NOARGS);
            fn get_ctx_version_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy) hpy.HPy {
                _ = self;
                return hpy.HPyLong_FromLong(ctx, ctx.?.*.abi_version);
            }

            @EXPORT(get_ABI_VERSION)
            @EXPORT(get_ABI_TAG)
            @EXPORT(get_ctx_version)
            @INIT
        """)
        c_HPY_ABI_VERSION = mod.get_ABI_VERSION()
        c_HPY_ABI_TAG = mod.get_ABI_TAG()
        ctx_version = mod.get_ctx_version()
        assert c_HPY_ABI_VERSION == ctx_version == abitag.HPY_ABI_VERSION
        assert c_HPY_ABI_TAG == abitag.HPY_ABI_TAG

    def test_FromVoidP_AsVoidP(self):
        mod = self.make_module("""
            var f = HPyDef_METH(&mod_ctx, "f", f_impl, hpy.HPyFunc_O);
            fn f_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, arg: *const hpy.HPy) hpy.HPy {
                _ = self;
                var p: anyopaque = hpy.HPy_AsVoidP(arg);
                var h: hpy.HPy = hpy.HPy_FromVoidP(p);
                return hpy.HPy_Dup(ctx, h);
            }
            @EXPORT(f)
            @INIT
        """)
        assert mod.f(42) == 42

    def test_leave_python(self):
        mod = self.make_module("""
            var f = HPyDef_METH(&mod_ctx, "f", f_impl, hpy.HPyFunc_O);
            fn f_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, arg: *const hpy.HPy) hpy.HPy {
                _ = self;
                var data_len: hpy.HPy_ssize_t = 0;
                const char* data = hpy.HPyUnicode_AsUTF8AndSize(ctx, arg, &data_len);
                var acount: hpy.HPy_ssize_t = 0;
                hpy.HPy_BEGIN_LEAVE_PYTHON(ctx);
                for (hpy.HPy_ssize_t i = 0; i < data_len; ++i) {
                    if (data[i] == 'a')
                        acount++;
                }
                hpy.HPy_END_LEAVE_PYTHON(ctx);
                return hpy.HPyLong_FromSize_t(ctx, acount);
            }
            @EXPORT(f)
            @INIT
        """)
        assert mod.f("abraka") == 3

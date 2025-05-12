//! A collection of helper functions to help with writing Python modules in zig. They are not
//! strictly necessary, but they greatly reduce boilerplate code. Mainly used to replace
//! untranslatable HPy C macros such as the macro functions in hpydef.h.

const std = @import("std");

// FIXME: There must be a zig stdlib function to replace this.
const abort = @cImport({
    @cInclude("stdlib.h");
}).abort;

const hpy = @import("./hpy_cimport.zig");
const abi = @import("config.zig").hpy_abi;
const cpython_abi = std.mem.eql(u8, abi, "HPY_ABI_CPYTHON");

/// Module slot definition helper. Replaces the "HPyDef_SLOT" macro.
pub fn Slot(comptime mod_ctx: *?*hpy.HPyContext, comptime impl: anytype, comptime slot: hpy.HPySlot_Slot) hpy.HPyDef {
    const slot_func_sig = SlotSignature(slot);
    var S = Func_TRAMPOLINE(mod_ctx, impl, slot_func_sig);

    const slot_definition = hpy.HPyDef{
        .kind = @as(hpy.HPyDef_Kind, @bitCast(hpy.HPyDef_Kind_Slot)),
        .unnamed_0 = .{
            .slot = hpy.HPySlot{
                .slot = @as(hpy.HPySlot_Slot, @bitCast(slot)), //_enum)),
                .impl = @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))),
                .cpy_trampoline = @as(hpy.cpy_PyCFunction, @ptrCast(@alignCast(&S.trampoline))),
            },
        },
    };
    return slot_definition;
}

/// Gets the function signature associated with the slot enum passed in.
pub fn SlotSignature(comptime slot: hpy.HPySlot_Slot) hpy.HPyFunc_Signature {
    return switch (slot) {
        hpy.HPy_bf_getbuffer => hpy.HPyFunc_GETBUFFERPROC,
        hpy.HPy_bf_releasebuffer => hpy.HPyFunc_RELEASEBUFFERPROC,
        hpy.HPy_mp_ass_subscript => hpy.HPyFunc_OBJOBJARGPROC,
        hpy.HPy_mp_length => hpy.HPyFunc_LENFUNC,
        hpy.HPy_mp_subscript => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_absolute => hpy.HPyFunc_UNARYFUNC,
        hpy.HPy_nb_add => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_and => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_bool => hpy.HPyFunc_INQUIRY,
        hpy.HPy_nb_divmod => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_float => hpy.HPyFunc_UNARYFUNC,
        hpy.HPy_nb_floor_divide => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_index => hpy.HPyFunc_UNARYFUNC,
        hpy.HPy_nb_inplace_add => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_inplace_and => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_inplace_floor_divide => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_inplace_lshift => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_inplace_multiply => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_inplace_or => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_inplace_power => hpy.HPyFunc_TERNARYFUNC,
        hpy.HPy_nb_inplace_remainder => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_inplace_rshift => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_inplace_subtract => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_inplace_true_divide => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_inplace_xor => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_int => hpy.HPyFunc_UNARYFUNC,
        hpy.HPy_nb_invert => hpy.HPyFunc_UNARYFUNC,
        hpy.HPy_nb_lshift => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_multiply => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_negative => hpy.HPyFunc_UNARYFUNC,
        hpy.HPy_nb_or => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_positive => hpy.HPyFunc_UNARYFUNC,
        hpy.HPy_nb_power => hpy.HPyFunc_TERNARYFUNC,
        hpy.HPy_nb_remainder => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_rshift => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_subtract => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_true_divide => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_xor => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_sq_ass_item => hpy.HPyFunc_SSIZEOBJARGPROC,
        hpy.HPy_sq_concat => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_sq_contains => hpy.HPyFunc_OBJOBJPROC,
        hpy.HPy_sq_inplace_concat => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_sq_inplace_repeat => hpy.HPyFunc_SSIZEARGFUNC,
        hpy.HPy_sq_item => hpy.HPyFunc_SSIZEARGFUNC,
        hpy.HPy_sq_length => hpy.HPyFunc_LENFUNC,
        hpy.HPy_sq_repeat => hpy.HPyFunc_SSIZEARGFUNC,
        hpy.HPy_tp_call => hpy.HPyFunc_KEYWORDS,
        hpy.HPy_tp_hash => hpy.HPyFunc_HASHFUNC,
        hpy.HPy_tp_init => hpy.HPyFunc_INITPROC,
        hpy.HPy_tp_new => hpy.HPyFunc_NEWFUNC,
        hpy.HPy_tp_repr => hpy.HPyFunc_REPRFUNC,
        hpy.HPy_tp_richcompare => hpy.HPyFunc_RICHCMPFUNC,
        hpy.HPy_tp_str => hpy.HPyFunc_REPRFUNC,
        hpy.HPy_tp_traverse => hpy.HPyFunc_TRAVERSEPROC,
        hpy.HPy_nb_matrix_multiply => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_nb_inplace_matrix_multiply => hpy.HPyFunc_BINARYFUNC,
        hpy.HPy_tp_finalize => hpy.HPyFunc_DESTRUCTOR,
        hpy.HPy_tp_destroy => hpy.HPyFunc_DESTROYFUNC,
        hpy.HPy_mod_create => hpy.HPyFunc_MOD_CREATE,
        hpy.HPy_mod_exec => hpy.HPyFunc_INQUIRY,
        else => @compileError("Unknown slot value. Unable to determine slot function signature."),
    };
}

/// Used for defining a module method. Replaces the "HPyDef_METH" macro.
pub fn Method(comptime mod_ctx: *?*hpy.HPyContext, comptime name: []const u8, comptime impl: anytype, comptime sig: hpy.HPyFunc_Signature) hpy.HPyDef {
    const S = Func_TRAMPOLINE(mod_ctx, impl, sig);

    return hpy.HPyDef{
        .kind = @as(hpy.HPyDef_Kind, @bitCast(hpy.HPyDef_Kind_Meth)),
        .unnamed_0 = .{
            .meth = hpy.HPyMeth{
                .name = @ptrCast(name),
                .impl = @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))),
                .cpy_trampoline = @as(hpy.cpy_PyCFunction, @ptrCast(@alignCast(&S.trampoline))),
                .signature = @as(hpy.HPyFunc_Signature, @bitCast(sig)),
                .doc = null,
            },
        },
    };
}

/// Convenience function for generating HPy Member definition. Replaces the "HPyDef_MEMBER" macro.
pub fn Member(comptime mod_ctx: *?*hpy.HPyContext, comptime name: []const u8, comptime field_type: hpy.HPyMember_FieldType, offset: comptime_int) hpy.HPyDef {
    // mod_ctx exists to maintain API symmetry with the other "HPyDef" functions, and to prevent
    // API breakage if it's needed in the future.
    _ = mod_ctx;
    return hpy.HPyDef{
        .kind = @as(hpy.HPyDef_Kind, @bitCast(hpy.HPyDef_Kind_Member)),
        .unnamed_0 = .{
            .member = hpy.HPyMeth{
                .name = @ptrCast(name),
                .type = @as(hpy.HPyMember_FieldType, @bitCast(field_type)),
                .offset = offset,
            },
        },
    };
}

/// Convenience function for generating HPy get descriptor. Replaces the "HPyDef_GET" macro.
pub fn Get(comptime mod_ctx: *?*hpy.HPyContext, comptime name: []const u8, comptime impl: anytype) hpy.HPyDef {
    const S = Func_TRAMPOLINE(mod_ctx, impl, hpy.HPyFunc_GETTER);

    return hpy.HPyDef{
        .kind = @as(hpy.HPyDef_Kind, @bitCast(hpy.HPyDef_Kind_GetSet)),
        .unnamed_0 = .{
            .getset = hpy.HPyGetSet{
                .name = @ptrCast(name),
                .getter_impl = @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))),
                .setter_impl = null,
                .getter_cpy_trampoline = @as(hpy.cpy_PyCFunction, @ptrCast(@alignCast(&S.trampoline))),
                .setter_cpy_trampoline = null,
                .doc = null,
                .closure = null,
            },
        },
    };
}

/// Convenience function for generating HPy set descriptor. Replaces the "HPyDef_SET" macro.
pub fn Set(comptime mod_ctx: *?*hpy.HPyContext, comptime name: []const u8, comptime impl: anytype) hpy.HPyDef {
    const S = Func_TRAMPOLINE(mod_ctx, impl, hpy.HPyFunc_SETTER);

    return hpy.HPyDef{
        .kind = @as(hpy.HPyDef_Kind, @bitCast(hpy.HPyDef_Kind_GetSet)),
        .unnamed_0 = .{
            .getset = hpy.HPyGetSet{
                .name = @ptrCast(name),
                .getter_impl = null,
                .setter_impl = @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))),
                .getter_cpy_trampoline = null,
                .setter_cpy_trampoline = @as(hpy.cpy_PyCFunction, @ptrCast(@alignCast(&S.trampoline))),
                .doc = null,
                .closure = null,
            },
        },
    };
}

/// Convenience function for generating HPy get-set descriptor. Replaces the "HPyDef_GETSET" macro.
pub fn GetSet(comptime mod_ctx: *?*hpy.HPyContext, comptime name: []const u8, comptime get_impl: anytype, comptime set_impl: anytype) hpy.HPyDef {
    const S1 = Func_TRAMPOLINE(mod_ctx, get_impl, hpy.HPyFunc_GETTER);
    const S2 = Func_TRAMPOLINE(mod_ctx, set_impl, hpy.HPyFunc_SETTER);

    return hpy.HPyDef{
        .kind = @as(hpy.HPyDef_Kind, @bitCast(hpy.HPyDef_Kind_GetSet)),
        .unnamed_0 = .{
            .getset = hpy.HPyGetSet{
                .name = @ptrCast(name),
                .getter_impl = @as(hpy.HPyCFunction, @ptrCast(@alignCast(&get_impl))),
                .getter_cpy_trampoline = @as(hpy.cpy_PyCFunction, @ptrCast(@alignCast(&S1.trampoline))),
                .setter_impl = @as(hpy.HPyCFunction, @ptrCast(@alignCast(&set_impl))),
                .setter_cpy_trampoline = @as(hpy.cpy_PyCFunction, @ptrCast(@alignCast(&S2.trampoline))),
                .signature = @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_GETTER)),
                .doc = null,
                .closure = null,
            },
        },
    };
}

/// Convenience function for generating an HPyCallFunction definition. Replaces the "HPyDef_CALL_FUNCTION" macro
pub fn CallFunction(comptime mod_ctx: *?*hpy.HPyContext, comptime name: []const u8, comptime impl: anytype) hpy.HPyCallFunction {
    _ = name;
    var S = Func_TRAMPOLINE(mod_ctx, impl, hpy.HPyFunc_KEYWORDS);
    const call_function_definition = hpy.HPyCallFunction{
        .cpy_trampoline = @as(hpy.cpy_vectorcallfunc, @ptrCast(@alignCast(&S.trampoline))),
        .impl = @as(hpy.HPyFunc_keywords, @ptrCast(@alignCast(&impl))),
    };
    return call_function_definition;
}

/// Emit a CPython-compatible trampoline which calls IMPL, where IMPL has the signature SIG.
/// Replaces the HPy macro "HPyFunc_TRAMPOLINE".
pub fn Func_TRAMPOLINE(comptime mod_ctx: *?*hpy.HPyContext, comptime impl: anytype, comptime sig: hpy.HPyFunc_Signature) type {
    if (cpython_abi) {
        return cpython_trampoline(impl, sig);
    } else {
        return hpy_trampoline(mod_ctx, impl, sig);
    }
}

inline fn cpython_trampoline(comptime impl: anytype, comptime sig: hpy.HPyFunc_Signature) type {
    var S = struct {};
    switch (sig) {
        hpy.HPyFunc_NOARGS => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    const func: hpy._HPyCFunction_NOARGS = @as(hpy._HPyCFunction_NOARGS, @ptrCast(@alignCast(&impl)));
                    return hpy._h2py(func.?(hpy._HPyGetContext(), hpy._py2h(self)));
                }
            };
        },
        hpy.HPyFunc_VARARGS => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, args: *const ?*hpy.cpy_PyObject, nargs: hpy.HPy_ssize_t) callconv(.C) ?*hpy.cpy_PyObject {
                    const func: hpy._HPyCFunction_VARARGS = @as(hpy._HPyCFunction_VARARGS, @ptrCast(@alignCast(&impl)));
                    return hpy._h2py(func.?(hpy._HPyGetContext(), hpy._py2h(self), hpy._arr_py2h(args), @as(usize, @bitCast(nargs))));
                }
            };
        },
        hpy.HPyFunc_KEYWORDS => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, args: *const ?*hpy.cpy_PyObject, nargs: usize, kwnames: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    const func: hpy._HPyCFunction_KEYWORDS = @as(hpy._HPyCFunction_KEYWORDS, @ptrCast(@alignCast(&impl)));
                    return hpy._h2py(func.?(hpy._HPyGetContext(), hpy._py2h(self), hpy._arr_py2h(args), @as(usize, @bitCast(hpy.PyVectorcall_NARGS(nargs))), hpy._py2h(kwnames)));
                }
            };
        },
        hpy.HPyFunc_O => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, arg: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    const func: hpy._HPyCFunction_O = @as(hpy._HPyCFunction_O, @ptrCast(@alignCast(&impl)));
                    return hpy._h2py(func.?(hpy._HPyGetContext(), hpy._py2h(self), hpy._py2h(arg)));
                }
            };
        },
        hpy.HPyFunc_DESTROYFUNC => {
            S = struct {
                pub fn trampoline() callconv(.C) noreturn {
                    abort();
                }
            };
        },
        hpy.HPyFunc_GETBUFFERPROC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.PyObject, arg1: ?*hpy.Py_buffer, arg2: c_int) callconv(.C) c_int {
                    const func: hpy._HPyCFunction_GETBUFFERPROC = @as(hpy._HPyCFunction_GETBUFFERPROC, @ptrCast(@alignCast(&impl)));
                    return func.?(hpy._HPyGetContext(), hpy._py2h(arg0), @as(?*hpy.HPy_buffer, @ptrCast(@alignCast(arg1))), arg2);
                }
            };
        },
        hpy.HPyFunc_RELEASEBUFFERPROC => {
            S = struct {
                pub fn say_hello_RELEASEBUFFERPROC(arg0: ?*hpy.PyObject, arg1: ?*hpy.Py_buffer) callconv(.C) void {
                    const func: hpy._HPyCFunction_RELEASEBUFFERPROC = @as(hpy._HPyCFunction_RELEASEBUFFERPROC, @ptrCast(@alignCast(&impl)));
                    _ = func.?(hpy._HPyGetContext(), hpy._py2h(arg0), @as(?*hpy.HPy_buffer, @ptrCast(@alignCast(arg1))));
                    return;
                }
            };
        },
        hpy.HPyFunc_UNARYFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    const func: hpy._HPyCFunction_UNARYFUNC = @as(hpy._HPyCFunction_UNARYFUNC, @ptrCast(@alignCast(&impl)));
                    return hpy._h2py(func.?(hpy._HPyGetContext(), hpy._py2h(arg0)));
                }
            };
        },
        hpy.HPyFunc_BINARYFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    const func: hpy._HPyCFunction_BINARYFUNC = @as(hpy._HPyCFunction_BINARYFUNC, @ptrCast(@alignCast(&impl)));
                    return hpy._h2py(func.?(hpy._HPyGetContext(), hpy._py2h(arg0), hpy._py2h(arg1)));
                }
            };
        },
        hpy.HPyFunc_TERNARYFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject, arg2: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    const func: hpy._HPyCFunction_TERNARYFUNC = @as(hpy._HPyCFunction_TERNARYFUNC, @ptrCast(@alignCast(&impl)));
                    return hpy._h2py(func.?(hpy._HPyGetContext(), hpy._py2h(arg0), hpy._py2h(arg1), hpy._py2h(arg2)));
                }
            };
        },
        hpy.HPyFunc_INQUIRY => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    const func: hpy._HPyCFunction_INQUIRY = @as(hpy._HPyCFunction_INQUIRY, @ptrCast(@alignCast(&impl)));
                    return func.?(hpy._HPyGetContext(), hpy._py2h(arg0));
                }
            };
        },
        hpy.HPyFunc_LENFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) hpy.HPy_ssize_t {
                    const func: hpy._HPyCFunction_LENFUNC = @as(hpy._HPyCFunction_LENFUNC, @ptrCast(@alignCast(&impl)));
                    return func.?(hpy._HPyGetContext(), hpy._py2h(arg0));
                }
            };
        },
        hpy.HPyFunc_SSIZEARGFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: hpy.HPy_ssize_t) callconv(.C) ?*hpy.cpy_PyObject {
                    const func: hpy._HPyCFunction_SSIZEARGFUNC = @as(hpy._HPyCFunction_SSIZEARGFUNC, @ptrCast(@alignCast(&impl)));
                    return hpy._h2py(func.?(hpy._HPyGetContext(), hpy._py2h(arg0), arg1));
                }
            };
        },
        hpy.HPyFunc_SSIZESSIZEARGFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: hpy.HPy_ssize_t, arg2: hpy.HPy_ssize_t) callconv(.C) ?*hpy.cpy_PyObject {
                    const func: hpy._HPyCFunction_SSIZESSIZEARGFUNC = @as(hpy._HPyCFunction_SSIZESSIZEARGFUNC, @ptrCast(@alignCast(&impl)));
                    return hpy._h2py(func.?(hpy._HPyGetContext(), hpy._py2h(arg0), arg1, arg2));
                }
            };
        },
        hpy.HPyFunc_SSIZEOBJARGPROC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: hpy.HPy_ssize_t, arg2: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    const func: hpy._HPyCFunction_SSIZEOBJARGPROC = @as(hpy._HPyCFunction_SSIZEOBJARGPROC, @ptrCast(@alignCast(&impl)));
                    return func.?(hpy._HPyGetContext(), hpy._py2h(arg0), arg1, hpy._py2h(arg2));
                }
            };
        },
        hpy.HPyFunc_SSIZESSIZEOBJARGPROC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: hpy.HPy_ssize_t, arg2: hpy.HPy_ssize_t, arg3: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    const func: hpy._HPyCFunction_SSIZESSIZEOBJARGPROC = @as(hpy._HPyCFunction_SSIZESSIZEOBJARGPROC, @ptrCast(@alignCast(&impl)));
                    return func.?(hpy._HPyGetContext(), hpy._py2h(arg0), arg1, arg2, hpy._py2h(arg3));
                }
            };
        },
        hpy.HPyFunc_OBJOBJARGPROC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject, arg2: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    const func: hpy._HPyCFunction_OBJOBJARGPROC = @as(hpy._HPyCFunction_OBJOBJARGPROC, @ptrCast(@alignCast(&impl)));
                    return func.?(hpy._HPyGetContext(), hpy._py2h(arg0), hpy._py2h(arg1), hpy._py2h(arg2));
                }
            };
        },
        hpy.HPyFunc_FREEFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*anyopaque) callconv(.C) void {
                    const func: hpy._HPyCFunction_FREEFUNC = @as(hpy._HPyCFunction_FREEFUNC, @ptrCast(@alignCast(&impl)));
                    func.?(hpy._HPyGetContext(), arg0);
                    return;
                }
            };
        },
        hpy.HPyFunc_GETATTRFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: [*:0]u8) callconv(.C) ?*hpy.cpy_PyObject {
                    const func: hpy._HPyCFunction_GETATTRFUNC = @as(hpy._HPyCFunction_GETATTRFUNC, @ptrCast(@alignCast(&impl)));
                    return hpy._h2py(func.?(hpy._HPyGetContext(), hpy._py2h(arg0), arg1));
                }
            };
        },
        hpy.HPyFunc_GETATTROFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    const func: hpy._HPyCFunction_GETATTROFUNC = @as(hpy._HPyCFunction_GETATTROFUNC, @ptrCast(@alignCast(&impl)));
                    return hpy._h2py(func.?(hpy._HPyGetContext(), hpy._py2h(arg0), hpy._py2h(arg1)));
                }
            };
        },
        hpy.HPyFunc_SETATTRFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: [*:0]u8, arg2: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    const func: hpy._HPyCFunction_SETATTRFUNC = @as(hpy._HPyCFunction_SETATTRFUNC, @ptrCast(@alignCast(&impl)));
                    return func.?(hpy._HPyGetContext(), hpy._py2h(arg0), arg1, hpy._py2h(arg2));
                }
            };
        },
        hpy.HPyFunc_SETATTROFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject, arg2: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    const func: hpy._HPyCFunction_SETATTROFUNC = @as(hpy._HPyCFunction_SETATTROFUNC, @ptrCast(@alignCast(&impl)));
                    return func.?(hpy._HPyGetContext(), hpy._py2h(arg0), hpy._py2h(arg1), hpy._py2h(arg2));
                }
            };
        },
        hpy.HPyFunc_REPRFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    const func: hpy._HPyCFunction_REPRFUNC = @as(hpy._HPyCFunction_REPRFUNC, @ptrCast(@alignCast(&impl)));
                    return hpy._h2py(func.?(hpy._HPyGetContext(), hpy._py2h(arg0)));
                }
            };
        },
        hpy.HPyFunc_HASHFUNC => {
            S = struct {
                pub fn HASHFUNC_trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) hpy.HPy_hash_t {
                    const func: hpy._HPyCFunction_HASHFUNC = @as(hpy._HPyCFunction_HASHFUNC, @ptrCast(@alignCast(&impl)));
                    return func.?(hpy._HPyGetContext(), hpy._py2h(arg0));
                }
            };
        },
        hpy.HPyFunc_RICHCMPFUNC => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, obj: ?*hpy.cpy_PyObject, op: hpy.HPy_RichCompOp) callconv(.C) ?*hpy.cpy_PyObject {
                    const func: hpy._HPyCFunction_RICHCMPFUNC = @as(hpy._HPyCFunction_RICHCMPFUNC, @ptrCast(@alignCast(&impl)));
                    return hpy._h2py(func.?(hpy._HPyGetContext(), hpy._py2h(self), hpy._py2h(obj), op));
                }
            };
        },
        hpy.HPyFunc_GETITERFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    const func: hpy._HPyCFunction_GETITERFUNC = @as(hpy._HPyCFunction_GETITERFUNC, @ptrCast(@alignCast(&impl)));
                    return hpy._h2py(func.?(hpy._HPyGetContext(), hpy._py2h(arg0)));
                }
            };
        },
        hpy.HPyFunc_ITERNEXTFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    const func: hpy._HPyCFunction_ITERNEXTFUNC = @as(hpy._HPyCFunction_ITERNEXTFUNC, @ptrCast(@alignCast(&impl)));
                    return hpy._h2py(func.?(hpy._HPyGetContext(), hpy._py2h(arg0)));
                }
            };
        },
        hpy.HPyFunc_DESCRGETFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject, arg2: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    const func: hpy._HPyCFunction_DESCRGETFUNC = @as(hpy._HPyCFunction_DESCRGETFUNC, @ptrCast(@alignCast(&impl)));
                    return hpy._h2py(func.?(hpy._HPyGetContext(), hpy._py2h(arg0), hpy._py2h(arg1), hpy._py2h(arg2)));
                }
            };
        },
        hpy.HPyFunc_DESCRSETFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject, arg2: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    const func: hpy._HPyCFunction_DESCRSETFUNC = @as(hpy._HPyCFunction_DESCRSETFUNC, @ptrCast(@alignCast(&impl)));
                    return func.?(hpy._HPyGetContext(), hpy._py2h(arg0), hpy._py2h(arg1), hpy._py2h(arg2));
                }
            };
        },
        // FIXME
        //hpy.HPyFunc_INITPROC => {
        //    S = struct {
        //        pub fn trampoline(self: ?*hpy.cpy_PyObject, args: ?*hpy.cpy_PyObject, kw: ?*hpy.cpy_PyObject) callconv(.C) c_int {
        //            var items: *const ?*hpy.PyObject = &(blk: {
        //                _ = blk_1: {
        //                    _ = @sizeOf(c_int);
        //                    break :blk_1 blk_2: {
        //                        break :blk_2 if (hpy.PyType_HasFeature(hpy.Py_TYPE(args), @as(c_ulong, 1) << @intCast(26)) != 0) {} else {
        //                            __assert_fail("PyTuple_Check(args)", "c_files/trampolines.c", @as(c_uint, @bitCast(@as(c_int, 38))), "int say_hello_INITPROC(PyObject *, PyObject *, PyObject *)");
        //                        };
        //                    };
        //                };
        //                break :blk @as(?*hpy.PyTupleObject, @ptrCast(@alignCast(args)));
        //            }).*.ob_item[@as(c_uint, @intCast(@as(c_int, 0)))];
        //            var nargs: hpy.Py_ssize_t = hpy.PyTuple_GET_SIZE(args);
        //            var func: hpy._HPyCFunction_INITPROC = @as(hpy._HPyCFunction_INITPROC, @ptrCast(@alignCast(&impl)));
        //            return func.?(hpy._HPyGetContext(), hpy._py2h(self), hpy._arr_py2h(items), nargs, hpy._py2h(kw));
        //        }
        //    };
        //},
        //hpy.HPyFunc_NEWFUNC => {
        //    S = struct {
        //        pub fn trampoline(self: ?*hpy.cpy_PyObject, args: ?*hpy.cpy_PyObject, kw: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
        //            var items: *const ?*hpy.PyObject = &(blk: {
        //                _ = blk_1: {
        //                    _ = @sizeOf(c_int);
        //                    break :blk_1 blk_2: {
        //                        break :blk_2 if (hpy.PyType_HasFeature(hpy.Py_TYPE(args), @as(c_ulong, 1) << @intCast(26)) != 0) {} else {
        //                            __assert_fail("PyTuple_Check(args)", "c_files/trampolines.c", @as(c_uint, @bitCast(@as(c_int, 39))), "PyObject *say_hello_NEWFUNC(PyObject *, PyObject *, PyObject *)");
        //                        };
        //                    };
        //                };
        //                break :blk @as(?*hpy.PyTupleObject, @ptrCast(@alignCast(args)));
        //            }).*.ob_item[@as(c_uint, @intCast(@as(c_int, 0)))];
        //            var nargs: hpy.Py_ssize_t = hpy.PyTuple_GET_SIZE(args);
        //            var func: hpy._HPyCFunction_NEWFUNC = @as(hpy._HPyCFunction_NEWFUNC, @ptrCast(@alignCast(&impl)));
        //            return hpy._h2py(func.?(hpy._HPyGetContext(), hpy._py2h(self), hpy._arr_py2h(items), nargs, hpy._py2h(kw)));
        //        }
        //    };
        //},
        hpy.HPyFunc_GETTER => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*anyopaque) callconv(.C) ?*hpy.cpy_PyObject {
                    const func: hpy._HPyCFunction_GETTER = @as(hpy._HPyCFunction_GETTER, @ptrCast(@alignCast(&impl)));
                    return hpy._h2py(func.?(hpy._HPyGetContext(), hpy._py2h(arg0), arg1));
                }
            };
        },
        hpy.HPyFunc_SETTER => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject, arg2: ?*anyopaque) callconv(.C) c_int {
                    const func: hpy._HPyCFunction_SETTER = @as(hpy._HPyCFunction_SETTER, @ptrCast(@alignCast(&impl)));
                    return func.?(hpy._HPyGetContext(), hpy._py2h(arg0), hpy._py2h(arg1), arg2);
                }
            };
        },
        hpy.HPyFunc_OBJOBJPROC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    const func: hpy._HPyCFunction_OBJOBJPROC = @as(hpy._HPyCFunction_OBJOBJPROC, @ptrCast(@alignCast(&impl)));
                    return func.?(hpy._HPyGetContext(), hpy._py2h(arg0), hpy._py2h(arg1));
                }
            };
        },
        hpy.HPyFunc_TRAVERSEPROC => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, visit: hpy.cpy_visitproc, arg: ?*anyopaque) callconv(.C) c_int {
                    return hpy.call_traverseproc_from_trampoline(@as(hpy.HPyFunc_traverseproc, @ptrCast(@alignCast(&impl))), self, visit, arg);
                }
            };
        },
        hpy.HPyFunc_DESTRUCTOR => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) void {
                    const func: hpy._HPyCFunction_DESTRUCTOR = @as(hpy._HPyCFunction_DESTRUCTOR, @ptrCast(@alignCast(&impl)));
                    func.?(hpy._HPyGetContext(), hpy._py2h(arg0));
                    return;
                }
            };
        },
        //hpy.HPyFunc_CAPSULE_DESTRUCTOR => {}, // FIXME
        //hpy.HPyFunc_VECTORCALLFUNC => {}, // FIXME
        hpy.HPyFunc_MOD_CREATE => {
            S = struct {
                pub fn trampoline(spec: ?*hpy.cpy_PyObject, def: ?*hpy.cpy_PyModuleDef) callconv(.C) ?*hpy.cpy_PyObject {
                    _ = @TypeOf(def);
                    var result: ?*hpy.cpy_PyObject = hpy._h2py(impl(hpy._HPyGetContext(), hpy._py2h(spec)));
                    hpy._HPyModule_CheckCreateSlotResult(&result);
                    return result;
                }
            };
        },
        else => {
            const msg =
                \\Helper function received an unsupported value for the 
                \\'func_sig' parameter.
            ;
            @compileError(msg);
        },
    }
    return S;
}

inline fn hpy_trampoline(comptime mod_ctx: *?*hpy.HPyContext, comptime impl: anytype, comptime sig: hpy.HPyFunc_Signature) type {
    var S = struct {};
    switch (sig) {
        hpy.HPyFunc_NOARGS => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_NOARGS{
                        .self = self,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(sig)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_VARARGS => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, args: *const ?*hpy.cpy_PyObject, nargs: hpy.HPy_ssize_t) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_VARARGS{
                        .self = self,
                        .args = args,
                        .nargs = nargs,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_VARARGS)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_KEYWORDS => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, args: *const ?*hpy.cpy_PyObject, nargs: usize, kwnames: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_KEYWORDS{
                        .self = self,
                        .args = args,
                        .nargsf = nargs,
                        .kwnames = kwnames,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_KEYWORDS)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_O => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, arg: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_O{
                        .self = self,
                        .arg = arg,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_O)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_DESTROYFUNC => {
            S = struct {
                pub fn trampoline() callconv(.C) noreturn {
                    abort();
                }
            };
        },
        hpy.HPyFunc_GETBUFFERPROC => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, view: ?*hpy.cpy_Py_buffer, flags: c_int) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_GETBUFFERPROC{
                        .self = self,
                        .view = view,
                        .flags = flags,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_GETBUFFERPROC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_RELEASEBUFFERPROC => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, view: ?*hpy.cpy_Py_buffer) callconv(.C) void {
                    var a = hpy._HPyFunc_args_RELEASEBUFFERPROC{
                        .self = self,
                        .view = view,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_RELEASEBUFFERPROC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return;
                }
            };
        },
        hpy.HPyFunc_UNARYFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_UNARYFUNC{
                        .arg0 = arg0,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_UNARYFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_BINARYFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_BINARYFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_BINARYFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_TERNARYFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject, arg2: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_TERNARYFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_TERNARYFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_INQUIRY => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_INQUIRY{
                        .arg0 = arg0,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_INQUIRY)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_LENFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) hpy.HPy_ssize_t {
                    var a = hpy._HPyFunc_args_LENFUNC{
                        .arg0 = arg0,
                        .result = std.mem.zeroes(hpy.HPy_ssize_t),
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_LENFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_SSIZEARGFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: hpy.HPy_ssize_t) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_SSIZEARGFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_SSIZEARGFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_SSIZESSIZEARGFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: hpy.HPy_ssize_t, arg2: hpy.HPy_ssize_t) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_SSIZESSIZEARGFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_SSIZESSIZEARGFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_SSIZEOBJARGPROC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: hpy.HPy_ssize_t, arg2: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_SSIZEOBJARGPROC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_SSIZEOBJARGPROC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_SSIZESSIZEOBJARGPROC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: hpy.HPy_ssize_t, arg2: hpy.HPy_ssize_t, arg3: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_SSIZESSIZEOBJARGPROC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .arg3 = arg3,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_SSIZESSIZEOBJARGPROC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_OBJOBJARGPROC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject, arg2: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_OBJOBJARGPROC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_OBJOBJARGPROC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_FREEFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*anyopaque) callconv(.C) void {
                    var a = hpy._HPyFunc_args_FREEFUNC{
                        .arg0 = arg0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_FREEFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return;
                }
            };
        },
        hpy.HPyFunc_GETATTRFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: [*:0]u8) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_GETATTRFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_GETATTRFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_GETATTROFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_GETATTROFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_GETATTROFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_SETATTRFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: [*:0]u8, arg2: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_SETATTRFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_SETATTRFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_SETATTROFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject, arg2: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_SETATTROFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_SETATTROFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_REPRFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_REPRFUNC{
                        .arg0 = arg0,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_REPRFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_HASHFUNC => {
            S = struct {
                pub fn HASHFUNC_trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) hpy.HPy_hash_t {
                    var a = hpy._HPyFunc_args_HASHFUNC{
                        .arg0 = arg0,
                        .result = std.mem.zeroes(hpy.HPy_hash_t),
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_HASHFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_RICHCMPFUNC => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, obj: ?*hpy.cpy_PyObject, op: hpy.HPy_RichCompOp) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_RICHCMPFUNC{
                        .arg0 = self,
                        .arg1 = obj,
                        .arg2 = @as(hpy.HPy_RichCompOp, @bitCast(op)),
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_RICHCMPFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_GETITERFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_GETITERFUNC{
                        .arg0 = arg0,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_GETITERFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_ITERNEXTFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_ITERNEXTFUNC{
                        .arg0 = arg0,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_ITERNEXTFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_DESCRGETFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject, arg2: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_DESCRGETFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_DESCRGETFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_DESCRSETFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject, arg2: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_DESCRSETFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_DESCRSETFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_INITPROC => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, args: ?*hpy.cpy_PyObject, kw: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_INITPROC{
                        .self = self,
                        .args = args,
                        .kw = kw,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_INITPROC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_NEWFUNC => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, args: ?*hpy.cpy_PyObject, kw: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_NEWFUNC{
                        .self = self,
                        .args = args,
                        .kw = kw,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_NEWFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_GETTER => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*anyopaque) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_GETTER{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_GETTER)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_SETTER => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject, arg2: ?*anyopaque) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_SETTER{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_SETTER)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_OBJOBJPROC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_OBJOBJPROC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_OBJOBJPROC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_TRAVERSEPROC => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, visit: hpy.cpy_visitproc, arg: ?*anyopaque) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_TRAVERSEPROC{
                        .self = self,
                        .visit = visit,
                        .arg = arg,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_TRAVERSEPROC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_DESTRUCTOR => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) void {
                    var a = hpy._HPyFunc_args_DESTRUCTOR{
                        .arg0 = arg0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_DESTRUCTOR)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return;
                }
            };
        },
        hpy.HPyFunc_CAPSULE_DESTRUCTOR => {
            S = struct {
                pub fn trampoline(capsule: ?*hpy.cpy_PyObject) callconv(.C) void {
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_CAPSULE_DESTRUCTOR)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(capsule)));
                }
            };
        },
        //hpy.HPyFunc_VECTORCALLFUNC, // FIXME
        hpy.HPyFunc_MOD_CREATE => {
            S = struct {
                pub fn trampoline(spec: ?*hpy.cpy_PyObject, def: ?*hpy.cpy_PyModuleDef) callconv(.C) ?*hpy.cpy_PyObject {
                    _ = @TypeOf(def);
                    var a = hpy._HPyFunc_args_UNARYFUNC{
                        .arg0 = spec,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(hpy.HPyFunc_Signature, @bitCast(hpy.HPyFunc_MOD_CREATE)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        else => {
            const msg =
                \\Helper function received an unsupported value for the 
                \\'func_sig' parameter.
            ;
            @compileError(msg);
        },
    }
    return S;
}

/// A convenience function for creating a helper function for the supplied type.
/// Replaces the "HPyType_HELPERS" macro.
pub fn Type_HELPERS(comptime custom_type: type, comptime shape: hpy.HPyType_BuiltinShape) type {
    // TODO: Add check that custom_type is an extern struct.

    const S = struct {
        pub const SHAPE = @as(hpy.HPyType_BuiltinShape, @bitCast(shape));
        pub fn objectHelper(ctx: ?*hpy.HPyContext, h: hpy.HPy) callconv(.C) ?*custom_type {
            return @as(?*custom_type, @ptrCast(@alignCast(hpy._HPy_AsStruct_Object(ctx, h))));
        }
    };
    return S;
}

/// A convenience type for creating a module definition in zig, rather than interop with the
/// C definition, HPyModuleDef.
pub const Module = extern struct {
    doc: [*:0]const u8 = "",
    size: hpy.HPy_ssize_t = 0,
    legacy_methods: ?*hpy.cpy_PyMethodDef = null,
    defines: [*:null]?*hpy.HPyDef,
    globals: ?[*:null]?*hpy.HPyGlobal = null,
};

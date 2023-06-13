const std = @import("std");
const fmt = std.fmt;
const testing = std.testing;

//const hpyh = @cImport({
//    @cDefine("HPY_ABI_UNIVERSAL", {});
//    @cInclude("hpy.h");
//})

const hpy = @import("hpy_universal.zig");
const HPy = hpy.HPy;
//const HPyDef = hpy.HPyDef;
const HPyMeth = hpy.HPyMeth;
const HPySlot = hpy.HPySlot;
const HPyMember = hpy.HPyMember;
const HPyGetSet = hpy.HPyGetSet;
const HPyDef_Kind_Meth = hpy.HPyDef_Kind_Meth;
//const union_unnamed_2 = hpy.union_unnamed_2;
const cpy_PyObject = hpy.cpy_PyObject;
const cpy_PyCFunction = hpy.cpy_PyCFunction;
const HPyCFunction = hpy.HPyCFunction;
const HPyFunc_NOARGS = hpy.HPyFunc_NOARGS;
const _HPyFunc_args_NOARGS = hpy._HPyFunc_args_NOARGS;
const _HPy_CallRealFunctionFromTrampoline = hpy._HPy_CallRealFunctionFromTrampoline;
const HPyModuleDef = hpy.HPyModuleDef;
const HPyContext = hpy.HPyContext;
const HPyUnicode_FromString = hpy.HPyUnicode_FromString;

const HPY_ABI_VERSION = hpy.HPY_ABI_VERSION;
const HPY_ABI_VERSION_MINOR = hpy.HPY_ABI_VERSION_MINOR;

extern var _ctx_for_trampolines: [*c]HPyContext;

//const say_hello = undefined; //HPyDef_METH("say_hello", HPyFunc_NOARGS);
pub const say_hello_impl_sig = HPyFunc_NOARGS;
export fn say_hello_impl(ctx: *HPyContext, self: HPy) HPy {
    _ = self;
    return HPyUnicode_FromString(ctx, "Hello world!");
}

pub const say_hello_trampoline_sig = HPyFunc_NOARGS;
export fn say_hello_trampoline(self: ?*cpy_PyObject) ?*cpy_PyObject {
    var a: _HPyFunc_args_NOARGS = _HPyFunc_args_NOARGS{
        .self = self,
        .result = null,
    };
    _HPy_CallRealFunctionFromTrampoline(_ctx_for_trampolines, @bitCast(c_uint, HPyFunc_NOARGS), @ptrCast(HPyCFunction, @alignCast(@import("std").meta.alignment(HPyCFunction), &say_hello_impl)), @ptrCast(?*anyopaque, &a));
    return a.result;
}

pub const HPyDef_Kind = enum(c_uint) {
    Slot = 1,
    Meth = 2,
    Member = 3,
    GetSet = 4,
};

const HPyDef_Val = extern union {
    slot: HPySlot,
    meth: HPyMeth,
    member: HPyMember,
    getset: HPyGetSet,
};

pub const HPyDef = extern struct {
    kind: HPyDef_Kind,
    val: HPyDef_Val,
};

pub export var say_hello: HPyDef = HPyDef{
    .kind = HPyDef_Kind.Meth,
    .val = HPyDef_Val{
        .meth = HPyMeth{
            .name = "say_hello",
            .impl = @ptrCast(HPyCFunction, @alignCast(@import("std").meta.alignment(HPyCFunction), &say_hello_impl)),
            .cpy_trampoline = @ptrCast(cpy_PyCFunction, @alignCast(@import("std").meta.alignment(cpy_PyCFunction), &say_hello_trampoline)),
            .signature = @bitCast(c_uint, HPyFunc_NOARGS),
            .doc = null,
        },
    },
};

pub const QuickstartMethods: [2]*HPyDef = [2]*HPyDef{
    &say_hello,
    null,
};

const quickstart_def: HPyModuleDef = HPyModuleDef{
    .doc = "HPy Quickstart Example",
    .size = 0,
    .legacy_methods = null,
    .defines = @ptrCast([*c][*c]HPyDef, @alignCast(@import("std").meta.alignment([*c][*c]HPyDef), &QuickstartMethods)),
    .globals = null,
};

//var ctx_for_trampolines: *HPyContext = undefined;
//
//fn HPyDef_METH(meth_name: []const u8, meth_sig: c_int) void {
//    std.debug.print("{s}\n", .{meth_name});
//    std.debug.print("{d}\n", .{meth_sig});
//}
//
//fn makeModuleTrampoline() fn () *cpy_PyObject {
//    const S = struct {
//        fn moduleTrampoline(self: *cpy_PyObject) *cpy_PyObject {
//            //var a: _HPyFunc_args_NOARGS a = {self};
//            //_HPy_CallRealFunctionFromTrampoline();
//            return self;
//        }
//    };
//    return S.moduleTrampoline;
//}

pub inline fn HPy_MODINIT(ext_name: []const u8, mod_def: HPyModuleDef) void {
    std.debug.print("{s}\n", .{ext_name});
    std.debug.print("{s}\n", .{@typeName(mod_def)});

    const getMajorVersion = makeGetRequiredHPyVersion(HPY_ABI_VERSION);
    const getMajorVersionFuncName = "get_required_hpy_major_version_" ++ ext_name;
    @export(getMajorVersion, .{
        .name = getMajorVersionFuncName,
        .linkage = .Strong,
    });

    const getMinorVersion = makeGetRequiredHPyVersion(HPY_ABI_VERSION_MINOR);
    const getMinorVersionFuncName = "get_required_hpy_minor_version_" ++ ext_name;
    @export(getMinorVersion, .{
        .name = getMinorVersionFuncName,
        .linkage = .Strong,
    });

    const initContext = makeHPyInitGlobalContext();
    const initContextFuncName = "HPyInitGlobalContext_" ++ ext_name;
    @export(initContext, .{
        .name = initContextFuncName,
        .linkage = .Strong,
    });

    const HPyInitModule = makeHPyInit(mod_def);
    const HPyInitModuleFuncName = "HPyInit_" ++ ext_name;
    @export(HPyInitModule, .{
        .name = HPyInitModuleFuncName,
        .linkage = .Strong,
    });
}

/// Return a function which returns the required HPy version
fn makeGetRequiredHPyVersion(comptime hpy_version: u32) fn () u32 {
    const S = struct {
        fn getRequiredHPyVersion() u32 {
            return hpy_version;
        }
    };
    return S.getRequiredHPyVersion;
}

/// Create a function which allows HPy to set the global context
fn makeHPyInitGlobalContext() fn () void {
    const S = struct {
        fn HPyInitGlobalContext(ctx: *HPyContext) void {
            _ctx_for_trampolines = ctx;
        }
    };
    return S.HPyInitGlobalContext;
}

/// Create a function to send the module definition to HPy
fn makeHPyInit(mod_def: HPyModuleDef) fn () *HPyModuleDef {
    const S = struct {
        fn HPyInit() *HPyModuleDef {
            return &mod_def;
        }
    };
    return S.HPyInit;
}

pub inline fn exportTest(name: []const u8) void {
    @export(add, .{
        .name = name,
        .linkage = .Strong,
    });
}

export fn add(a: i32, b: i32) i32 {
    return a + b;
}

comptime {
    exportTest("nameTesting");
}

test "basic add functionality" {
    try testing.expect(add(3, 7) == 10);
}

const std = @import("std");

const hpy = @import("./hpy.zig");
//const hpy = @import("./hpy.zig");
const HPyContext = hpy.HPyContext;
const HPy = hpy.HPy;
const HPyUnicode_FromString = hpy.HPyUnicode_FromString;
const cpy_PyObject = hpy.cpy_PyObject;
const _HPyFunc_args_NOARGS = hpy._HPyFunc_args_NOARGS;
const _HPy_CallRealFunctionFromTrampoline = hpy._HPy_CallRealFunctionFromTrampoline;
const HPyFunc_NOARGS = hpy.HPyFunc_NOARGS;
const HPyFunc_Signature = hpy.HPyFunc_Signature;
const HPyCFunction = hpy.HPyCFunction;
const HPyDef = hpy.HPyDef;
const HPyModuleDef = hpy.HPyModuleDef;
const HPyDef_Kind_Meth = hpy.HPyDef_Kind_Meth;
const HPy_ssize_t = hpy.HPy_ssize_t;
const HPyMeth = hpy.HPyMeth;
const cpy_PyCFunction = hpy.cpy_PyCFunction;
const HPY_ABI_VERSION = hpy.HPY_ABI_VERSION;
const HPY_ABI_VERSION_MINOR = hpy.HPY_ABI_VERSION_MINOR;

const HPyZigDef_METH = hpy.HPyZigDef_METH;
const HPyZig_MODINIT = hpy.HPyZig_MODINIT;
const HPyZig_InitGlobalContext = hpy.HPyZig_InitGlobalContext;

const ctx_for_trampolines = HPyZig_InitGlobalContext("quickstart_zig");

pub export var say_hello = HPyZigDef_METH(ctx_for_trampolines, "say_hello", say_hello_impl, HPyFunc_NOARGS);
pub fn say_hello_impl(ctx: ?*HPyContext, self: HPy) callconv(.C) HPy {
    _ = self;
    return HPyUnicode_FromString(ctx, "Hello world!");
}

pub var QuickstartCMethods: [2]?*HPyDef = [2]?*HPyDef{
    &say_hello,
    null,
};

pub var quickstart_zig_def: HPyModuleDef = HPyModuleDef{
    .doc = "HPy Quickstart Zig Example",
    .size = std.mem.zeroes(HPy_ssize_t),
    .legacy_methods = null,
    .defines = @as([*c][*c]HPyDef, @ptrCast(@alignCast(&QuickstartCMethods))),
    .globals = null,
};

comptime {
    HPyZig_MODINIT("quickstart_zig", &quickstart_zig_def);
}

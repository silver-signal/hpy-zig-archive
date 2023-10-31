const std = @import("std");

const hpy = @import("./hpy.zig");
const HPy = hpy.HPy;
const HPy_ssize_t = hpy.HPy_ssize_t;
const HPyDef = hpy.HPyDef;
const HPyContext = hpy.HPyContext;
const HPyModuleDef = hpy.HPyModuleDef;
const HPyFunc_NOARGS = hpy.HPyFunc_NOARGS;
const HPyUnicode_FromString = hpy.HPyUnicode_FromString;

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

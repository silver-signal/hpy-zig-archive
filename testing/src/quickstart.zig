const std = @import("std");

const hpy = @import("./hpy.zig");
const HPy = hpy.HPy;
const HPyDef = hpy.HPyDef;
const HPyContext = hpy.HPyContext;
const HPyFunc_NOARGS = hpy.HPyFunc_NOARGS;
const HPyUnicode_FromString = hpy.HPyUnicode_FromString;
const HPyZigModuleDef = hpy.HPyZigModuleDef;

const HPyZigDef_METH = hpy.HPyZigDef_METH;
const HPyZig_InitGlobalContext = hpy.HPyZig_InitGlobalContext;
const HPyZig_MODINIT = hpy.HPyZig_MODINIT;

const ctx_for_trampolines = HPyZig_InitGlobalContext("quickstart_zig");

pub export var say_hello = HPyZigDef_METH(ctx_for_trampolines, "say_hello", say_hello_impl, HPyFunc_NOARGS);
pub fn say_hello_impl(ctx: ?*HPyContext, self: HPy) callconv(.C) HPy {
    _ = self;
    return HPyUnicode_FromString(ctx, "Hello world!");
}

var QuickstartZigMethods = [_:null]?*HPyDef{
    &say_hello,
};

var quickstart_zig_def = HPyZigModuleDef{
    .doc = "HPy Quickstart Zig Example",
    .defines = &QuickstartZigMethods,
};

comptime {
    HPyZig_MODINIT("quickstart_zig", &quickstart_zig_def);
}

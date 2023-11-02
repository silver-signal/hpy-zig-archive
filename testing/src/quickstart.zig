const std = @import("std");

const hpy = @import("./hpy.zig");
const HPy = hpy.ffi.HPy;

const mod_ctx = hpy.helpers.initGlobalContext("quickstart_zig");

pub export var say_hello = hpy.helpers.Def_METH(mod_ctx, "say_hello", say_hello_impl, hpy.ffi.HPyFunc_NOARGS);
pub fn say_hello_impl(ctx: ?*hpy.ffi.HPyContext, self: HPy) callconv(.C) HPy {
    _ = self;
    return hpy.ffi.HPyUnicode_FromString(ctx, "Hello world!");
}

var QuickstartZigMethods = [_:null]?*hpy.ffi.HPyDef{
    &say_hello,
};

var quickstart_zig_def = hpy.helpers.ModuleDef{
    .doc = "HPy Quickstart Zig Example",
    .defines = &QuickstartZigMethods,
};

comptime {
    hpy.helpers.MODINIT("quickstart_zig", &quickstart_zig_def);
}

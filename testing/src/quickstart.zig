const std = @import("std");

const hpy = @import("./hpy.zig");
const HPy = hpy.HPy;

const module_ctx = hpy.initGlobalContext("quickstart_zig");

pub export var say_hello = hpy.Def_METH(module_ctx, "say_hello", say_hello_impl, hpy.Func_NOARGS);
pub fn say_hello_impl(ctx: ?*hpy.Context, self: HPy) callconv(.C) HPy {
    _ = self;
    return hpy.Unicode_FromString(ctx, "Hello world!");
}

var QuickstartZigMethods = [_:null]?*hpy.Def{
    &say_hello,
};

var quickstart_zig_def = hpy.ModuleDef{
    .doc = "HPy Quickstart Zig Example",
    .defines = &QuickstartZigMethods,
};

comptime {
    hpy.MODINIT("quickstart_zig", &quickstart_zig_def);
}

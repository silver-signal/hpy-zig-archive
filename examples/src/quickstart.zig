const std = @import("std");

const hpy = @import("./hpy-zig/src/hpy.zig");
const HPy = hpy.HPy;

var mod_ctx: ?*hpy.HPyContext = null;

var say_hello = hpy.def.Method(&mod_ctx, "say_hello", say_hello_impl, hpy.HPyFunc_NOARGS);
pub fn say_hello_impl(ctx: ?*hpy.HPyContext, self: HPy) callconv(.C) HPy {
    _ = self;
    return hpy.HPyUnicode_FromString(ctx, "Hello world!");
}

var QuickstartZigMethods = [_:null]?*hpy.HPyDef{
    &say_hello,
};

var quickstart_zig_def = hpy.def.Module{
    .doc = "HPy Quickstart Zig Example",
    .defines = &QuickstartZigMethods,
};

comptime {
    hpy.ModuleInit(&mod_ctx, "quickstart", &quickstart_zig_def);
}

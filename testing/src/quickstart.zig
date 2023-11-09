const std = @import("std");

const hpy = @import("./hpy.zig");
const HPy = hpy.HPy;

var mod_ctx: ?*hpy.HPyContext = null;

pub export var say_hello = hpy.helpers.Def_METH(&mod_ctx, "say_hello", say_hello_impl, hpy.HPyFunc_NOARGS);
pub fn say_hello_impl(ctx: ?*hpy.HPyContext, self: HPy) callconv(.C) HPy {
    _ = self;
    return hpy.HPyUnicode_FromString(ctx, "Hello world!");
}

var QuickstartZigMethods = [_:null]?*hpy.HPyDef{
    &say_hello,
};

var quickstart_zig_def = hpy.helpers.ModuleDef{
    .doc = "HPy Quickstart Zig Example",
    .defines = &QuickstartZigMethods,
};

comptime {
    hpy.helpers.MODINIT(&mod_ctx, "quickstart_zig", &quickstart_zig_def);
}

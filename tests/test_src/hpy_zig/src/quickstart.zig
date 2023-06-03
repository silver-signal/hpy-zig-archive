const std = @import("std");
const builtin = @import("builtin");
const testing = std.testing;

//const hpyh = @cImport({
//    @cDefine("HPY_ABI_UNIVERSAL", {});
//    @cInclude("hpy.h");
//})

const hpy = @import("hpy_universal.zig");
const HPy = hpy.HPy;
const HPyContext = hpy.HPyContext;
const HPyUnicode_FromString = hpy.HPyUnicode_FromString;

export fn add(a: i32, b: i32) i32 {
    return a + b;
}

export fn say_hello_impl(ctx: *HPyContext, self: HPy) HPy {
    _ = self;
    return HPyUnicode_FromString(ctx, "Hello world!");
}

pub inline fn exportTest(name: []const u8) void {
    @export(add, .{
        .name = name,
        .linkage = .Strong,
    });
}

//pub inline fn HPy_MODINIT(ext_name: []const u8, mod_def: struct) void {
//
//}

comptime {
    exportTest("nameTesting");
}

test "basic add functionality" {
    try testing.expect(add(3, 7) == 10);
}

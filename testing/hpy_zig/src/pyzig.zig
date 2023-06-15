const std = @import("std");
const builtin = @import("builtin");
const testing = std.testing;

const hpy = @cImport({
    @cDefine("HPY_ABI_UNIVERSAL", {});
    @cInclude("hpy.h");
});

const HPY_ABI_VERSION = hpy.HPY_ABI_VERSION;
const HPY_ABI_VERSION_MINOR = hpy.HPY_ABI_VERSION_MINOR;

pub inline fn exportTest(name: []const u8) void {
    @export(add, .{
        .name = name,
        .linkage = .Strong,
    });
}

comptime {
    exportTest("say_hello");
}

export fn say_hello_impl() void {
    std.debug.print("Hello, world!", {});
}

test "basic add functionality" {
    std.debug.print("\n", .{});
    try testing.expect(HPY_ABI_VERSION == 0);
    std.debug.print("{d}\n", .{HPY_ABI_VERSION});
    try testing.expect(HPY_ABI_VERSION_MINOR == 0);
    std.debug.print("{d}\n", .{HPY_ABI_VERSION_MINOR});
}

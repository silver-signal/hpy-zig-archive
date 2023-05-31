const std = @import("std");
const builtin = @import("builtin");
const testing = std.testing;

export fn add(a: i32, b: i32) i32 {
    return a + b;
}

pub inline fn exportTest(name: []const u8) void {
    @export(add, .{
        .name = name,
        .linkage = .Strong,
    });
}

export fn @"A function name that is a complete sentence"() void {}

comptime {
    const myname = "nameTesting";
    exportTest(myname);
}

test "basic add functionality" {
    try testing.expect(add(3, 7) == 10);
}

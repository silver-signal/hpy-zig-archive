const hpy = @import("../hpy_cimport.zig");

const c_lib = @cImport({
    @cInclude("string.h");
    @cInclude("stdlib.h");
    @cInclude("assert.h");
});

const memset = c_lib.memset;
const malloc = c_lib.malloc;
const realloc = c_lib.realloc;
const free = c_lib.free;
const assert = c_lib.assert;

pub const StrWriter = extern struct {
    data_utf8: [*c]u8,
    size: hpy.HPy_ssize_t,
    pos: hpy.HPy_ssize_t,
    memory_error: bool,
};
pub fn StrWriter_Init(arg_writer: [*c]StrWriter, arg_init_size: hpy.HPy_ssize_t) callconv(.C) void {
    var writer = arg_writer;
    var init_size = arg_init_size;
    _ = memset(@as(?*anyopaque, @ptrCast(writer)), @as(c_int, 0), @sizeOf(StrWriter));
    writer.*.data_utf8 = @as([*c]u8, @ptrCast(@alignCast(malloc(@as(c_ulong, @bitCast(init_size))))));
    writer.*.size = init_size;
}
pub fn StrWriter_EnsureSpace(arg_writer: [*c]StrWriter, arg_len: hpy.HPy_ssize_t) callconv(.C) bool {
    var writer = arg_writer;
    var len = arg_len;
    if (len < (writer.*.size - writer.*.pos)) return @as(c_int, 1) != 0;
    var add: hpy.HPy_ssize_t = @divTrunc(writer.*.size, @as(hpy.HPy_ssize_t, @bitCast(@as(c_long, @as(c_int, 4)))));
    if (len > add) {
        add = len;
    }
    writer.*.size += add;
    if (writer.*.size < @as(hpy.HPy_ssize_t, @bitCast(@as(c_long, @as(c_int, 0))))) {
        writer.*.size = @as(c_long, 9223372036854775807);
    }
    var prev: [*c]u8 = writer.*.data_utf8;
    writer.*.data_utf8 = @as([*c]u8, @ptrCast(@alignCast(realloc(@as(?*anyopaque, @ptrCast(writer.*.data_utf8)), @as(c_ulong, @bitCast(writer.*.size))))));
    if (!(writer.*.data_utf8 != null)) {
        free(@as(?*anyopaque, @ptrCast(prev)));
        writer.*.memory_error = @as(c_int, 1) != 0;
        return @as(c_int, 0) != 0;
    }
    return @as(c_int, 1) != 0;
}
pub fn StrWriter_WriteCharRaw(arg_writer: [*c]StrWriter, c: c_int) callconv(.C) void {
    var writer = arg_writer;
    _ = blk: {
        _ = @sizeOf(c_int);
        break :blk blk_1: {
            break :blk_1 if ((writer.*.size - writer.*.pos) > @as(hpy.HPy_ssize_t, @bitCast(@as(c_long, @as(c_int, 0))))) {} else {
                assert("(writer->size - writer->pos) > 0", "c_files/format.c", @as(c_uint, @bitCast(@as(c_int, 213))), "void StrWriter_WriteCharRaw(StrWriter *, const int)");
            };
        };
    };
    (blk: {
        const tmp = blk_1: {
            const ref = &writer.*.pos;
            const tmp_2 = ref.*;
            ref.* += 1;
            break :blk_1 tmp_2;
        };
        if (tmp >= 0) break :blk writer.*.data_utf8 + @as(usize, @intCast(tmp)) else break :blk writer.*.data_utf8 - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
    }).* = @as(u8, @bitCast(@as(i8, @truncate(c))));
}
pub fn StrWriter_WriteChar(arg_writer: [*c]StrWriter, c: c_int) callconv(.C) bool {
    var writer = arg_writer;
    if (!StrWriter_EnsureSpace(writer, @as(hpy.HPy_ssize_t, @bitCast(@as(c_long, @as(c_int, 1)))))) return @as(c_int, 0) != 0;
    StrWriter_WriteCharRaw(writer, c);
    return @as(c_int, 1) != 0;
}
pub fn StrWriter_WriteCharNRaw(arg_writer: [*c]StrWriter, arg_c: u8, arg_n: hpy.HPy_ssize_t) callconv(.C) void {
    var writer = arg_writer;
    var c = arg_c;
    var n = arg_n;
    _ = blk: {
        _ = @sizeOf(c_int);
        break :blk blk_1: {
            break :blk_1 if ((writer.*.size - writer.*.pos) >= n) {} else {
                assert("(writer->size - writer->pos) >= n", "c_files/format.c", @as(c_uint, @bitCast(@as(c_int, 227))), "void StrWriter_WriteCharNRaw(StrWriter *, char, hpy.HPy_ssize_t)");
            };
        };
    };
    _ = memset(@as(?*anyopaque, @ptrCast(writer.*.data_utf8 + @as(usize, @bitCast(@as(isize, @intCast(writer.*.pos)))))), @as(c_int, @bitCast(@as(c_uint, c))), @as(c_ulong, @bitCast(n)));
    writer.*.pos += n;
}
pub fn StrWriter_WriteRaw(arg_writer: [*c]StrWriter, arg_utf8: [*c]const u8, arg_len: hpy.HPy_ssize_t) callconv(.C) void {
    var writer = arg_writer;
    var utf8 = arg_utf8;
    var len = arg_len;
    _ = blk: {
        _ = @sizeOf(c_int);
        break :blk blk_1: {
            break :blk_1 if ((writer.*.size - writer.*.pos) >= len) {} else {
                assert("(writer->size - writer->pos) >= len", "c_files/format.c", @as(c_uint, @bitCast(@as(c_int, 234))), "void StrWriter_WriteRaw(StrWriter *, const char *, HPy_ssize_t)");
            };
        };
    };
    _ = memcpy(@as(?*anyopaque, @ptrCast(writer.*.data_utf8 + @as(usize, @bitCast(@as(isize, @intCast(writer.*.pos)))))), @as(?*const anyopaque, @ptrCast(utf8)), @as(c_ulong, @bitCast(len)));
    writer.*.pos += len;
}
pub fn StrWriter_Write(arg_writer: [*c]StrWriter, arg_utf8: [*c]const u8, arg_len: hpy.HPy_ssize_t) callconv(.C) bool {
    var writer = arg_writer;
    var utf8 = arg_utf8;
    var len = arg_len;
    if (!StrWriter_EnsureSpace(writer, len)) return @as(c_int, 0) != 0;
    StrWriter_WriteRaw(writer, utf8, len);
    return @as(c_int, 1) != 0;
}
pub fn StrWriter_WriteWithWidth(arg_writer: [*c]StrWriter, arg_utf8: [*c]const u8, arg_length: hpy.HPy_ssize_t, arg_width: hpy.HPy_ssize_t, arg_precision: hpy.HPy_ssize_t) callconv(.C) bool {
    var writer = arg_writer;
    var utf8 = arg_utf8;
    var length = arg_length;
    var width = arg_width;
    var precision = arg_precision;
    _ = blk: {
        _ = @sizeOf(c_int);
        break :blk blk_1: {
            break :blk_1 if (utf8 != @as([*c]const u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) {} else {
                assert("utf8 != NULL", "c_files/format.c", @as(c_uint, @bitCast(@as(c_int, 250))), "_Bool StrWriter_WriteWithWidth(StrWriter *, const char *, HPy_ssize_t, HPy_ssize_t, HPy_ssize_t)");
            };
        };
    };
    if (((precision == @as(hpy.HPy_ssize_t, @bitCast(@as(c_long, -@as(c_int, 1))))) or (precision >= length)) and (width <= length)) {
        return StrWriter_Write(writer, utf8, length);
    }
    if (precision != @as(hpy.HPy_ssize_t, @bitCast(@as(c_long, -@as(c_int, 1))))) {
        length = if (precision < length) precision else length;
    }
    var arglen: hpy.HPy_ssize_t = if (length > width) length else width;
    if (!StrWriter_EnsureSpace(writer, arglen)) return @as(c_int, 0) != 0;
    if (width > length) {
        var fill: hpy.HPy_ssize_t = width - length;
        StrWriter_WriteCharNRaw(writer, @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, ' '))))), fill);
    }
    _ = blk: {
        _ = @sizeOf(c_int);
        break :blk blk_1: {
            break :blk_1 if ((writer.*.size - writer.*.pos) >= length) {} else {
                assert("(writer->size - writer->pos) >= length", "c_files/format.c", @as(c_uint, @bitCast(@as(c_int, 268))), "_Bool StrWriter_WriteWithWidth(StrWriter *, const char *, HPy_ssize_t, HPy_ssize_t, HPy_ssize_t)");
            };
        };
    };
    _ = memcpy(@as(?*anyopaque, @ptrCast(writer.*.data_utf8 + @as(usize, @bitCast(@as(isize, @intCast(writer.*.pos)))))), @as(?*const anyopaque, @ptrCast(utf8)), @as(c_ulong, @bitCast(length)));
    writer.*.pos += length;
    return @as(c_int, 1) != 0;
}
pub fn StrWriter_WriteUnicode(arg_ctx: [*c]hpy.HPyContext, arg_writer: [*c]StrWriter, arg_h: hpy.HPy, arg_width: hpy.HPy_ssize_t, arg_precision: hpy.HPy_ssize_t) callconv(.C) bool {
    var ctx = arg_ctx;
    var writer = arg_writer;
    var h = arg_h;
    var width = arg_width;
    var precision = arg_precision;
    _ = blk: {
        _ = @sizeOf(c_int);
        break :blk blk_1: {
            break :blk_1 if (!(h._i == @as(isize, @bitCast(@as(c_long, @as(c_int, 0))))) and (hpy.HPyUnicode_Check(ctx, h) != 0)) {} else {
                assert("!HPy_IsNull(h) && HPyUnicode_Check(ctx, h)", "c_files/format.c", @as(c_uint, @bitCast(@as(c_int, 277))), "_Bool StrWriter_WriteUnicode(HPyContext *, StrWriter *, HPy, HPy_ssize_t, HPy_ssize_t)");
            };
        };
    };
    var u_size: hpy.HPy_ssize_t = undefined;
    var u_str: [*c]const u8 = hpy.HPyUnicode_AsUTF8AndSize(ctx, h, &u_size);
    if (!(u_str != null)) return @as(c_int, 0) != 0;
    var length: hpy.HPy_ssize_t = hpy.HPy_Length(ctx, h);
    if (((precision == @as(hpy.HPy_ssize_t, @bitCast(@as(c_long, -@as(c_int, 1))))) or (precision >= length)) and (width <= length)) {
        return StrWriter_Write(writer, u_str, u_size);
    }
    if (precision != @as(hpy.HPy_ssize_t, @bitCast(@as(c_long, -@as(c_int, 1))))) {
        length = if (precision < length) precision else length;
    }
    var extra: hpy.HPy_ssize_t = length - u_size;
    var arglen: hpy.HPy_ssize_t = (if (length > width) length else width) + extra;
    if (!StrWriter_EnsureSpace(writer, arglen)) return @as(c_int, 0) != 0;
    if (width > length) {
        var fill: hpy.HPy_ssize_t = width - length;
        StrWriter_WriteCharNRaw(writer, @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, ' '))))), fill);
    }
    if ((length == u_size) or (precision == @as(hpy.HPy_ssize_t, @bitCast(@as(c_long, -@as(c_int, 1)))))) {
        return StrWriter_Write(writer, u_str, u_size);
    } else {
        var chars_count: hpy.HPy_ssize_t = 0;
        while (chars_count < precision) {
            _ = blk: {
                _ = @sizeOf(c_int);
                break :blk blk_1: {
                    break :blk_1 if (chars_count < u_size) {} else {
                        assert("chars_count < u_size", "c_files/format.c", @as(c_uint, @bitCast(@as(c_int, 309))), "_Bool StrWriter_WriteUnicode(HPyContext *, StrWriter *, HPy, HPy_ssize_t, HPy_ssize_t)");
                    };
                };
            };
            _ = blk: {
                _ = @sizeOf(c_int);
                break :blk blk_1: {
                    break :blk_1 if ((writer.*.size - writer.*.pos) > @as(hpy.HPy_ssize_t, @bitCast(@as(c_long, @as(c_int, 0))))) {} else {
                        assert("(writer->size - writer->pos) > 0", "c_files/format.c", @as(c_uint, @bitCast(@as(c_int, 310))), "_Bool StrWriter_WriteUnicode(HPyContext *, StrWriter *, HPy, HPy_ssize_t, HPy_ssize_t)");
                    };
                };
            };
            (blk: {
                const tmp = blk_1: {
                    const ref = &writer.*.pos;
                    const tmp_2 = ref.*;
                    ref.* += 1;
                    break :blk_1 tmp_2;
                };
                if (tmp >= 0) break :blk writer.*.data_utf8 + @as(usize, @intCast(tmp)) else break :blk writer.*.data_utf8 - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).* = u_str.*;
            if ((@as(c_int, @bitCast(@as(c_uint, u_str.*))) & @as(c_int, 192)) != @as(c_int, 128)) {
                chars_count += 1;
            }
            u_str += 1;
        }
        return @as(c_int, 1) != 0;
    }
    return false;
}
pub fn StrWriter_DupAndWriteUnicode(arg_ctx: [*c]hpy.HPyContext, arg_writer: [*c]StrWriter, arg_h_unicode: hpy.HPy, arg_width: hpy.HPy_ssize_t, arg_precision: hpy.HPy_ssize_t) callconv(.C) bool {
    var ctx = arg_ctx;
    var writer = arg_writer;
    var h_unicode = arg_h_unicode;
    var width = arg_width;
    var precision = arg_precision;
    var h: hpy.HPy = hpy.HPy_Dup(ctx, h_unicode);
    var u_result: bool = StrWriter_WriteUnicode(ctx, writer, h, width, precision);
    hpy.HPy_Close(ctx, h);
    return u_result;
}
pub fn StrWriter_WriteFunResult(arg_ctx: [*c]hpy.HPyContext, arg_writer: [*c]StrWriter, arg_fun: ?*const fn ([*c]hpy.HPyContext, hpy.HPy) callconv(.C) hpy.HPy, arg_arg: hpy.HPy, arg_width: hpy.HPy_ssize_t, arg_precision: hpy.HPy_ssize_t) callconv(.C) bool {
    var ctx = arg_ctx;
    var writer = arg_writer;
    var fun = arg_fun;
    var arg = arg_arg;
    var width = arg_width;
    var precision = arg_precision;
    if (arg._i == @as(isize, @bitCast(@as(c_long, @as(c_int, 0))))) {
        _ = hpy.HPyErr_SetString(ctx, ctx.*.h_SystemError, "hpy.HPy_NULL passed as value for formatting unit '%S' or '%R' or '%A'");
        return @as(c_int, 0) != 0;
    }
    var h: hpy.HPy = fun.?(ctx, arg);
    if (h._i == @as(isize, @bitCast(@as(c_long, @as(c_int, 0))))) return @as(c_int, 0) != 0;
    var u_result: bool = StrWriter_WriteUnicode(ctx, writer, h, width, precision);
    hpy.HPy_Close(ctx, h);
    return u_result;
}
pub fn StrWriter_Close(arg_writer: [*c]StrWriter) callconv(.C) void {
    var writer = arg_writer;
    free(@as(?*anyopaque, @ptrCast(writer.*.data_utf8)));
    writer.*.data_utf8 = null;
}
pub fn StrWriter_ToUnicode(arg_ctx: [*c]hpy.HPyContext, arg_writer: [*c]StrWriter) callconv(.C) hpy.HPy {
    var ctx = arg_ctx;
    var writer = arg_writer;
    if ((writer.*.data_utf8 == @as([*c]u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) and !writer.*.memory_error) {
        return hpy.HPy{
            ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
        };
    }
    if ((@as(c_int, @intFromBool(writer.*.memory_error)) != 0) or !StrWriter_Write(writer, "\x00", @as(hpy.HPy_ssize_t, @bitCast(@as(c_long, @as(c_int, 1)))))) {
        _ = hpy.HPyErr_SetString(ctx, ctx.*.h_MemoryError, "cannot allocate memory for string format");
        return hpy.HPy{
            ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
        };
    }
    var result: hpy.HPy = hpy.HPyUnicode_FromString(ctx, writer.*.data_utf8);
    StrWriter_Close(writer);
    return result;
} // /home/f-cozzocrea/projects/hpy-zig/venv/hpy-zig/lib/python3.11/site-packages/ziglang/lib/include/stdarg.h:36:29: warning: unsupported stmt class VAArgExprClass

// c_files/format.c:368:1: warning: unable to translate function, demoted to extern
//pub extern fn unicode_fromformat_arg(arg_ctx: [*c]hpy.HPyContext, arg_writer: [*c]StrWriter, arg_f: [*c]const u8, arg_vargs: [*c]va_list) callconv(.C) [*c]const u8;

const hpy = @import("../hpy_cimport.zig");

const stdio = @cImport({
    @cInclude("stdio.h");
});
const snprintf = stdio.snprintf;

const struct___va_list_tag = extern struct {
    gp_offset: c_uint,
    fp_offset: c_uint,
    overflow_arg_area: ?*anyopaque,
    reg_save_area: ?*anyopaque,
};
const __builtin_va_list = [1]struct___va_list_tag;
const __gnuc_va_list = __builtin_va_list;
const va_list = __builtin_va_list;

pub fn count_items(ctx: [*c]hpy.HPyContext, fmt: [*c]const u8, end: u8) callconv(.C) hpy.HPy_ssize_t {
    var level: hpy.HPy_ssize_t = 0;
    var result: hpy.HPy_ssize_t = 0;
    var top_level_par: u8 = 'X';
    while ((level != @as(hpy.HPy_ssize_t, @bitCast(@as(c_long, @as(c_int, 0))))) or (@as(c_int, @bitCast(@as(c_uint, fmt.*))) != @as(c_int, @bitCast(@as(c_uint, end))))) {
        var c: u8 = (blk: {
            const ref = &fmt;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).*;
        while (true) {
            switch (@as(c_int, @bitCast(@as(c_uint, c)))) {
                @as(c_int, 0) => {
                    {
                        var msg: [128]u8 = undefined;
                        var par_type: u8 = undefined;
                        if (@as(c_int, @bitCast(@as(c_uint, end))) == @as(c_int, ')')) {
                            par_type = '(';
                        } else if (@as(c_int, @bitCast(@as(c_uint, end))) == @as(c_int, ']')) {
                            par_type = '[';
                        } else if (@as(c_int, @bitCast(@as(c_uint, end))) == @as(c_int, '}')) {
                            par_type = '{';
                        } else {
                            if ((level == @as(hpy.HPy_ssize_t, @bitCast(@as(c_long, @as(c_int, 0))))) or (@as(c_int, @bitCast(@as(c_uint, top_level_par))) == @as(c_int, 'X'))) {
                                _ = hpy.HPyErr_SetString(ctx, ctx.*.h_SystemError, "internal error in HPy_BuildValue");
                                return @as(hpy.HPy_ssize_t, @bitCast(@as(c_long, -@as(c_int, 1))));
                            }
                            par_type = top_level_par;
                        }
                        _ = snprintf(@as([*c]u8, @ptrCast(@alignCast(&msg))), @sizeOf([128]u8), "unmatched '%c' in the format string passed to HPy_BuildValue", @as(c_int, @bitCast(@as(c_uint, par_type))));
                        _ = hpy.HPyErr_SetString(ctx, ctx.*.h_SystemError, @as([*c]u8, @ptrCast(@alignCast(&msg))));
                        return @as(hpy.HPy_ssize_t, @bitCast(@as(c_long, -@as(c_int, 1))));
                    }
                },
                @as(c_int, 91), @as(c_int, 40), @as(c_int, 123) => {
                    if (level == @as(hpy.HPy_ssize_t, @bitCast(@as(c_long, @as(c_int, 0))))) {
                        top_level_par = c;
                        result += 1;
                    }
                    level += 1;
                    break;
                },
                @as(c_int, 93), @as(c_int, 41), @as(c_int, 125) => {
                    level -= 1;
                    break;
                },
                @as(c_int, 44), @as(c_int, 32) => break,
                else => {
                    if (level == @as(hpy.HPy_ssize_t, @bitCast(@as(c_long, @as(c_int, 0))))) {
                        result += 1;
                    }
                },
            }
            break;
        }
    }
    return result;
}

pub fn build_tuple(ctx: [*c]hpy.HPyContext, fmt: [*c][*c]const u8, values: [*c]va_list, size: hpy.HPy_ssize_t, expected_end: u8) callconv(.C) hpy.HPy {
    var builder: hpy.HPyTupleBuilder = hpy.HPyTupleBuilder_New(ctx, size);
    {
        var i: hpy.HPy_ssize_t = 0;
        while (i < size) : (i += 1) {
            var needs_close: c_int = undefined;
            var item: hpy.HPy = hpy.build_single(ctx, fmt, values, &needs_close);
            if (item._i == @as(isize, @bitCast(@as(c_long, @as(c_int, 0))))) {
                hpy.HPyTupleBuilder_Cancel(ctx, builder);
                return hpy.HPy{
                    ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
                };
            }
            hpy.HPyTupleBuilder_Set(ctx, builder, i, item);
            if (needs_close != 0) {
                hpy.HPy_Close(ctx, item);
            }
            if (@as(c_int, @bitCast(@as(c_uint, fmt.*.*))) == @as(c_int, ',')) {
                fmt.* += 1;
            }
        }
    }
    if (@as(c_int, @bitCast(@as(c_uint, fmt.*.*))) != @as(c_int, @bitCast(@as(c_uint, expected_end)))) {
        hpy.HPyTupleBuilder_Cancel(ctx, builder);
        if (@as(c_int, @bitCast(@as(c_uint, expected_end))) == @as(c_int, '\x00')) {
            _ = hpy.HPyErr_SetString(ctx, ctx.*.h_SystemError, "internal error in HPy_BuildValue");
        } else {
            _ = hpy.HPyErr_SetString(ctx, ctx.*.h_SystemError, "unmatched '[' in the format string passed to HPy_BuildValue");
        }
        return hpy.HPy{
            ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
        };
    }
    if (@as(c_int, @bitCast(@as(c_uint, expected_end))) != @as(c_int, '\x00')) {
        fmt.* += 1;
    }
    return hpy.HPyTupleBuilder_Build(ctx, builder);
}
pub fn build_list(ctx: [*c]hpy.HPyContext, fmt: [*c][*c]const u8, values: [*c]va_list, size: hpy.HPy_ssize_t) callconv(.C) hpy.HPy {
    var builder: hpy.HPyListBuilder = hpy.HPyListBuilder_New(ctx, size);
    {
        var i: hpy.HPy_ssize_t = 0;
        while (i < size) : (i += 1) {
            var needs_close: c_int = undefined;
            var item: hpy.HPy = hpy.build_single(ctx, fmt, values, &needs_close);
            if (item._i == @as(isize, @bitCast(@as(c_long, @as(c_int, 0))))) {
                hpy.HPyListBuilder_Cancel(ctx, builder);
                return hpy.HPy{
                    ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
                };
            }
            hpy.HPyListBuilder_Set(ctx, builder, i, item);
            if (needs_close != 0) {
                hpy.HPy_Close(ctx, item);
            }
            if (@as(c_int, @bitCast(@as(c_uint, fmt.*.*))) == @as(c_int, ',')) {
                fmt.* += 1;
            }
        }
    }
    if (@as(c_int, @bitCast(@as(c_uint, fmt.*.*))) != @as(c_int, ']')) {
        hpy.HPyListBuilder_Cancel(ctx, builder);
        _ = hpy.HPyErr_SetString(ctx, ctx.*.h_SystemError, "unmatched '[' in the format string passed to HPy_BuildValue");
        return hpy.HPy{
            ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
        };
    }
    fmt.* += 1;
    return hpy.HPyListBuilder_Build(ctx, builder);
}
pub fn build_dict(ctx: [*c]hpy.HPyContext, fmt: [*c][*c]const u8, values: [*c]va_list) callconv(.C) hpy.HPy {
    var dict: hpy.HPy = hpy.HPyDict_New(ctx);
    var expect_comma: c_int = 0;
    while ((@as(c_int, @bitCast(@as(c_uint, fmt.*.*))) != @as(c_int, '}')) and (@as(c_int, @bitCast(@as(c_uint, fmt.*.*))) != @as(c_int, '\x00'))) {
        if (@as(c_int, @bitCast(@as(c_uint, fmt.*.*))) == @as(c_int, ' ')) {
            fmt.* += 1;
            continue;
        }
        if (@as(c_int, @bitCast(@as(c_uint, fmt.*.*))) == @as(c_int, ',')) {
            if (!(expect_comma != 0)) {
                _ = hpy.HPyErr_SetString(ctx, ctx.*.h_SystemError, "unexpected ',' in the format string passed to HPy_BuildValue");
                hpy.HPy_Close(ctx, dict);
                return hpy.HPy{
                    ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
                };
            }
            fmt.* += 1;
            expect_comma = 0;
            continue;
        } else {
            if (expect_comma != 0) {
                _ = hpy.HPyErr_SetString(ctx, ctx.*.h_SystemError, "missing ',' in the format string passed to HPy_BuildValue");
                hpy.HPy_Close(ctx, dict);
                return hpy.HPy{
                    ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
                };
            }
        }
        var needs_key_close: c_int = undefined;
        var needs_value_close: c_int = undefined;
        var key: hpy.HPy = hpy.build_single(ctx, fmt, values, &needs_key_close);
        if (key._i == @as(isize, @bitCast(@as(c_long, @as(c_int, 0))))) {
            hpy.HPy_Close(ctx, dict);
            return hpy.HPy{
                ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
            };
        }
        if (@as(c_int, @bitCast(@as(c_uint, fmt.*.*))) != @as(c_int, ':')) {
            _ = hpy.HPyErr_SetString(ctx, ctx.*.h_SystemError, "missing ':' in the format string passed to HPy_BuildValue");
            if (needs_key_close != 0) {
                hpy.HPy_Close(ctx, key);
            }
            hpy.HPy_Close(ctx, dict);
            return hpy.HPy{
                ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
            };
        } else {
            fmt.* += 1;
        }
        var value: hpy.HPy = hpy.build_single(ctx, fmt, values, &needs_value_close);
        if (value._i == @as(isize, @bitCast(@as(c_long, @as(c_int, 0))))) {
            if (needs_key_close != 0) {
                hpy.HPy_Close(ctx, key);
            }
            hpy.HPy_Close(ctx, dict);
            return hpy.HPy{
                ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
            };
        }
        var res: c_int = hpy.HPy_SetItem(ctx, dict, key, value);
        if (needs_key_close != 0) {
            hpy.HPy_Close(ctx, key);
        }
        if (needs_value_close != 0) {
            hpy.HPy_Close(ctx, value);
        }
        if (res < @as(c_int, 0)) {
            hpy.HPy_Close(ctx, dict);
            return hpy.HPy{
                ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
            };
        }
        expect_comma = 1;
    }
    if (@as(c_int, @bitCast(@as(c_uint, fmt.*.*))) != @as(c_int, '}')) {
        hpy.HPy_Close(ctx, dict);
        _ = hpy.HPyErr_SetString(ctx, ctx.*.h_SystemError, "unmatched '{' in the format string passed to HPy_BuildValue");
        return hpy.HPy{
            ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
        };
    }
    fmt.* += 1;
    return dict;
} // /home/f-cozzocrea/projects/hpy-zig/venv/hpy-zig/lib/python3.11/site-packages/ziglang/lib/include/stdarg.h:36:29: warning: unsupported stmt class VAArgExprClass

// c_files/buildvalue.c:205:12: warning: unable to translate function, demoted to extern
//pub extern fn build_single(ctx: [*c]hpy.HPyContext, fmt: [*c][*c]const u8, values: [*c]va_list, needs_close: [*c]c_int) callconv(.C) hpy.HPy;

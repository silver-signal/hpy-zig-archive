pub export fn HPyHelpers_AddType(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_name: [*c]const u8, arg_hpyspec: [*c]HPyType_Spec, arg_params: [*c]HPyType_SpecParam) c_int {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var name = arg_name;
    var hpyspec = arg_hpyspec;
    var params = arg_params;
    var h_type: HPy = HPyType_FromSpec(ctx, hpyspec, params);
    if (h_type._i == @as(isize, @bitCast(@as(c_long, @as(c_int, 0))))) {
        return 0;
    }
    if (HPy_SetAttr_s(ctx, obj, name, h_type) != @as(c_int, 0)) {
        HPy_Close(ctx, h_type);
        return 0;
    }
    HPy_Close(ctx, h_type);
    return 1;
}
pub export fn HPyHelpers_PackArgsAndKeywords(arg_ctx: [*c]HPyContext, arg_args: [*c]const HPy, arg_nargs: usize, arg_kwnames: HPy, arg_out_pos_args: [*c]HPy, arg_out_kwd: [*c]HPy) c_int {
    var ctx = arg_ctx;
    var args = arg_args;
    var nargs = arg_nargs;
    var kwnames = arg_kwnames;
    var out_pos_args = arg_out_pos_args;
    var out_kwd = arg_out_kwd;
    var pos_args: HPy = undefined;
    var kwd: HPy = undefined;
    var tmp: HPy = undefined;
    var nkw: HPy_ssize_t = undefined;
    var i: HPy_ssize_t = undefined;
    if (out_pos_args == @as([*c]HPy, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) {
        _ = HPyErr_SetString(ctx, ctx.*.h_SystemError, "argument 'out_pos_args' must not be NULL");
        return 0;
    }
    if (out_kwd == @as([*c]HPy, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) {
        _ = HPyErr_SetString(ctx, ctx.*.h_SystemError, "argument 'out_kwd' must not be NULL");
        return 0;
    }
    nkw = if (kwnames._i == @as(isize, @bitCast(@as(c_long, @as(c_int, 0))))) @as(HPy_ssize_t, @bitCast(@as(c_long, @as(c_int, 0)))) else HPy_Length(ctx, kwnames);
    if (nkw < @as(HPy_ssize_t, @bitCast(@as(c_long, @as(c_int, 0))))) {
        return 0;
    } else if (nkw > @as(HPy_ssize_t, @bitCast(@as(c_long, @as(c_int, 0))))) {
        kwd = HPyDict_New(ctx);
        {
            i = 0;
            while (i < nkw) : (i += 1) {
                tmp = HPy_GetItem_i(ctx, kwnames, i);
                if (tmp._i == @as(isize, @bitCast(@as(c_long, @as(c_int, 0))))) {
                    HPy_Close(ctx, kwd);
                    return 0;
                }
                if (HPy_SetItem(ctx, kwd, tmp, args[nargs +% @as(usize, @bitCast(i))]) < @as(c_int, 0)) {
                    HPy_Close(ctx, tmp);
                    HPy_Close(ctx, kwd);
                    return 0;
                }
                HPy_Close(ctx, tmp);
            }
        }
    } else {
        _ = blk: {
            _ = @sizeOf(c_int);
            break :blk blk_1: {
                break :blk_1 if (nkw == @as(HPy_ssize_t, @bitCast(@as(c_long, @as(c_int, 0))))) {} else {
                    __assert_fail("nkw == 0", "c_files/helpers.c", @as(c_uint, @bitCast(@as(c_int, 138))), "int HPyHelpers_PackArgsAndKeywords(HPyContext *, const HPy *, size_t, HPy, HPy *, HPy *)");
                };
            };
        };
        kwd = HPy{
            ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
        };
    }
    if (nargs > @as(usize, @bitCast(@as(c_long, @as(c_int, 0))))) {
        pos_args = HPyTuple_FromArray(ctx, @as([*c]HPy, @ptrCast(@volatileCast(@constCast(args)))), @as(HPy_ssize_t, @bitCast(nargs)));
        if (pos_args._i == @as(isize, @bitCast(@as(c_long, @as(c_int, 0))))) {
            HPy_Close(ctx, kwd);
            return 0;
        }
    } else {
        pos_args = HPy{
            ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
        };
    }
    out_pos_args.* = pos_args;
    out_kwd.* = kwd;
    return 1;
}

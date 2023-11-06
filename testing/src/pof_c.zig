const hpy = @import("./hpy.zig");

const stdio = @cImport({
    @cInclude("stdio.h");
});
const snprintf = stdio.snprintf;

const mod_ctx = hpy.helpers.initGlobalContext("pof");

pub export var do_nothing = hpy.helpers.Def_METH(mod_ctx, "do_nothing", do_nothing_impl, hpy.HPyFunc_NOARGS);
pub fn do_nothing_impl(ctx: *hpy.HPyContext, self: hpy.HPy) callconv(.C) hpy.HPy {
    _ = self;
    return hpy.HPy_Dup(ctx, ctx.*.h_None);
}

pub export var double_obj = hpy.helpers.Def_METH(mod_ctx, "double", double_obj_impl, hpy.HPyFunc_O);
pub fn double_obj_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, obj: hpy.HPy) callconv(.C) hpy.HPy {
    _ = @TypeOf(self);
    return hpy.HPy_Add(ctx, obj, obj);
}

pub export var add_ints = hpy.helpers.Def_METH(mod_ctx, "add_ints", add_ints_impl, hpy.HPyFunc_VARARGS);
pub fn add_ints_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, args: *const hpy.HPy, nargs: usize) callconv(.C) hpy.HPy {
    _ = @TypeOf(self);
    var a: c_long = undefined;
    var b: c_long = undefined;
    if (!(hpy.HPyArg_Parse(ctx, null, args, nargs, "ll", &a, &b) != 0)) return hpy.HPy{
        ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
    };
    return hpy.HPyLong_FromLong(ctx, a + b);
}

pub export var add_ints_kw = hpy.helpers.Def_METH(mod_ctx, "add_int_kw", add_ints_kw_impl, hpy.HPyFunc_KEYWORDS);
pub fn add_ints_kw_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy, args: *const hpy.HPy, nargs: usize, kwnames: hpy.HPy) callconv(.C) hpy.HPy {
    _ = @TypeOf(self);
    var a: c_long = undefined;
    var b: c_long = undefined;
    var kwlist: [3][*c]const u8 = [3][*c]const u8{
        "a",
        "b",
        null,
    };
    if (!(hpy.HPyArg_ParseKeywords(ctx, null, args, nargs, kwnames, "ll", @as([*c][*c]const u8, @ptrCast(@alignCast(&kwlist))), &a, &b) != 0)) return hpy.HPy{
        ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
    };
    return hpy.HPyLong_FromLong(ctx, a + b);
}

pub const PointObject = extern struct {
    x: f64,
    y: f64,
};
pub fn PointObject_AsStruct(ctx: ?*hpy.HPyContext, h: hpy.HPy) callconv(.C) ?*PointObject {
    return @as([*c]PointObject, @ptrCast(@alignCast(hpy._HPy_AsStruct_Object(ctx, h))));
}

pub export var Point_new = hpy.helpers.Def_SLOT(mod_ctx, Point_new_impl, "HPy_tp_new");
pub fn Point_new_impl(ctx: ?*hpy.HPyContext, cls: hpy.HPy, args: *const hpy.HPy, nargs: hpy.HPy_ssize_t, kwnames: hpy.HPy) callconv(.C) hpy.HPy {
    _ = @TypeOf(kwnames);
    var x: f64 = undefined;
    var y: f64 = undefined;
    if (!(hpy.HPyArg_Parse(ctx, null, args, @as(usize, @bitCast(nargs)), "dd", &x, &y) != 0)) return hpy.HPy{
        ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
    };
    var point: [*c]PointObject = undefined;
    var h_point: hpy.HPy = hpy._HPy_New(ctx, cls, @as([*c]?*anyopaque, @ptrCast(@alignCast(&point))));
    if (h_point._i == @as(isize, @bitCast(@as(c_long, @as(c_int, 0))))) return hpy.HPy{
        ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
    };
    point.*.x = x;
    point.*.y = y;
    return h_point;
}

pub fn Point_repr_impl(ctx: ?*hpy.HPyContext, self: hpy.HPy) callconv(.C) hpy.HPy {
    var point: [*c]PointObject = PointObject_AsStruct(ctx, self);
    var msg: [256]u8 = undefined;
    _ = snprintf(@as([*c]u8, @ptrCast(@alignCast(&msg))), @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 256)))), "Point(%g, %g)", point.*.x, point.*.y);
    return hpy.HPyUnicode_FromString(ctx, @as([*c]u8, @ptrCast(@alignCast(&msg))));
}
pub fn Point_repr_trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
    var a = hpy._HPyFunc_args_REPRFUNC{
        .arg0 = arg0,
        .result = null,
    };
    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_REPRFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&Point_repr_impl))), @as(?*anyopaque, @ptrCast(&a)));
    return a.result;
}
pub export var Point_repr = hpy.HPyDef{
    .kind = @as(c_uint, @bitCast(hpy.HPyDef_Kind_Slot)),
    .unnamed_0 = .{
        .slot = hpy.HPySlot{
            .slot = @as(c_uint, @bitCast(hpy.HPy_tp_repr)),
            .impl = @as(hpy.HPyCFunction, @ptrCast(@alignCast(&Point_repr_impl))),
            .cpy_trampoline = @as(hpy.cpy_PyCFunction, @ptrCast(@alignCast(&Point_repr_trampoline))),
        },
    },
};
pub var point_type_defines = [_:null]?*hpy.HPyDef{
    &Point_new,
    &Point_repr,
    null,
};
pub var point_type_spec = hpy.HPyType_Spec{
    .name = "pof.Point",
    .basicsize = @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf(PointObject))))),
    .itemsize = 0,
    .flags = (@as(c_ulong, 1) << @intCast(9)) | (@as(c_ulong, 1) << @intCast(18)),
    .builtin_shape = @import("std").mem.zeroes(hpy.HPyType_BuiltinShape),
    .legacy_slots = null,
    .defines = @as([*c][*c]hpy.HPyDef, @ptrCast(@alignCast(&point_type_defines))),
    .doc = null,
};
pub fn mod_exec_impl(ctx: [*c]hpy.HPyContext, m: hpy.HPy) callconv(.C) c_int {
    var h_point_type: hpy.HPy = hpy.HPyType_FromSpec(ctx, &point_type_spec, null);
    if (h_point_type._i == @as(isize, @bitCast(@as(c_long, @as(c_int, 0))))) return -@as(c_int, 1);
    _ = hpy.HPy_SetAttr_s(ctx, m, "Point", h_point_type);
    hpy.HPy_Close(ctx, h_point_type);
    return 0;
}
pub fn mod_exec_trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) c_int {
    var a = hpy._HPyFunc_args_INQUIRY{
        .arg0 = arg0,
        .result = 0,
    };
    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_INQUIRY)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&mod_exec_impl))), @as(?*anyopaque, @ptrCast(&a)));
    return a.result;
}
pub export var mod_exec = hpy.HPyDef{
    .kind = @as(c_uint, @bitCast(hpy.HPyDef_Kind_Slot)),
    .unnamed_0 = .{
        .slot = hpy.HPySlot{
            .slot = @as(c_uint, @bitCast(hpy.HPy_mod_exec)),
            .impl = @as(hpy.HPyCFunction, @ptrCast(@alignCast(&mod_exec_impl))),
            .cpy_trampoline = @as(hpy.cpy_PyCFunction, @ptrCast(@alignCast(&mod_exec_trampoline))),
        },
    },
};

pub var module_defines = [_:null]?*hpy.HPyDef{
    &do_nothing,
    &double_obj,
    &add_ints,
    &add_ints_kw,
    &mod_exec,
};

var pofdef = hpy.helpers.ModuleDef{
    .doc = "HPy Proof of Concept",
    .defines = &module_defines,
};

comptime {
    hpy.helpers.MODINIT("pof", &pofdef);
}

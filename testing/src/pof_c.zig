const hpy = @import("./hpy.zig");

const stdio = @cImport({
    @cInclude("stdio.h");
});
const snprintf = stdio.snprintf;

var _ctx_for_trampolines: ?*hpy.HPyContext = null;

pub export fn HPyInitGlobalContext_pof(arg_ctx: ?*hpy.HPyContext) void {
    var ctx = arg_ctx;
    _ctx_for_trampolines = ctx;
}

pub fn do_nothing_impl(arg_ctx: *hpy.HPyContext, arg_self: hpy.HPy) callconv(.C) hpy.HPy {
    var ctx = arg_ctx;
    var self = arg_self;
    _ = @TypeOf(self);
    return hpy.HPy_Dup(ctx, ctx.*.h_None);
}
pub fn do_nothing_trampoline(arg_self: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
    var self = arg_self;
    var a = hpy._HPyFunc_args_NOARGS{
        .self = self,
        .result = null,
    };
    hpy._HPy_CallRealFunctionFromTrampoline(_ctx_for_trampolines, @as(c_uint, @bitCast(hpy.HPyFunc_NOARGS)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&do_nothing_impl))), @as(?*anyopaque, @ptrCast(&a)));
    return a.result;
}
pub export var do_nothing = hpy.HPyDef{
    .kind = @as(c_uint, @bitCast(hpy.HPyDef_Kind_Meth)),
    .unnamed_0 = .{
        .meth = hpy.HPyMeth{
            .name = "do_nothing",
            .impl = @as(hpy.HPyCFunction, @ptrCast(@alignCast(&do_nothing_impl))),
            .cpy_trampoline = @as(hpy.cpy_PyCFunction, @ptrCast(@alignCast(&do_nothing_trampoline))),
            .signature = @as(c_uint, @bitCast(hpy.HPyFunc_NOARGS)),
            .doc = null,
        },
    },
};
pub fn double_obj_impl(arg_ctx: ?*hpy.HPyContext, arg_self: hpy.HPy, arg_obj: hpy.HPy) callconv(.C) hpy.HPy {
    var ctx = arg_ctx;
    var self = arg_self;
    _ = @TypeOf(self);
    var obj = arg_obj;
    return hpy.HPy_Add(ctx, obj, obj);
}
pub fn double_obj_trampoline(arg_self: ?*hpy.cpy_PyObject, arg_arg: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
    var self = arg_self;
    var arg = arg_arg;
    var a = hpy._HPyFunc_args_O{
        .self = self,
        .arg = arg,
        .result = null,
    };
    hpy._HPy_CallRealFunctionFromTrampoline(_ctx_for_trampolines, @as(c_uint, @bitCast(hpy.HPyFunc_O)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&double_obj_impl))), @as(?*anyopaque, @ptrCast(&a)));
    return a.result;
}
pub export var double_obj = hpy.HPyDef{
    .kind = @as(c_uint, @bitCast(hpy.HPyDef_Kind_Meth)),
    .unnamed_0 = .{
        .meth = hpy.HPyMeth{
            .name = "double",
            .impl = @as(hpy.HPyCFunction, @ptrCast(@alignCast(&double_obj_impl))),
            .cpy_trampoline = @as(hpy.cpy_PyCFunction, @ptrCast(@alignCast(&double_obj_trampoline))),
            .signature = @as(c_uint, @bitCast(hpy.HPyFunc_O)),
            .doc = null,
        },
    },
};
pub fn add_ints_impl(arg_ctx: ?*hpy.HPyContext, arg_self: hpy.HPy, arg_args: [*c]const hpy.HPy, arg_nargs: usize) callconv(.C) hpy.HPy {
    var ctx = arg_ctx;
    var self = arg_self;
    _ = @TypeOf(self);
    var args = arg_args;
    var nargs = arg_nargs;
    var a: c_long = undefined;
    var b: c_long = undefined;
    if (!(hpy.HPyArg_Parse(ctx, null, args, nargs, "ll", &a, &b) != 0)) return hpy.HPy{
        ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
    };
    return hpy.HPyLong_FromLong(ctx, a + b);
}
pub fn add_ints_trampoline(arg_self: ?*hpy.cpy_PyObject, arg_args: [*c]const ?*hpy.cpy_PyObject, arg_nargs: hpy.HPy_ssize_t) callconv(.C) ?*hpy.cpy_PyObject {
    var self = arg_self;
    var args = arg_args;
    var nargs = arg_nargs;
    var a = hpy._HPyFunc_args_VARARGS{
        .self = self,
        .args = args,
        .nargs = nargs,
        .result = null,
    };
    hpy._HPy_CallRealFunctionFromTrampoline(_ctx_for_trampolines, @as(c_uint, @bitCast(hpy.HPyFunc_VARARGS)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&add_ints_impl))), @as(?*anyopaque, @ptrCast(&a)));
    return a.result;
}
pub export var add_ints = hpy.HPyDef{
    .kind = @as(c_uint, @bitCast(hpy.HPyDef_Kind_Meth)),
    .unnamed_0 = .{
        .meth = hpy.HPyMeth{
            .name = "add_ints",
            .impl = @as(hpy.HPyCFunction, @ptrCast(@alignCast(&add_ints_impl))),
            .cpy_trampoline = @as(hpy.cpy_PyCFunction, @ptrCast(@alignCast(&add_ints_trampoline))),
            .signature = @as(c_uint, @bitCast(hpy.HPyFunc_VARARGS)),
            .doc = null,
        },
    },
};
pub fn add_ints_kw_impl(arg_ctx: ?*hpy.HPyContext, arg_self: hpy.HPy, arg_args: [*c]const hpy.HPy, arg_nargs: usize, arg_kwnames: hpy.HPy) callconv(.C) hpy.HPy {
    var ctx = arg_ctx;
    var self = arg_self;
    _ = @TypeOf(self);
    var args = arg_args;
    var nargs = arg_nargs;
    var kwnames = arg_kwnames;
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
pub fn add_ints_kw_trampoline(arg_self: ?*hpy.cpy_PyObject, arg_args: [*c]const ?*hpy.cpy_PyObject, arg_nargs: usize, arg_kwnames: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
    var self = arg_self;
    var args = arg_args;
    var nargs = arg_nargs;
    var kwnames = arg_kwnames;
    var a = hpy._HPyFunc_args_KEYWORDS{
        .self = self,
        .args = args,
        .nargsf = nargs,
        .kwnames = kwnames,
        .result = null,
    };
    hpy._HPy_CallRealFunctionFromTrampoline(_ctx_for_trampolines, @as(c_uint, @bitCast(hpy.HPyFunc_KEYWORDS)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&add_ints_kw_impl))), @as(?*anyopaque, @ptrCast(&a)));
    return a.result;
}
pub export var add_ints_kw = hpy.HPyDef{
    .kind = @as(c_uint, @bitCast(hpy.HPyDef_Kind_Meth)),
    .unnamed_0 = .{
        .meth = hpy.HPyMeth{
            .name = "add_ints_kw",
            .impl = @as(hpy.HPyCFunction, @ptrCast(@alignCast(&add_ints_kw_impl))),
            .cpy_trampoline = @as(hpy.cpy_PyCFunction, @ptrCast(@alignCast(&add_ints_kw_trampoline))),
            .signature = @as(c_uint, @bitCast(hpy.HPyFunc_KEYWORDS)),
            .doc = null,
        },
    },
};
pub const PointObject = extern struct {
    x: f64,
    y: f64,
};
pub fn PointObject_AsStruct(arg_ctx: ?*hpy.HPyContext, arg_h: hpy.HPy) callconv(.C) ?*PointObject {
    var ctx = arg_ctx;
    var h = arg_h;
    return @as([*c]PointObject, @ptrCast(@alignCast(hpy._HPy_AsStruct_Object(ctx, h))));
}
pub fn Point_new_impl(arg_ctx: ?*hpy.HPyContext, arg_cls: hpy.HPy, arg_args: [*c]const hpy.HPy, arg_nargs: hpy.HPy_ssize_t, arg_kwnames: hpy.HPy) callconv(.C) hpy.HPy {
    var ctx = arg_ctx;
    var cls = arg_cls;
    var args = arg_args;
    var nargs = arg_nargs;
    var kwnames = arg_kwnames;
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
pub fn Point_new_trampoline(arg_self: ?*hpy.cpy_PyObject, arg_args: ?*hpy.cpy_PyObject, arg_kw: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
    var self = arg_self;
    var args = arg_args;
    var kw = arg_kw;
    var a = hpy._HPyFunc_args_NEWFUNC{
        .self = self,
        .args = args,
        .kw = kw,
        .result = null,
    };
    hpy._HPy_CallRealFunctionFromTrampoline(_ctx_for_trampolines, @as(c_uint, @bitCast(hpy.HPyFunc_NEWFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&Point_new_impl))), @as(?*anyopaque, @ptrCast(&a)));
    return a.result;
}
pub export var Point_new = hpy.HPyDef{
    .kind = @as(c_uint, @bitCast(hpy.HPyDef_Kind_Slot)),
    .unnamed_0 = .{
        .slot = hpy.HPySlot{
            .slot = @as(c_uint, @bitCast(hpy.HPy_tp_new)),
            .impl = @as(hpy.HPyCFunction, @ptrCast(@alignCast(&Point_new_impl))),
            .cpy_trampoline = @as(hpy.cpy_PyCFunction, @ptrCast(@alignCast(&Point_new_trampoline))),
        },
    },
};
pub fn Point_repr_impl(arg_ctx: ?*hpy.HPyContext, arg_self: hpy.HPy) callconv(.C) hpy.HPy {
    var ctx = arg_ctx;
    var self = arg_self;
    var point: [*c]PointObject = PointObject_AsStruct(ctx, self);
    var msg: [256]u8 = undefined;
    _ = snprintf(@as([*c]u8, @ptrCast(@alignCast(&msg))), @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 256)))), "Point(%g, %g)", point.*.x, point.*.y);
    return hpy.HPyUnicode_FromString(ctx, @as([*c]u8, @ptrCast(@alignCast(&msg))));
}
pub fn Point_repr_trampoline(arg_arg0: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
    var arg0 = arg_arg0;
    var a = hpy._HPyFunc_args_REPRFUNC{
        .arg0 = arg0,
        .result = null,
    };
    hpy._HPy_CallRealFunctionFromTrampoline(_ctx_for_trampolines, @as(c_uint, @bitCast(hpy.HPyFunc_REPRFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&Point_repr_impl))), @as(?*anyopaque, @ptrCast(&a)));
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
pub var point_type_defines = [3][*c]hpy.HPyDef{
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
pub fn mod_exec_impl(arg_ctx: [*c]hpy.HPyContext, arg_m: hpy.HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var m = arg_m;
    var h_point_type: hpy.HPy = hpy.HPyType_FromSpec(ctx, &point_type_spec, null);
    if (h_point_type._i == @as(isize, @bitCast(@as(c_long, @as(c_int, 0))))) return -@as(c_int, 1);
    _ = hpy.HPy_SetAttr_s(ctx, m, "Point", h_point_type);
    hpy.HPy_Close(ctx, h_point_type);
    return 0;
}
pub fn mod_exec_trampoline(arg_arg0: ?*hpy.cpy_PyObject) callconv(.C) c_int {
    var arg0 = arg_arg0;
    var a = hpy._HPyFunc_args_INQUIRY{
        .arg0 = arg0,
        .result = 0,
    };
    hpy._HPy_CallRealFunctionFromTrampoline(_ctx_for_trampolines, @as(c_uint, @bitCast(hpy.HPyFunc_INQUIRY)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&mod_exec_impl))), @as(?*anyopaque, @ptrCast(&a)));
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
    null,
};
pub var moduledef = hpy.HPyModuleDef{
    .doc = "HPy Proof of Concept",
    .size = @as(hpy.HPy_ssize_t, @bitCast(@as(c_long, @as(c_int, 0)))),
    .legacy_methods = null,
    .defines = @as([*c][*c]hpy.HPyDef, @ptrCast(@alignCast(&module_defines))),
    .globals = null,
};
pub export fn get_required_hpy_major_version_pof() u32 {
    return 0;
}
pub export fn get_required_hpy_minor_version_pof() u32 {
    return 0;
}
pub export fn HPyInit_pof() [*c]hpy.HPyModuleDef {
    return &moduledef;
}

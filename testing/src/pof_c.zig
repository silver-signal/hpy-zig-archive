const hpy = @import("./hpy.zig");
const HPy = hpy.ffi.HPy;

const stdio = @cImport({
    @cInclude("stdio.h");
});
const snprintf = stdio.snprintf;

var _ctx_for_trampolines: ?*hpy.ffi.HPyContext = null;

pub export fn HPyInitGlobalContext_pof(arg_ctx: ?*hpy.ffi.HPyContext) void {
    var ctx = arg_ctx;
    _ctx_for_trampolines = ctx;
}

pub fn do_nothing_impl(arg_ctx: *hpy.ffi.HPyContext, arg_self: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var self = arg_self;
    _ = @TypeOf(self);
    return hpy.ffi.HPy_Dup(ctx, ctx.*.h_None);
}
pub fn do_nothing_trampoline(arg_self: ?*hpy.ffi.cpy_PyObject) callconv(.C) ?*hpy.ffi.cpy_PyObject {
    var self = arg_self;
    var a = hpy.ffi._HPyFunc_args_NOARGS{
        .self = self,
        .result = null,
    };
    hpy.ffi._HPy_CallRealFunctionFromTrampoline(_ctx_for_trampolines, @as(c_uint, @bitCast(hpy.ffi.HPyFunc_NOARGS)), @as(hpy.ffi.HPyCFunction, @ptrCast(@alignCast(&do_nothing_impl))), @as(?*anyopaque, @ptrCast(&a)));
    return a.result;
}
pub export var do_nothing = hpy.ffi.HPyDef{
    .kind = @as(c_uint, @bitCast(hpy.ffi.HPyDef_Kind_Meth)),
    .unnamed_0 = .{
        .meth = hpy.ffi.HPyMeth{
            .name = "do_nothing",
            .impl = @as(hpy.ffi.HPyCFunction, @ptrCast(@alignCast(&do_nothing_impl))),
            .cpy_trampoline = @as(hpy.ffi.cpy_PyCFunction, @ptrCast(@alignCast(&do_nothing_trampoline))),
            .signature = @as(c_uint, @bitCast(hpy.ffi.HPyFunc_NOARGS)),
            .doc = null,
        },
    },
};
pub fn double_obj_impl(arg_ctx: ?*hpy.ffi.HPyContext, arg_self: HPy, arg_obj: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var self = arg_self;
    _ = @TypeOf(self);
    var obj = arg_obj;
    return hpy.ffi.HPy_Add(ctx, obj, obj);
}
pub fn double_obj_trampoline(arg_self: ?*hpy.ffi.cpy_PyObject, arg_arg: ?*hpy.ffi.cpy_PyObject) callconv(.C) ?*hpy.ffi.cpy_PyObject {
    var self = arg_self;
    var arg = arg_arg;
    var a = hpy.ffi._HPyFunc_args_O{
        .self = self,
        .arg = arg,
        .result = null,
    };
    hpy.ffi._HPy_CallRealFunctionFromTrampoline(_ctx_for_trampolines, @as(c_uint, @bitCast(hpy.ffi.HPyFunc_O)), @as(hpy.ffi.HPyCFunction, @ptrCast(@alignCast(&double_obj_impl))), @as(?*anyopaque, @ptrCast(&a)));
    return a.result;
}
pub export var double_obj = hpy.ffi.HPyDef{
    .kind = @as(c_uint, @bitCast(hpy.ffi.HPyDef_Kind_Meth)),
    .unnamed_0 = .{
        .meth = hpy.ffi.HPyMeth{
            .name = "double",
            .impl = @as(hpy.ffi.HPyCFunction, @ptrCast(@alignCast(&double_obj_impl))),
            .cpy_trampoline = @as(hpy.ffi.cpy_PyCFunction, @ptrCast(@alignCast(&double_obj_trampoline))),
            .signature = @as(c_uint, @bitCast(hpy.ffi.HPyFunc_O)),
            .doc = null,
        },
    },
};
pub fn add_ints_impl(arg_ctx: ?*hpy.ffi.HPyContext, arg_self: HPy, arg_args: [*c]const HPy, arg_nargs: usize) callconv(.C) HPy {
    var ctx = arg_ctx;
    var self = arg_self;
    _ = @TypeOf(self);
    var args = arg_args;
    var nargs = arg_nargs;
    var a: c_long = undefined;
    var b: c_long = undefined;
    if (!(hpy.ffi.HPyArg_Parse(ctx, null, args, nargs, "ll", &a, &b) != 0)) return HPy{
        ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
    };
    return hpy.ffi.HPyLong_FromLong(ctx, a + b);
}
pub fn add_ints_trampoline(arg_self: ?*hpy.ffi.cpy_PyObject, arg_args: [*c]const ?*hpy.ffi.cpy_PyObject, arg_nargs: hpy.ffi.HPy_ssize_t) callconv(.C) ?*hpy.ffi.cpy_PyObject {
    var self = arg_self;
    var args = arg_args;
    var nargs = arg_nargs;
    var a = hpy.ffi._HPyFunc_args_VARARGS{
        .self = self,
        .args = args,
        .nargs = nargs,
        .result = null,
    };
    hpy.ffi._HPy_CallRealFunctionFromTrampoline(_ctx_for_trampolines, @as(c_uint, @bitCast(hpy.ffi.HPyFunc_VARARGS)), @as(hpy.ffi.HPyCFunction, @ptrCast(@alignCast(&add_ints_impl))), @as(?*anyopaque, @ptrCast(&a)));
    return a.result;
}
pub export var add_ints = hpy.ffi.HPyDef{
    .kind = @as(c_uint, @bitCast(hpy.ffi.HPyDef_Kind_Meth)),
    .unnamed_0 = .{
        .meth = hpy.ffi.HPyMeth{
            .name = "add_ints",
            .impl = @as(hpy.ffi.HPyCFunction, @ptrCast(@alignCast(&add_ints_impl))),
            .cpy_trampoline = @as(hpy.ffi.cpy_PyCFunction, @ptrCast(@alignCast(&add_ints_trampoline))),
            .signature = @as(c_uint, @bitCast(hpy.ffi.HPyFunc_VARARGS)),
            .doc = null,
        },
    },
};
pub fn add_ints_kw_impl(arg_ctx: ?*hpy.ffi.HPyContext, arg_self: HPy, arg_args: [*c]const HPy, arg_nargs: usize, arg_kwnames: HPy) callconv(.C) HPy {
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
    if (!(hpy.ffi.HPyArg_ParseKeywords(ctx, null, args, nargs, kwnames, "ll", @as([*c][*c]const u8, @ptrCast(@alignCast(&kwlist))), &a, &b) != 0)) return HPy{
        ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
    };
    return hpy.ffi.HPyLong_FromLong(ctx, a + b);
}
pub fn add_ints_kw_trampoline(arg_self: ?*hpy.ffi.cpy_PyObject, arg_args: [*c]const ?*hpy.ffi.cpy_PyObject, arg_nargs: usize, arg_kwnames: ?*hpy.ffi.cpy_PyObject) callconv(.C) ?*hpy.ffi.cpy_PyObject {
    var self = arg_self;
    var args = arg_args;
    var nargs = arg_nargs;
    var kwnames = arg_kwnames;
    var a = hpy.ffi._HPyFunc_args_KEYWORDS{
        .self = self,
        .args = args,
        .nargsf = nargs,
        .kwnames = kwnames,
        .result = null,
    };
    hpy.ffi._HPy_CallRealFunctionFromTrampoline(_ctx_for_trampolines, @as(c_uint, @bitCast(hpy.ffi.HPyFunc_KEYWORDS)), @as(hpy.ffi.HPyCFunction, @ptrCast(@alignCast(&add_ints_kw_impl))), @as(?*anyopaque, @ptrCast(&a)));
    return a.result;
}
pub export var add_ints_kw = hpy.ffi.HPyDef{
    .kind = @as(c_uint, @bitCast(hpy.ffi.HPyDef_Kind_Meth)),
    .unnamed_0 = .{
        .meth = hpy.ffi.HPyMeth{
            .name = "add_ints_kw",
            .impl = @as(hpy.ffi.HPyCFunction, @ptrCast(@alignCast(&add_ints_kw_impl))),
            .cpy_trampoline = @as(hpy.ffi.cpy_PyCFunction, @ptrCast(@alignCast(&add_ints_kw_trampoline))),
            .signature = @as(c_uint, @bitCast(hpy.ffi.HPyFunc_KEYWORDS)),
            .doc = null,
        },
    },
};
pub const PointObject = extern struct {
    x: f64,
    y: f64,
};
pub fn PointObject_AsStruct(arg_ctx: ?*hpy.ffi.HPyContext, arg_h: HPy) callconv(.C) ?*PointObject {
    var ctx = arg_ctx;
    var h = arg_h;
    return @as([*c]PointObject, @ptrCast(@alignCast(hpy.ffi._HPy_AsStruct_Object(ctx, h))));
}
pub fn Point_new_impl(arg_ctx: ?*hpy.ffi.HPyContext, arg_cls: HPy, arg_args: [*c]const HPy, arg_nargs: hpy.ffi.HPy_ssize_t, arg_kwnames: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var cls = arg_cls;
    var args = arg_args;
    var nargs = arg_nargs;
    var kwnames = arg_kwnames;
    _ = @TypeOf(kwnames);
    var x: f64 = undefined;
    var y: f64 = undefined;
    if (!(hpy.ffi.HPyArg_Parse(ctx, null, args, @as(usize, @bitCast(nargs)), "dd", &x, &y) != 0)) return HPy{
        ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
    };
    var point: [*c]PointObject = undefined;
    var h_point: HPy = hpy.ffi._HPy_New(ctx, cls, @as([*c]?*anyopaque, @ptrCast(@alignCast(&point))));
    if (h_point._i == @as(isize, @bitCast(@as(c_long, @as(c_int, 0))))) return HPy{
        ._i = @as(isize, @bitCast(@as(c_long, @as(c_int, 0)))),
    };
    point.*.x = x;
    point.*.y = y;
    return h_point;
}
pub fn Point_new_trampoline(arg_self: ?*hpy.ffi.cpy_PyObject, arg_args: ?*hpy.ffi.cpy_PyObject, arg_kw: ?*hpy.ffi.cpy_PyObject) callconv(.C) ?*hpy.ffi.cpy_PyObject {
    var self = arg_self;
    var args = arg_args;
    var kw = arg_kw;
    var a = hpy.ffi._HPyFunc_args_NEWFUNC{
        .self = self,
        .args = args,
        .kw = kw,
        .result = null,
    };
    hpy.ffi._HPy_CallRealFunctionFromTrampoline(_ctx_for_trampolines, @as(c_uint, @bitCast(hpy.ffi.HPyFunc_NEWFUNC)), @as(hpy.ffi.HPyCFunction, @ptrCast(@alignCast(&Point_new_impl))), @as(?*anyopaque, @ptrCast(&a)));
    return a.result;
}
pub export var Point_new = hpy.ffi.HPyDef{
    .kind = @as(c_uint, @bitCast(hpy.ffi.HPyDef_Kind_Slot)),
    .unnamed_0 = .{
        .slot = hpy.ffi.HPySlot{
            .slot = @as(c_uint, @bitCast(hpy.ffi.HPy_tp_new)),
            .impl = @as(hpy.ffi.HPyCFunction, @ptrCast(@alignCast(&Point_new_impl))),
            .cpy_trampoline = @as(hpy.ffi.cpy_PyCFunction, @ptrCast(@alignCast(&Point_new_trampoline))),
        },
    },
};
pub fn Point_repr_impl(arg_ctx: ?*hpy.ffi.HPyContext, arg_self: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var self = arg_self;
    var point: [*c]PointObject = PointObject_AsStruct(ctx, self);
    var msg: [256]u8 = undefined;
    _ = snprintf(@as([*c]u8, @ptrCast(@alignCast(&msg))), @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 256)))), "Point(%g, %g)", point.*.x, point.*.y);
    return hpy.ffi.HPyUnicode_FromString(ctx, @as([*c]u8, @ptrCast(@alignCast(&msg))));
}
pub fn Point_repr_trampoline(arg_arg0: ?*hpy.ffi.cpy_PyObject) callconv(.C) ?*hpy.ffi.cpy_PyObject {
    var arg0 = arg_arg0;
    var a = hpy.ffi._HPyFunc_args_REPRFUNC{
        .arg0 = arg0,
        .result = null,
    };
    hpy.ffi._HPy_CallRealFunctionFromTrampoline(_ctx_for_trampolines, @as(c_uint, @bitCast(hpy.ffi.HPyFunc_REPRFUNC)), @as(hpy.ffi.HPyCFunction, @ptrCast(@alignCast(&Point_repr_impl))), @as(?*anyopaque, @ptrCast(&a)));
    return a.result;
}
pub export var Point_repr = hpy.ffi.HPyDef{
    .kind = @as(c_uint, @bitCast(hpy.ffi.HPyDef_Kind_Slot)),
    .unnamed_0 = .{
        .slot = hpy.ffi.HPySlot{
            .slot = @as(c_uint, @bitCast(hpy.ffi.HPy_tp_repr)),
            .impl = @as(hpy.ffi.HPyCFunction, @ptrCast(@alignCast(&Point_repr_impl))),
            .cpy_trampoline = @as(hpy.ffi.cpy_PyCFunction, @ptrCast(@alignCast(&Point_repr_trampoline))),
        },
    },
};
pub var point_type_defines = [3][*c]hpy.ffi.HPyDef{
    &Point_new,
    &Point_repr,
    null,
};
pub var point_type_spec = hpy.ffi.HPyType_Spec{
    .name = "pof.Point",
    .basicsize = @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf(PointObject))))),
    .itemsize = 0,
    .flags = (@as(c_ulong, 1) << @intCast(9)) | (@as(c_ulong, 1) << @intCast(18)),
    .builtin_shape = @import("std").mem.zeroes(hpy.ffi.HPyType_BuiltinShape),
    .legacy_slots = null,
    .defines = @as([*c][*c]hpy.ffi.HPyDef, @ptrCast(@alignCast(&point_type_defines))),
    .doc = null,
};
pub fn mod_exec_impl(arg_ctx: [*c]hpy.ffi.HPyContext, arg_m: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var m = arg_m;
    var h_point_type: HPy = hpy.ffi.HPyType_FromSpec(ctx, &point_type_spec, null);
    if (h_point_type._i == @as(isize, @bitCast(@as(c_long, @as(c_int, 0))))) return -@as(c_int, 1);
    _ = hpy.ffi.HPy_SetAttr_s(ctx, m, "Point", h_point_type);
    hpy.ffi.HPy_Close(ctx, h_point_type);
    return 0;
}
pub fn mod_exec_trampoline(arg_arg0: ?*hpy.ffi.cpy_PyObject) callconv(.C) c_int {
    var arg0 = arg_arg0;
    var a = hpy.ffi._HPyFunc_args_INQUIRY{
        .arg0 = arg0,
        .result = 0,
    };
    hpy.ffi._HPy_CallRealFunctionFromTrampoline(_ctx_for_trampolines, @as(c_uint, @bitCast(hpy.ffi.HPyFunc_INQUIRY)), @as(hpy.ffi.HPyCFunction, @ptrCast(@alignCast(&mod_exec_impl))), @as(?*anyopaque, @ptrCast(&a)));
    return a.result;
}
pub export var mod_exec = hpy.ffi.HPyDef{
    .kind = @as(c_uint, @bitCast(hpy.ffi.HPyDef_Kind_Slot)),
    .unnamed_0 = .{
        .slot = hpy.ffi.HPySlot{
            .slot = @as(c_uint, @bitCast(hpy.ffi.HPy_mod_exec)),
            .impl = @as(hpy.ffi.HPyCFunction, @ptrCast(@alignCast(&mod_exec_impl))),
            .cpy_trampoline = @as(hpy.ffi.cpy_PyCFunction, @ptrCast(@alignCast(&mod_exec_trampoline))),
        },
    },
};
pub var module_defines = [_:null]?*hpy.ffi.HPyDef{
    &do_nothing,
    &double_obj,
    &add_ints,
    &add_ints_kw,
    &mod_exec,
    null,
};
pub var moduledef = hpy.ffi.HPyModuleDef{
    .doc = "HPy Proof of Concept",
    .size = @as(hpy.ffi.HPy_ssize_t, @bitCast(@as(c_long, @as(c_int, 0)))),
    .legacy_methods = null,
    .defines = @as([*c][*c]hpy.ffi.HPyDef, @ptrCast(@alignCast(&module_defines))),
    .globals = null,
};
pub export fn get_required_hpy_major_version_pof() u32 {
    return 0;
}
pub export fn get_required_hpy_minor_version_pof() u32 {
    return 0;
}
pub export fn HPyInit_pof() [*c]hpy.ffi.HPyModuleDef {
    return &moduledef;
}

//const ffi = @import("ffi.zig");
const ffi = @cImport({
    @cDefine("HPY", {});
    @cDefine("HPY_ABI_UNIVERSAL", {});
    @cInclude("hpy.h");
});

const HPyContext = ffi.HPyContext;
const HPy = ffi.HPy;
const HPyUnicode_FromString = ffi.HPyUnicode_FromString;
const cpy_PyObject = ffi.cpy_PyObject;
const _HPyFunc_args_NOARGS = ffi._HPyFunc_args_NOARGS;
const _HPy_CallRealFunctionFromTrampoline = ffi._HPy_CallRealFunctionFromTrampoline;
const HPyFunc_NOARGS = ffi.HPyFunc_NOARGS;
const HPyCFunction = ffi.HPyCFunction;
const HPyDef = ffi.HPyDef;
const HPyModuleDef = ffi.HPyModuleDef;
const HPyDef_Kind_Meth = ffi.HPyDef_Kind_Meth;
const HPy_ssize_t = ffi.HPy_ssize_t;
const HPyMeth = ffi.HPyMeth;
var _ctx_for_trampolines: ?*HPyContext = undefined;
const cpy_PyCFunction = ffi.cpy_PyCFunction;

const HPY_ABI_VERSION = ffi.HPY_ABI_VERSION;
const HPY_ABI_VERSION_MINOR = ffi.HPY_ABI_VERSION_MINOR;

pub fn say_hello_impl(arg_ctx: ?*HPyContext, arg_self: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var self = arg_self;
    _ = @TypeOf(self);
    return HPyUnicode_FromString(ctx, "Hello world!");
}

pub fn say_hello_trampoline(arg_self: ?*cpy_PyObject) callconv(.C) ?*cpy_PyObject {
    var self = arg_self;
    var a: _HPyFunc_args_NOARGS = _HPyFunc_args_NOARGS{
        .self = self,
        .result = null,
    };
    _HPy_CallRealFunctionFromTrampoline(_ctx_for_trampolines, @as(c_uint, @bitCast(HPyFunc_NOARGS)), @as(HPyCFunction, @ptrCast(@alignCast(&say_hello_impl))), @as(?*anyopaque, @ptrCast(&a)));
    return a.result;
}

pub export var say_hello: HPyDef = HPyDef{
    .kind = @as(c_uint, @bitCast(HPyDef_Kind_Meth)),
    .unnamed_0 = .{
        .meth = HPyMeth{
            .name = "say_hello",
            .impl = @as(HPyCFunction, @ptrCast(@alignCast(&say_hello_impl))),
            .cpy_trampoline = @as(cpy_PyCFunction, @ptrCast(@alignCast(&say_hello_trampoline))),
            .signature = @as(c_uint, @bitCast(HPyFunc_NOARGS)),
            .doc = null,
        },
    },
};

pub var QuickstartCMethods: [2]?*HPyDef = [2]?*HPyDef{
    &say_hello,
    null,
};

pub var quickstart_zig_def: HPyModuleDef = HPyModuleDef{
    .doc = "HPy Quickstart C Example",
    .size = @import("std").mem.zeroes(HPy_ssize_t),
    .legacy_methods = null,
    .defines = @as([*c][*c]HPyDef, @ptrCast(@alignCast(&QuickstartCMethods))),
    .globals = null,
};

pub export fn get_required_hpy_major_version_quickstart_zig() u32 {
    return HPY_ABI_VERSION;
}

pub export fn get_required_hpy_minor_version_quickstart_zig() u32 {
    return HPY_ABI_VERSION_MINOR;
}

pub export fn HPyInitGlobalContext_quickstart_zig(arg_ctx: ?*HPyContext) void {
    var ctx = arg_ctx;
    _ctx_for_trampolines = ctx;
}

pub export fn HPyInit_quickstart_zig() ?*HPyModuleDef {
    return &quickstart_zig_def;
}

const std = @import("std");

const hpy = @cImport({
    @cDefine("HPY", {});
    @cDefine("HPY_ABI_UNIVERSAL", {});
    @cInclude("hpy.h");
});

const HPy = hpy.HPy;

const HPyDef = hpy.HPyDef;
const HPyMeth = hpy.HPyMeth;
const HPyDef_Kind_Meth = hpy.HPyDef_Kind_Meth;
const HPyContext = hpy.HPyContext;
const cpy_PyObject = hpy.cpy_PyObject;
const HPyCFunction = hpy.HPyCFunction;
const cpy_PyCFunction = hpy.cpy_PyCFunction;
const HPyModuleDef = hpy.HPyModuleDef;
const HPyFunc_NOARGS = hpy.HPyFunc_NOARGS;
const _HPyFunc_args_NOARGS = hpy._HPyFunc_args_NOARGS;
const _HPy_CallRealFunctionFromTrampoline = hpy._HPy_CallRealFunctionFromTrampoline;
const HPyUnicode_FromString = hpy.HPyUnicode_FromString;

var _ctx_for_trampolines: *HPyContext = undefined;

pub const say_hello_impl_sig: c_int = 3;
const enum_unnamed_3 = c_uint;
pub fn say_hello_impl(arg_ctx: [*c]HPyContext, arg_self: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var self = arg_self;
    _ = @TypeOf(self);
    return HPyUnicode_FromString(ctx, "Hello world!");
}
pub const say_hello_trampoline_sig: c_int = 3;
const enum_unnamed_4 = c_uint;
pub fn say_hello_trampoline(arg_self: ?*cpy_PyObject) callconv(.C) ?*cpy_PyObject {
    var self = arg_self;
    var a: _HPyFunc_args_NOARGS = _HPyFunc_args_NOARGS{
        .self = self,
        .result = null,
    };
    _HPy_CallRealFunctionFromTrampoline(_ctx_for_trampolines, @bitCast(c_uint, HPyFunc_NOARGS), @ptrCast(HPyCFunction, @alignCast(@import("std").meta.alignment(HPyCFunction), &say_hello_impl)), @ptrCast(?*anyopaque, &a));
    return a.result;
}
pub export var say_hello: HPyDef = HPyDef{
    .kind = @bitCast(c_uint, HPyDef_Kind_Meth),
    .unnamed_0 = .{
        .meth = HPyMeth{
            .name = "say_hello",
            .impl = @ptrCast(HPyCFunction, @alignCast(@import("std").meta.alignment(HPyCFunction), &say_hello_impl)),
            .cpy_trampoline = @ptrCast(cpy_PyCFunction, @alignCast(@import("std").meta.alignment(cpy_PyCFunction), &say_hello_trampoline)),
            .signature = @bitCast(c_uint, HPyFunc_NOARGS),
            .doc = null,
        },
    },
};
pub var QuickstartCMethods: [2][*c]HPyDef = [2][*c]HPyDef{
    &say_hello,
    null,
};
pub var quickstart_c_def: HPyModuleDef = HPyModuleDef{
    .doc = "HPy Quickstart C Example",
    .size = 0,
    .legacy_methods = null,
    .defines = @ptrCast([*c][*c]HPyDef, @alignCast(@import("std").meta.alignment([*c][*c]HPyDef), &QuickstartCMethods)),
    .globals = null,
};
pub export fn get_required_hpy_major_version_quickstart_c() u32 {
    return 0;
}
pub export fn get_required_hpy_minor_version_quickstart_c() u32 {
    return 0;
}
pub export fn HPyInitGlobalContext_quickstart_c(arg_ctx: [*c]HPyContext) void {
    var ctx = arg_ctx;
    _ctx_for_trampolines = ctx;
}
pub export fn HPyInit_quickstart_c() [*c]HPyModuleDef {
    return &quickstart_c_def;
}

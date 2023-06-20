const std = @import("std");

const hpy = @import("hpy.zig");

const HPy = hpy.HPy;

const HPyDef = hpy.HPyDef;
const HPyMeth = hpy.HPyMeth;
const HPyDef_Kind = hpy.HPyDef_Kind;
const HPyContext = hpy.HPyContext;
const cpy_PyObject = hpy.cpy_PyObject;
const HPyCFunction = hpy.HPyCFunction;
const cpy_PyCFunction = hpy.cpy_PyCFunction;
const HPyModuleDef = hpy.HPyModuleDef;
const HPyFunc_NOARGS = hpy.HPyFunc_NOARGS;
const _HPyFunc_args_NOARGS = hpy._HPyFunc_args_NOARGS;
const _HPy_CallRealFunctionFromTrampoline = hpy._HPy_CallRealFunctionFromTrampoline;
const HPyUnicode_FromString = hpy.HPyUnicode_FromString;

const HPy_ssize_t = isize;

const HPY_ABI_VERSION = hpy.HPY_ABI_VERSION;
const HPY_ABI_VERSION_MINOR = hpy.HPY_ABI_VERSION_MINOR;

const HPy_MODINIT = hpy.HPy_MODINIT;

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
    .kind = HPyDef_Kind.HPyDef_Kind_Meth,
    .val = .{ // FIXME
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
pub const quickstart_zig_def: HPyModuleDef = HPyModuleDef{
    .doc = "HPy Quickstart C Example",
    .size = @import("std").mem.zeroes(HPy_ssize_t),
    .legacy_methods = null,
    .defines = @ptrCast([*c][*c]const HPyDef, @alignCast(@import("std").meta.alignment([*c][*c]const HPyDef), &QuickstartCMethods)),
    .globals = null,
};

const ModuleContext = HPy_MODINIT("quickstart_zig", quickstart_zig_def);
const _ = ModuleContext;
//pub export fn get_required_hpy_major_version_quickstart_zig() u32 {
//    return HPY_ABI_VERSION;
//}
//pub export fn get_required_hpy_minor_version_quickstart_zig() u32 {
//    return HPY_ABI_VERSION_MINOR;
//}
pub export fn HPyInit_quickstart_zig() [*c]HPyModuleDef {
    return &quickstart_zig_def;
}
pub export fn HPyInitGlobalContext_quickstart_zig(arg_ctx: [*c]HPyContext) void {
    var ctx = arg_ctx;
    _ctx_for_trampolines = ctx;
}

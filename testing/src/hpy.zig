const std = @import("std");

pub const ffi = @import("./ffi.zig");
pub const ABI_VERSION = ffi.HPY_ABI_VERSION;
pub const ABI_VERSION_MINOR = ffi.HPY_ABI_VERSION_MINOR;
pub const ssize_t = ffi.HPy_ssize_t;

pub const HPy = ffi.HPy;
pub const Context = ffi.HPyContext;
pub const Global = ffi.HPyGlobal;
pub const Unicode_FromString = ffi.HPyUnicode_FromString;

pub const Func_VARARGS = ffi.HPyFunc_VARARGS;
pub const Func_KEYWORDS = ffi.HPyFunc_KEYWORDS;
pub const Func_NOARGS = ffi.HPyFunc_NOARGS;
pub const Func_O = ffi.HPyFunc_O;
pub const Func_DESTROYFUNC = ffi.HPyFunc_DESTROYFUNC;
pub const Func_GETBUFFERPROC = ffi.HPyFunc_GETBUFFERPROC;
pub const Func_RELEASEBUFFERPROC = ffi.HPyFunc_RELEASEBUFFERPROC;
pub const Func_UNARYFUNC = ffi.HPyFunc_UNARYFUNC;
pub const Func_BINARYFUNC = ffi.HPyFunc_BINARYFUNC;
pub const Func_TERNARYFUNC = ffi.HPyFunc_TERNARYFUNC;
pub const Func_INQUIRY = ffi.HPyFunc_INQUIRY;
pub const Func_LENFUNC = ffi.HPyFunc_LENFUNC;
pub const Func_SSIZEARGFUNC = ffi.HPyFunc_SSIZEARGFUNC;
pub const Func_SSIZESSIZEARGFUNC = ffi.HPyFunc_SSIZESSIZEARGFUNC;
pub const Func_SSIZEOBJARGPROC = ffi.HPyFunc_SSIZEOBJARGPROC;
pub const Func_SSIZESSIZEOBJARGPROC = ffi.HPyFunc_SSIZESSIZEOBJARGPROC;
pub const Func_OBJOBJARGPROC = ffi.HPyFunc_OBJOBJARGPROC;
pub const Func_FREEFUNC = ffi.HPyFunc_FREEFUNC;
pub const Func_GETATTRFUNC = ffi.HPyFunc_GETATTRFUNC;
pub const Func_GETATTROFUNC = ffi.HPyFunc_GETATTROFUNC;
pub const Func_SETATTRFUNC = ffi.HPyFunc_SETATTRFUNC;
pub const Func_SETATTROFUNC = ffi.HPyFunc_SETATTROFUNC;
pub const Func_REPRFUNC = ffi.HPyFunc_REPRFUNC;
pub const Func_HASHFUNC = ffi.HPyFunc_HASHFUNC;
pub const Func_RICHCMPFUNC = ffi.HPyFunc_RICHCMPFUNC;
pub const Func_GETITERFUNC = ffi.HPyFunc_GETITERFUNC;
pub const Func_ITERNEXTFUNC = ffi.HPyFunc_ITERNEXTFUNC;
pub const Func_DESCRGETFUNC = ffi.HPyFunc_DESCRGETFUNC;
pub const Func_DESCRSETFUNC = ffi.HPyFunc_DESCRSETFUNC;
pub const Func_INITPROC = ffi.HPyFunc_INITPROC;
pub const Func_NEWFUNC = ffi.HPyFunc_NEWFUNC;
pub const Func_GETTER = ffi.HPyFunc_GETTER;
pub const Func_SETTER = ffi.HPyFunc_SETTER;
pub const Func_OBJOBJPROC = ffi.HPyFunc_OBJOBJPROC;
pub const Func_TRAVERSEPROC = ffi.HPyFunc_TRAVERSEPROC;
pub const Func_DESTRUCTOR = ffi.HPyFunc_DESTRUCTOR;
pub const Func_CAPSULE_DESTRUCTOR = ffi.HPyFunc_CAPSULE_DESTRUCTOR;
pub const Func_VECTORCALLFUNC = ffi.HPyFunc_VECTORCALLFUNC;
pub const Func_MOD_CREATE = ffi.HPyFunc_MOD_CREATE;
pub const Func_Signature = ffi.HPyFunc_Signature;

pub const CFunction = ffi.HPyCFunction;
pub const Def = ffi.HPyDef;
pub const Def_Kind_Meth = ffi.HPyDef_Kind_Meth;
pub const Meth = ffi.HPyMeth;

const cpy_PyCFunction = ffi.cpy_PyCFunction;
const cpy_PyObject = ffi.cpy_PyObject;
const cpy_PyMethodDef = ffi.cpy_PyMethodDef;
const _Func_args_NOARGS = ffi._HPyFunc_args_NOARGS;
const _CallRealFunctionFromTrampoline = ffi._HPy_CallRealFunctionFromTrampoline;
const _HPyModuleDef = ffi.HPyModuleDef;

pub inline fn Def_METH(trampoline_context: *?*Context, meth_name: []const u8, comptime impl: anytype, func_sig: Func_Signature) Def {
    const S = struct {
        pub fn meth_trampoline(self: ?*cpy_PyObject) callconv(.C) ?*cpy_PyObject {
            var a = _Func_args_NOARGS{
                .self = self,
                .result = null,
            };
            _CallRealFunctionFromTrampoline(trampoline_context.*, @as(c_uint, @bitCast(func_sig)), @as(CFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
            return a.result;
        }
    };

    var method_definition = Def{
        .kind = @as(c_uint, @bitCast(Def_Kind_Meth)),
        .unnamed_0 = .{
            .meth = Meth{
                .name = @ptrCast(meth_name),
                .impl = @as(CFunction, @ptrCast(@alignCast(&impl))),
                .cpy_trampoline = @as(cpy_PyCFunction, @ptrCast(@alignCast(&S.meth_trampoline))),
                .signature = @as(c_uint, @bitCast(func_sig)),
                .doc = null,
            },
        },
    };

    return method_definition;
}

pub inline fn initGlobalContext(mod_name: []const u8) *?*Context {
    // Exports the function used by HPy to pass a context to by used by functions
    const S = struct {
        pub var _ctx_for_trampolines: ?*Context = null;
        pub fn InitGlobalContext_module(ctx: ?*Context) callconv(.C) void {
            _ctx_for_trampolines = ctx;
        }
    };
    const hpyinitcontext_name = "HPyInitGlobalContext_" ++ mod_name;
    @export(S.InitGlobalContext_module, .{ .name = hpyinitcontext_name, .linkage = .Strong });

    return &S._ctx_for_trampolines;
}

pub const ModuleDef = extern struct {
    doc: [*]const u8 = "",
    size: ssize_t = 0,
    legacy_methods: ?*cpy_PyMethodDef = null,
    defines: [*:null]?*Def,
    globals: ?[*:null]?*Global = null,
};

pub inline fn MODINIT(mod_name: []const u8, module_def: ?*ModuleDef) void {

    // Exports the functions used by HPy for getting the ABI version
    const major_version_modname = "get_required_hpy_major_version_" ++ mod_name;
    @export(get_required_hpy_major_version_module, .{ .name = major_version_modname, .linkage = .Strong });
    const minor_version_modname = "get_required_hpy_minor_version_" ++ mod_name;
    @export(get_required_hpy_minor_version_module, .{ .name = minor_version_modname, .linkage = .Strong });

    // Exports the function used by HPy to get the module definition
    const S = struct {
        const _module_def = @as(*_HPyModuleDef, @ptrCast(@constCast(module_def)));
        pub fn Init_module() callconv(.C) ?*_HPyModuleDef {
            return _module_def;
        }
    };
    const init_modname = "HPyInit_" ++ mod_name;
    @export(S.Init_module, .{ .name = init_modname, .linkage = .Strong });
}

fn get_required_hpy_major_version_module() callconv(.C) u32 {
    return ABI_VERSION;
}

fn get_required_hpy_minor_version_module() callconv(.C) u32 {
    return ABI_VERSION_MINOR;
}

const std = @import("std");

const ffi = @import("./hpy_cimport.zig");

const ABI_VERSION = ffi.HPY_ABI_VERSION;
const ABI_VERSION_MINOR = ffi.HPY_ABI_VERSION_MINOR;
const ssize_t = ffi.HPy_ssize_t;

const HPy = ffi.HPy;
const Context = ffi.HPyContext;
const Global = ffi.HPyGlobal;

const Dup = ffi.HPy_Dup;
const Close = ffi.HPy_Close;

const Type_FromSpec = ffi.HPyType_FromSpec;
const SetAttr_s = ffi.HPy_SetAttr_s;

const Add = ffi.HPy_Add;

const Arg_Parse = ffi.HPyArg_Parse;
const Arg_ParseKeywords = ffi.HPyArg_ParseKeywords;

const Long_FromLong = ffi.HPyLong_FromLong;
const Unicode_FromString = ffi.HPyUnicode_FromString;

const Func_VARARGS = ffi.HPyFunc_VARARGS;
const Func_KEYWORDS = ffi.HPyFunc_KEYWORDS;
const Func_NOARGS = ffi.HPyFunc_NOARGS;
const Func_O = ffi.HPyFunc_O;
const Func_DESTROYFUNC = ffi.HPyFunc_DESTROYFUNC;
const Func_GETBUFFERPROC = ffi.HPyFunc_GETBUFFERPROC;
const Func_RELEASEBUFFERPROC = ffi.HPyFunc_RELEASEBUFFERPROC;
const Func_UNARYFUNC = ffi.HPyFunc_UNARYFUNC;
const Func_BINARYFUNC = ffi.HPyFunc_BINARYFUNC;
const Func_TERNARYFUNC = ffi.HPyFunc_TERNARYFUNC;
const Func_INQUIRY = ffi.HPyFunc_INQUIRY;
const Func_LENFUNC = ffi.HPyFunc_LENFUNC;
const Func_SSIZEARGFUNC = ffi.HPyFunc_SSIZEARGFUNC;
const Func_SSIZESSIZEARGFUNC = ffi.HPyFunc_SSIZESSIZEARGFUNC;
const Func_SSIZEOBJARGPROC = ffi.HPyFunc_SSIZEOBJARGPROC;
const Func_SSIZESSIZEOBJARGPROC = ffi.HPyFunc_SSIZESSIZEOBJARGPROC;
const Func_OBJOBJARGPROC = ffi.HPyFunc_OBJOBJARGPROC;
const Func_FREEFUNC = ffi.HPyFunc_FREEFUNC;
const Func_GETATTRFUNC = ffi.HPyFunc_GETATTRFUNC;
const Func_GETATTROFUNC = ffi.HPyFunc_GETATTROFUNC;
const Func_SETATTRFUNC = ffi.HPyFunc_SETATTRFUNC;
const Func_SETATTROFUNC = ffi.HPyFunc_SETATTROFUNC;
const Func_REPRFUNC = ffi.HPyFunc_REPRFUNC;
const Func_HASHFUNC = ffi.HPyFunc_HASHFUNC;
const Func_RICHCMPFUNC = ffi.HPyFunc_RICHCMPFUNC;
const Func_GETITERFUNC = ffi.HPyFunc_GETITERFUNC;
const Func_ITERNEXTFUNC = ffi.HPyFunc_ITERNEXTFUNC;
const Func_DESCRGETFUNC = ffi.HPyFunc_DESCRGETFUNC;
const Func_DESCRSETFUNC = ffi.HPyFunc_DESCRSETFUNC;
const Func_INITPROC = ffi.HPyFunc_INITPROC;
const Func_NEWFUNC = ffi.HPyFunc_NEWFUNC;
const Func_GETTER = ffi.HPyFunc_GETTER;
const Func_SETTER = ffi.HPyFunc_SETTER;
const Func_OBJOBJPROC = ffi.HPyFunc_OBJOBJPROC;
const Func_TRAVERSEPROC = ffi.HPyFunc_TRAVERSEPROC;
const Func_DESTRUCTOR = ffi.HPyFunc_DESTRUCTOR;
const Func_CAPSULE_DESTRUCTOR = ffi.HPyFunc_CAPSULE_DESTRUCTOR;
const Func_VECTORCALLFUNC = ffi.HPyFunc_VECTORCALLFUNC;
const Func_MOD_CREATE = ffi.HPyFunc_MOD_CREATE;
const Func_Signature = ffi.HPyFunc_Signature;

const _Func_args_VARARGS = ffi._HPyFunc_args_VARARGS;
const _Func_args_KEYWORDS = ffi._HPyFunc_args_KEYWORDS;
const _Func_args_NOARGS = ffi._HPyFunc_args_NOARGS;
const _Func_args_O = ffi._HPyFunc_args_O;
const _Func_args_DESTROYFUNC = ffi._HPyFunc_args_DESTROYFUNC;
const _Func_args_GETBUFFERPROC = ffi._HPyFunc_args_GETBUFFERPROC;
const _Func_args_RELEASEBUFFERPROC = ffi._HPyFunc_args_RELEASEBUFFERPROC;
const _Func_args_UNARYFUNC = ffi._HPyFunc_args_UNARYFUNC;
const _Func_args_BINARYFUNC = ffi._HPyFunc_args_BINARYFUNC;
const _Func_args_TERNARYFUNC = ffi._HPyFunc_args_TERNARYFUNC;
const _Func_args_INQUIRY = ffi._HPyFunc_args_INQUIRY;
const _Func_args_LENFUNC = ffi._HPyFunc_args_LENFUNC;
const _Func_args_SSIZEARGFUNC = ffi._HPyFunc_args_SSIZEARGFUNC;
const _Func_args_SSIZESSIZEARGFUNC = ffi._HPyFunc_args_SSIZESSIZEARGFUNC;
const _Func_args_SSIZEOBJARGPROC = ffi._HPyFunc_args_SSIZEOBJARGPROC;
const _Func_args_SSIZESSIZEOBJARGPROC = ffi._HPyFunc_args_SSIZESSIZEOBJARGPROC;
const _Func_args_OBJOBJARGPROC = ffi._HPyFunc_args_OBJOBJARGPROC;
const _Func_args_FREEFUNC = ffi._HPyFunc_args_FREEFUNC;
const _Func_args_GETATTRFUNC = ffi._HPyFunc_args_GETATTRFUNC;
const _Func_args_GETATTROFUNC = ffi._HPyFunc_args_GETATTROFUNC;
const _Func_args_SETATTRFUNC = ffi._HPyFunc_args_SETATTRFUNC;
const _Func_args_SETATTROFUNC = ffi._HPyFunc_args_SETATTROFUNC;
const _Func_args_REPRFUNC = ffi._HPyFunc_args_REPRFUNC;
const _Func_args_HASHFUNC = ffi._HPyFunc_args_HASHFUNC;
const _Func_args_RICHCMPFUNC = ffi._HPyFunc_args_RICHCMPFUNC;
const _Func_args_GETITERFUNC = ffi._HPyFunc_args_GETITERFUNC;
const _Func_args_ITERNEXTFUNC = ffi._HPyFunc_args_ITERNEXTFUNC;
const _Func_args_DESCRGETFUNC = ffi._HPyFunc_args_DESCRGETFUNC;
const _Func_args_DESCRSETFUNC = ffi._HPyFunc_args_DESCRSETFUNC;
const _Func_args_INITPROC = ffi._HPyFunc_args_INITPROC;
const _Func_args_NEWFUNC = ffi._HPyFunc_args_NEWFUNC;
const _Func_args_GETTER = ffi._HPyFunc_args_GETTER;
const _Func_args_SETTER = ffi._HPyFunc_args_SETTER;
const _Func_args_OBJOBJPROC = ffi._HPyFunc_args_OBJOBJPROC;
const _Func_args_TRAVERSEPROC = ffi._HPyFunc_args_TRAVERSEPROC;
const _Func_args_DESTRUCTOR = ffi._HPyFunc_args_DESTRUCTOR;
const _Func_args_CAPSULE_DESTRUCTOR = ffi._HPyFunc_args_CAPSULE_DESTRUCTOR;
const _Func_args_VECTORCALLFUNC = ffi._HPyFunc_args_VECTORCALLFUNC;
const _Func_args_MOD_CREATE = ffi._HPyFunc_MOD_args_CREATE;

const CFunction = ffi.HPyCFunction;
const Def = ffi.HPyDef;
const Def_Kind_Meth = ffi.HPyDef_Kind_Meth;
const Def_Kind_Slot = ffi.HPyDef_Kind_Slot;
const Meth = ffi.HPyMeth;
const Slot = ffi.HPySlot;
const Type_Spec = ffi.HPyType_Spec;
const Type_BuiltinShape = ffi.HPyType_BuiltinShape;

const tp_new = ffi.HPy_tp_new;
const tp_repr = ffi.HPy_tp_repr;
const mod_exec = ffi.HPy_mod_exec;

//TODO: Make these internal
const cpy_PyCFunction = ffi.cpy_PyCFunction;
const cpy_PyObject = ffi.cpy_PyObject;
const cpy_PyMethodDef = ffi.cpy_PyMethodDef;
const _New = ffi._HPy_New;
const _AsStruct_Object = ffi._HPy_AsStruct_Object;
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

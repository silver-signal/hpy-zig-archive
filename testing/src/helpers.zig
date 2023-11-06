//! A collection of helper functions to help with writing Python modules in zig. They are not
//! strictly necessary, but they greatly reduce boilerplate code. Mainly used to replace
//! untranslatable HPy C macros such as the macro functions in hpydef.h.

const hpy = @import("./hpy_cimport.zig");

// TODO: Is it possible to pass a HPySlot_Slot value instead of a string? Using a string
// works just as well, but it'd be nice to track closer to the original macro usage.
/// Module slot definition helper. Replaces the "HPyDef_SLOT" macro.
pub fn Def_SLOT(comptime mod_ctx: *?*hpy.HPyContext, comptime impl: anytype, comptime slot: []const u8) hpy.HPyDef {
    const slot_func_sig = "_HPySlot_SIG__" ++ slot;
    var S = Func_TRAMPOLINE(mod_ctx, impl, @field(hpy, slot_func_sig));

    var slot_enum = @field(hpy, slot);
    var slot_definition = hpy.HPyDef{
        .kind = @as(c_uint, @bitCast(hpy.HPyDef_Kind_Slot)),
        .unnamed_0 = .{
            .slot = hpy.HPySlot{
                .slot = @as(c_uint, @bitCast(slot_enum)),
                .impl = @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))),
                .cpy_trampoline = @as(hpy.cpy_PyCFunction, @ptrCast(@alignCast(&S.trampoline))),
            },
        },
    };
    return slot_definition;
}

/// Used for defining a module method. Replaces the "HPyDef_METH" macro.
pub fn Def_METH(comptime mod_ctx: *?*hpy.HPyContext, comptime meth_name: []const u8, comptime impl: anytype, comptime sig: hpy.HPyFunc_Signature) hpy.HPyDef {
    var S = Func_TRAMPOLINE(mod_ctx, impl, sig);

    var method_definition = hpy.HPyDef{
        .kind = @as(c_uint, @bitCast(hpy.HPyDef_Kind_Meth)),
        .unnamed_0 = .{
            .meth = hpy.HPyMeth{
                .name = @ptrCast(meth_name),
                .impl = @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))),
                .cpy_trampoline = @as(hpy.cpy_PyCFunction, @ptrCast(@alignCast(&S.trampoline))),
                .signature = @as(c_uint, @bitCast(sig)),
                .doc = null,
            },
        },
    };
    return method_definition;
}

/// Emit a CPython-compatible trampoline which calls IMPL, where IMPL has the signature SIG.
/// Replaces the HPy macro "HPyFunc_TRAMPOLINE".
pub fn Func_TRAMPOLINE(comptime mod_ctx: *?*hpy.HPyContext, comptime impl: anytype, comptime sig: hpy.HPyFunc_Signature) type {
    var S = struct {};
    switch (sig) {
        hpy.HPyFunc_NOARGS => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_NOARGS{
                        .self = self,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(sig)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_VARARGS => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, args: [*c]const ?*hpy.cpy_PyObject, nargs: hpy.HPy_ssize_t) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_VARARGS{
                        .self = self,
                        .args = args,
                        .nargs = nargs,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_VARARGS)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_KEYWORDS => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, args: [*c]const ?*hpy.cpy_PyObject, nargs: usize, kwnames: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_KEYWORDS{
                        .self = self,
                        .args = args,
                        .nargsf = nargs,
                        .kwnames = kwnames,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_KEYWORDS)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_O => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, arg: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_O{
                        .self = self,
                        .arg = arg,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_O)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_DESTROYFUNC,
        hpy.HPyFunc_GETBUFFERPROC,
        hpy.HPyFunc_RELEASEBUFFERPROC,
        hpy.HPyFunc_UNARYFUNC,
        hpy.HPyFunc_BINARYFUNC,
        hpy.HPyFunc_TERNARYFUNC,
        => {
            const msg =
                \\This HPy method has not been implemented yet.
            ;
            @compileError(msg);
        },
        hpy.HPyFunc_INQUIRY => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_INQUIRY{
                        .arg0 = arg0,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_INQUIRY)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_LENFUNC,
        hpy.HPyFunc_SSIZEARGFUNC,
        hpy.HPyFunc_SSIZESSIZEARGFUNC,
        hpy.HPyFunc_SSIZEOBJARGPROC,
        hpy.HPyFunc_SSIZESSIZEOBJARGPROC,
        hpy.HPyFunc_OBJOBJARGPROC,
        hpy.HPyFunc_FREEFUNC,
        hpy.HPyFunc_GETATTRFUNC,
        hpy.HPyFunc_GETATTROFUNC,
        hpy.HPyFunc_SETATTRFUNC,
        hpy.HPyFunc_SETATTROFUNC,
        => {
            const msg =
                \\This HPy method has not been implemented yet.
            ;
            @compileError(msg);
        },
        hpy.HPyFunc_REPRFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_REPRFUNC{
                        .arg0 = arg0,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_REPRFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_HASHFUNC,
        hpy.HPyFunc_RICHCMPFUNC,
        hpy.HPyFunc_GETITERFUNC,
        hpy.HPyFunc_ITERNEXTFUNC,
        hpy.HPyFunc_DESCRGETFUNC,
        hpy.HPyFunc_DESCRSETFUNC,
        hpy.HPyFunc_INITPROC,
        => {
            const msg =
                \\This HPy method has not been implemented yet.
            ;
            @compileError(msg);
        },
        hpy.HPyFunc_NEWFUNC => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, args: ?*hpy.cpy_PyObject, kw: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_NEWFUNC{
                        .self = self,
                        .args = args,
                        .kw = kw,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_NEWFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_GETTER,
        hpy.HPyFunc_SETTER,
        hpy.HPyFunc_OBJOBJPROC,
        hpy.HPyFunc_TRAVERSEPROC,
        hpy.HPyFunc_DESTRUCTOR,
        hpy.HPyFunc_CAPSULE_DESTRUCTOR,
        hpy.HPyFunc_VECTORCALLFUNC,
        hpy.HPyFunc_MOD_CREATE,
        => {
            const msg =
                \\This HPy method has not been implemented yet.
            ;
            @compileError(msg);
        },
        else => {
            const msg =
                \\Helper function Def_METH received an unsupported value for the 
                \\'func_sig' parameter.
            ;
            @compileError(msg);
        },
    }
    return S;
}

pub fn initGlobalContext(comptime mod_name: []const u8) *?*hpy.HPyContext {
    // Exports the function used by HPy to pass a context to by used by functions
    const S = struct {
        pub var _ctx_for_trampolines: ?*hpy.HPyContext = null;
        pub fn InitGlobalContext_module(ctx: ?*hpy.HPyContext) callconv(.C) void {
            _ctx_for_trampolines = ctx;
        }
    };
    const hpyinitcontext_name = "HPyInitGlobalContext_" ++ mod_name;
    @export(S.InitGlobalContext_module, .{ .name = hpyinitcontext_name, .linkage = .Strong });

    return &S._ctx_for_trampolines;
}

pub const ModuleDef = extern struct {
    doc: [*]const u8 = "",
    size: hpy.HPy_ssize_t = 0,
    legacy_methods: ?*hpy.cpy_PyMethodDef = null,
    defines: [*:null]?*hpy.HPyDef,
    globals: ?[*:null]?*hpy.HPyGlobal = null,
};

pub inline fn MODINIT(comptime mod_name: []const u8, comptime module_def: ?*ModuleDef) void {

    // Exports the functions used by HPy for getting the ABI version
    const major_version_modname = "get_required_hpy_major_version_" ++ mod_name;
    @export(get_required_hpy_major_version_module, .{ .name = major_version_modname, .linkage = .Strong });
    const minor_version_modname = "get_required_hpy_minor_version_" ++ mod_name;
    @export(get_required_hpy_minor_version_module, .{ .name = minor_version_modname, .linkage = .Strong });

    // Exports the function used by HPy to get the module definition
    const S = struct {
        const _module_def = @as(*hpy.HPyModuleDef, @ptrCast(@constCast(module_def)));
        pub fn Init_module() callconv(.C) ?*hpy.HPyModuleDef {
            return _module_def;
        }
    };
    const init_modname = "HPyInit_" ++ mod_name;
    @export(S.Init_module, .{ .name = init_modname, .linkage = .Strong });
}

fn get_required_hpy_major_version_module() callconv(.C) u32 {
    return hpy.HPY_ABI_VERSION;
}

fn get_required_hpy_minor_version_module() callconv(.C) u32 {
    return hpy.HPY_ABI_VERSION_MINOR;
}

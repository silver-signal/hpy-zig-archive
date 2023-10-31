const std = @import("std");

pub const ffi = @import("./ffi.zig");
pub const HPyContext = ffi.HPyContext;
pub const HPy = ffi.HPy;
pub const HPyUnicode_FromString = ffi.HPyUnicode_FromString;
pub const cpy_PyObject = ffi.cpy_PyObject;
pub const _HPyFunc_args_NOARGS = ffi._HPyFunc_args_NOARGS;
pub const _HPy_CallRealFunctionFromTrampoline = ffi._HPy_CallRealFunctionFromTrampoline;
pub const HPyFunc_NOARGS = ffi.HPyFunc_NOARGS;
pub const HPyFunc_Signature = ffi.HPyFunc_Signature;
pub const HPyCFunction = ffi.HPyCFunction;
pub const HPyDef = ffi.HPyDef;
pub const HPyModuleDef = ffi.HPyModuleDef;
pub const HPyDef_Kind_Meth = ffi.HPyDef_Kind_Meth;
pub const HPy_ssize_t = ffi.HPy_ssize_t;
pub const HPyMeth = ffi.HPyMeth;
pub const cpy_PyCFunction = ffi.cpy_PyCFunction;
pub const HPY_ABI_VERSION = ffi.HPY_ABI_VERSION;
pub const HPY_ABI_VERSION_MINOR = ffi.HPY_ABI_VERSION_MINOR;

pub inline fn HPyZigDef_METH(trampoline_context: *?*HPyContext, meth_name: []const u8, comptime impl: anytype, func_sig: HPyFunc_Signature) HPyDef {
    const S = struct {
        pub fn meth_trampoline(self: ?*cpy_PyObject) callconv(.C) ?*cpy_PyObject {
            var a: _HPyFunc_args_NOARGS = _HPyFunc_args_NOARGS{
                .self = self,
                .result = null,
            };
            _HPy_CallRealFunctionFromTrampoline(trampoline_context.*, @as(c_uint, @bitCast(func_sig)), @as(HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
            return a.result;
        }
    };

    var method_definition: HPyDef = HPyDef{
        .kind = @as(c_uint, @bitCast(HPyDef_Kind_Meth)),
        .unnamed_0 = .{
            .meth = HPyMeth{
                .name = @ptrCast(meth_name),
                .impl = @as(HPyCFunction, @ptrCast(@alignCast(&impl))),
                .cpy_trampoline = @as(cpy_PyCFunction, @ptrCast(@alignCast(&S.meth_trampoline))),
                .signature = @as(c_uint, @bitCast(func_sig)),
                .doc = null,
            },
        },
    };

    return method_definition;
}

pub inline fn HPyZig_InitGlobalContext(mod_name: []const u8) *?*HPyContext {
    // Exports the function used by HPy to pass a context to by used by functions
    const S = struct {
        pub var _ctx_for_trampolines: ?*HPyContext = null;
        pub fn HPyInitGlobalContext_module(ctx: ?*HPyContext) callconv(.C) void {
            _ctx_for_trampolines = ctx;
        }
    };
    const hpyinitcontext_name = "HPyInitGlobalContext_" ++ mod_name;
    @export(S.HPyInitGlobalContext_module, .{ .name = hpyinitcontext_name, .linkage = .Strong });

    return &S._ctx_for_trampolines;
}

pub inline fn HPyZig_MODINIT(mod_name: []const u8, module_def: ?*HPyModuleDef) void {

    // Exports the functions used by HPy for getting the ABI version
    const major_version_modname = "get_required_hpy_major_version_" ++ mod_name;
    @export(get_required_hpy_major_version_module, .{ .name = major_version_modname, .linkage = .Strong });
    const minor_version_modname = "get_required_hpy_minor_version_" ++ mod_name;
    @export(get_required_hpy_minor_version_module, .{ .name = minor_version_modname, .linkage = .Strong });

    // Exports the function used by HPy to get the module definition
    const S = struct {
        pub fn HPyInit_module() callconv(.C) ?*HPyModuleDef {
            return module_def;
        }
    };
    const hpyinit_modname = "HPyInit_" ++ mod_name;
    @export(S.HPyInit_module, .{ .name = hpyinit_modname, .linkage = .Strong });
}

fn get_required_hpy_major_version_module() callconv(.C) u32 {
    return ffi.HPY_ABI_VERSION;
}

fn get_required_hpy_minor_version_module() callconv(.C) u32 {
    return ffi.HPY_ABI_VERSION_MINOR;
}

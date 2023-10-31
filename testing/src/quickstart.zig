const std = @import("std");

const ffi = @import("./ffi.zig");
const HPyContext = ffi.HPyContext;
const HPy = ffi.HPy;
const HPyUnicode_FromString = ffi.HPyUnicode_FromString;
const cpy_PyObject = ffi.cpy_PyObject;
const _HPyFunc_args_NOARGS = ffi._HPyFunc_args_NOARGS;
const _HPy_CallRealFunctionFromTrampoline = ffi._HPy_CallRealFunctionFromTrampoline;
const HPyFunc_NOARGS = ffi.HPyFunc_NOARGS;
const HPyFunc_Signature = ffi.HPyFunc_Signature;
const HPyCFunction = ffi.HPyCFunction;
const HPyDef = ffi.HPyDef;
const HPyModuleDef = ffi.HPyModuleDef;
const HPyDef_Kind_Meth = ffi.HPyDef_Kind_Meth;
const HPy_ssize_t = ffi.HPy_ssize_t;
const HPyMeth = ffi.HPyMeth;
const cpy_PyCFunction = ffi.cpy_PyCFunction;

pub fn say_hello_impl(ctx: ?*HPyContext, self: HPy) callconv(.C) HPy {
    _ = self;
    return HPyUnicode_FromString(ctx, "Hello world!");
}

const meth_sig2 = union(enum) {
    HPyFunc_NOARGS: *const fn (ctx: ?*HPyContext, self: HPy) callconv(.C) HPy,
};

const meth_sig = *const fn (ctx: ?*HPyContext, self: HPy) callconv(.C) HPy;

pub export var say_hello = HPyZigDef_METH(ctx_for_trampolines, "say_hello", say_hello_impl, HPyFunc_NOARGS);

pub inline fn HPyZigDef_METH(trampoline_context: *?*HPyContext, meth_name: []const u8, comptime impl: anytype, func_sig: HPyFunc_Signature) HPyDef {
    const S = struct {
        pub fn say_hello_trampoline(self: ?*cpy_PyObject) callconv(.C) ?*cpy_PyObject {
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
                .cpy_trampoline = @as(cpy_PyCFunction, @ptrCast(@alignCast(&S.say_hello_trampoline))),
                .signature = @as(c_uint, @bitCast(func_sig)),
                .doc = null,
            },
        },
    };

    return method_definition;
}

pub var QuickstartCMethods: [2]?*HPyDef = [2]?*HPyDef{
    &say_hello,
    null,
};

pub var quickstart_zig_def: HPyModuleDef = HPyModuleDef{
    .doc = "HPy Quickstart Zig Example",
    .size = std.mem.zeroes(HPy_ssize_t),
    .legacy_methods = null,
    .defines = @as([*c][*c]HPyDef, @ptrCast(@alignCast(&QuickstartCMethods))),
    .globals = null,
};

comptime {
    HPyZig_MODINIT("quickstart_zig", &quickstart_zig_def);
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

const ctx_for_trampolines = HPyZig_InitGlobalContext("quickstart_zig");
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

fn get_required_hpy_major_version_module() callconv(.C) u32 {
    return ffi.HPY_ABI_VERSION;
}

fn get_required_hpy_minor_version_module() callconv(.C) u32 {
    return ffi.HPY_ABI_VERSION_MINOR;
}

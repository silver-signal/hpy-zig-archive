pub usingnamespace @import("hpy_cimport.zig");
pub const def = @import("def.zig");

const std = @import("std");

const ffi = @import("hpy_cimport.zig");
const abi = @import("config.zig").hpy_abi;
const cpython_abi = std.mem.eql(u8, abi, "HPY_ABI_CPYTHON");

/// Exports functions required by the HPy ABI. Replaces the "HPy_MODINIT" macro.
pub inline fn ModuleInit(comptime mod_ctx: *?*ffi.HPyContext, comptime mod_name: []const u8, comptime mod_def: ?*const def.Module) void {
    // For the CPython ABI, we just need to export a 'PyInit_{mod_name}' function
    // compliant with the CPython ABI. In other words, just return the module definition.
    // Luckily, the hpy lib provides a function for converting an HPy Module definition to
    // a CPython Module definition.
    //
    // For the universal and hybrid ABIs, we need to export the following functions:
    // 1. get_required_hpy_major_version_{mod_name}() u32
    // 2. get_required_hpy_minor_version_{mod_name}() u32
    // 3. HPyInit_{mod_name}() ?*HPyModuleDef
    // 4. HPyInitGlobalContext_{modname}(ctx: ?*HPyContext) void
    if (cpython_abi) {
        const S = struct {
            const _mod_def = @as(*ffi.HPyModuleDef, @ptrCast(@constCast(mod_def)));
            pub fn PyInit_module() callconv(.C) ?*ffi.PyObject {
                return ffi._HPyModuleDef_AsPyInit(_mod_def);
            }
        };
        const pyinit_modname = "PyInit_" ++ mod_name;
        @export(&S.PyInit_module, .{ .name = pyinit_modname, .linkage = .strong });
    } else {
        // Exports the functions used by HPy for getting the ABI version
        const major_version_modname = "get_required_hpy_major_version_" ++ mod_name;
        @export(&get_required_hpy_major_version_module, .{ .name = major_version_modname, .linkage = .strong });
        const minor_version_modname = "get_required_hpy_minor_version_" ++ mod_name;
        @export(&get_required_hpy_minor_version_module, .{ .name = minor_version_modname, .linkage = .strong });

        // Exports the function used by HPy to get the module definition. Required by the HPy ABI.
        const S1 = struct {
            const _mod_def = @as(*ffi.HPyModuleDef, @ptrCast(@constCast(mod_def)));
            pub fn HPyInit_module() callconv(.C) ?*ffi.HPyModuleDef {
                return _mod_def;
            }
        };
        const hpyinit_modname = "HPyInit_" ++ mod_name;
        @export(&S1.HPyInit_module, .{ .name = hpyinit_modname, .linkage = .strong });

        // Exports the function used by HPy to pass a context to by used by functions. Required by the HPy ABI.
        const S2 = struct {
            //pub var _ctx_for_trampolines: ?*ffi.HPyContext = null;
            pub fn InitGlobalContext_module(ctx: ?*ffi.HPyContext) callconv(.C) void {
                mod_ctx.* = ctx;
            }
        };
        const hpyinitcontext_name = "HPyInitGlobalContext_" ++ mod_name;
        @export(&S2.InitGlobalContext_module, .{ .name = hpyinitcontext_name, .linkage = .strong });
    }
}

/// The HPy major version that this code was compiled with. Required by the HPy ABI.
fn get_required_hpy_major_version_module() callconv(.C) u32 {
    return ffi.HPY_ABI_VERSION;
}

/// The HPy minor version that this code was compiled with. Required by the HPy ABI.
fn get_required_hpy_minor_version_module() callconv(.C) u32 {
    return ffi.HPY_ABI_VERSION_MINOR;
}

const hpy = @import("./hpy_cimport.zig");

pub inline fn Def_METH(trampoline_context: *?*hpy.HPyContext, meth_name: []const u8, comptime impl: anytype, func_sig: hpy.HPyFunc_Signature) hpy.HPyDef {
    var method_definition: hpy.HPyDef = undefined;

    switch (func_sig) {
        hpy.HPyFunc_NOARGS => {
            const S = struct {
                pub fn meth_trampoline(self: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_NOARGS{
                        .self = self,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(trampoline_context.*, @as(c_uint, @bitCast(func_sig)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };

            method_definition = hpy.HPyDef{
                .kind = @as(c_uint, @bitCast(hpy.HPyDef_Kind_Meth)),
                .unnamed_0 = .{
                    .meth = hpy.HPyMeth{
                        .name = @ptrCast(meth_name),
                        .impl = @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))),
                        .cpy_trampoline = @as(hpy.cpy_PyCFunction, @ptrCast(@alignCast(&S.meth_trampoline))),
                        .signature = @as(c_uint, @bitCast(func_sig)),
                        .doc = null,
                    },
                },
            };
        },
        else => {
            const msg =
                \\Helper function Def_METH received an unsupported value for the 
                \\'func_sig' parameter.
            ;
            @compileError(msg);
        },
    }
    return method_definition;
}

pub inline fn initGlobalContext(mod_name: []const u8) *?*hpy.HPyContext {
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

pub inline fn MODINIT(mod_name: []const u8, module_def: ?*ModuleDef) void {

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

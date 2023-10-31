const std = @import("std");

const hpy = @import("./hpy.zig");
const HPy = hpy.HPy;
const HPy_ssize_t = hpy.HPy_ssize_t;
const HPyDef = hpy.HPyDef;
const HPyContext = hpy.HPyContext;
const HPyGlobal = hpy.HPyGlobal;
const cpy_PyMethodDef = hpy.cpy_PyMethodDef;
const HPyFunc_NOARGS = hpy.HPyFunc_NOARGS;
const HPyUnicode_FromString = hpy.HPyUnicode_FromString;

const HPY_ABI_VERSION = hpy.HPY_ABI_VERSION;
const HPY_ABI_VERSION_MINOR = hpy.HPY_ABI_VERSION_MINOR;

const HPyZigDef_METH = hpy.HPyZigDef_METH;
const HPyZig_InitGlobalContext = hpy.HPyZig_InitGlobalContext;

const ctx_for_trampolines = HPyZig_InitGlobalContext("quickstart_zig");

pub export var say_hello = HPyZigDef_METH(ctx_for_trampolines, "say_hello", say_hello_impl, HPyFunc_NOARGS);
pub fn say_hello_impl(ctx: ?*HPyContext, self: HPy) callconv(.C) HPy {
    _ = self;
    return HPyUnicode_FromString(ctx, "Hello world!");
}

var QuickstartCMethods = [_:null]?*HPyDef{
    &say_hello,
};

var quickstart_zig_def = HPyModuleDef{
    .doc = "HPy Quickstart Zig Example",
    .size = std.mem.zeroes(HPy_ssize_t),
    .legacy_methods = null,
    .defines = @as([*c][*c]HPyDef, @ptrCast(@alignCast(&QuickstartCMethods))),
    .globals = null,
};

const HPyModuleDef = hpy.HPyModuleDef;
pub const HPyZigModuleDef = extern struct {
    doc: [*]const u8 = "",
    size: HPy_ssize_t = 0,
    legacy_methods: ?*cpy_PyMethodDef = null,
    defines: [*:null]?*HPyDef,
    globals: ?[*:null]?*HPyGlobal = null,
};

var quickstart_zig_def_new = HPyZigModuleDef{
    .doc = "HPy Quickstart Zig Example",
    .defines = &QuickstartCMethods,
};

comptime {
    HPyZig_MODINIT("quickstart_zig", &quickstart_zig_def_new);
}

//const HPyZig_MODINIT = hpy.HPyZig_MODINIT;
pub inline fn HPyZig_MODINIT(mod_name: []const u8, module_def: ?*HPyZigModuleDef) void {

    // Exports the functions used by HPy for getting the ABI version
    const major_version_modname = "get_required_hpy_major_version_" ++ mod_name;
    @export(get_required_hpy_major_version_module, .{ .name = major_version_modname, .linkage = .Strong });
    const minor_version_modname = "get_required_hpy_minor_version_" ++ mod_name;
    @export(get_required_hpy_minor_version_module, .{ .name = minor_version_modname, .linkage = .Strong });

    // Exports the function used by HPy to get the module definition
    const S = struct {
        var _hpy_module_def = HPyModuleDef{
            .doc = "HPy Quickstart Zig Example",
            .size = std.mem.zeroes(HPy_ssize_t),
            .legacy_methods = null,
            .defines = @as([*c][*c]HPyDef, @ptrCast(@alignCast(&QuickstartCMethods))),
            .globals = null,
        };
        //const _hpy_module_def_ptr = &_hpy_module_def;
        // _ = module_def;
        const _hpy_module_def_ptr = @as(*HPyModuleDef, @ptrCast(@constCast(module_def)));
        pub fn HPyInit_module() callconv(.C) ?*HPyModuleDef {
            return _hpy_module_def_ptr;
        }
    };
    const hpyinit_modname = "HPyInit_" ++ mod_name;
    @export(S.HPyInit_module, .{ .name = hpyinit_modname, .linkage = .Strong });
}

fn get_required_hpy_major_version_module() callconv(.C) u32 {
    return HPY_ABI_VERSION;
}

fn get_required_hpy_minor_version_module() callconv(.C) u32 {
    return HPY_ABI_VERSION_MINOR;
}

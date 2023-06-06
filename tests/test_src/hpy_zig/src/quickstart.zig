const std = @import("std");
const fmt = std.fmt;
const testing = std.testing;

//const hpyh = @cImport({
//    @cDefine("HPY_ABI_UNIVERSAL", {});
//    @cInclude("hpy.h");
//})

const hpy = @import("hpy_universal.zig");
const HPy = hpy.HPy;
const HPyDef = hpy.HPyDef;
const cpy_PyObject = hpy.cpy_PyObject;
const HPyFunc_NOARGS = hpy.HPyFunc_NOARGS;
const _HPyFunc_args_NOARGS = hpy._HPyFunc_args_NOARGS;
const _HPy_CallRealFunctionFromTrampoline = hpy._HPy_CallRealFunctionFromTrampoline;
const HPyModuleDef = hpy.HPyModuleDef;
const HPyContext = hpy.HPyContext;
const HPyUnicode_FromString = hpy.HPyUnicode_FromString;

const HPY_ABI_VERSION = hpy.HPY_ABI_VERSION;
const HPY_ABI_VERSION_MINOR = hpy.HPY_ABI_VERSION_MINOR;

//const say_hello = undefined; //HPyDef_METH("say_hello", HPyFunc_NOARGS);
fn say_hello_impl(ctx: *HPyContext, self: HPy) HPy {
    _ = self;
    return HPyUnicode_FromString(ctx, "Hello world!");
}

//const QuickstartMethods = [_]*HPyDef{
//    &say_hello,
//    null,
//};
//
//const quickstart_def = HPyModuleDef{
//    .doc = "HPy Quickstart Example",
//    .defines = QuickstartMethods,
//};
//
//comptime {
//    HPy_MODINIT("quickstart", quickstart_def);
//}

//var ctx_for_trampolines: *HPyContext = undefined;
//
//fn HPyDef_METH(meth_name: []const u8, meth_sig: c_int) void {
//    std.debug.print("{s}\n", .{meth_name});
//    std.debug.print("{d}\n", .{meth_sig});
//}
//
//fn makeModuleTrampoline() fn () *cpy_PyObject {
//    const S = struct {
//        fn moduleTrampoline(self: *cpy_PyObject) *cpy_PyObject {
//            //var a: _HPyFunc_args_NOARGS a = {self};
//            //_HPy_CallRealFunctionFromTrampoline();
//            return self;
//        }
//    };
//    return S.moduleTrampoline;
//}

pub inline fn HPy_MODINIT(ext_name: []const u8, mod_def: HPyModuleDef) void {
    std.debug.print("{s}\n", .{ext_name});
    std.debug.print("{s}\n", .{@typeName(mod_def)});

    const getMajorVersion = makeGetRequiredHPyVersion(HPY_ABI_VERSION);
    const getMajorVersionFuncName = "get_required_hpy_major_version_" ++ ext_name;
    @export(getMajorVersion, .{
        .name = getMajorVersionFuncName,
        .linkage = .Strong,
    });

    const getMinorVersion = makeGetRequiredHPyVersion(HPY_ABI_VERSION_MINOR);
    const getMinorVersionFuncName = "get_required_hpy_minor_version_" ++ ext_name;
    @export(getMinorVersion, .{
        .name = getMinorVersionFuncName,
        .linkage = .Strong,
    });

    const initContext = makeHPyInitGlobalContext();
    const initContextFuncName = "HPyInitGlobalContext_" ++ ext_name;
    @export(initContext, .{
        .name = initContextFuncName,
        .linkage = .Strong,
    });
}

/// Return a function which returns the required HPy version
fn makeGetRequiredHPyVersion(comptime hpy_version: u32) fn () u32 {
    const S = struct {
        fn getRequiredHPyVersion() u32 {
            return hpy_version;
        }
    };
    return S.getRequiredHPyVersion;
}

/// Create a function which allows HPy to set the global context
fn makeHPyInitGlobalContext() fn () void {
    // FIXME:
    const S = struct {
        fn HPyInitGlobalContext(ctx: *HPyContext) void {
            std.debug.print("{s}\n", .{@typeName(ctx)});
        }
    };
    return S.HPyInitGlobalContext;
}

/// Create a function to send the module definition to HPy
fn makeHPyInit(mod_def: HPyModuleDef) fn () *HPyModuleDef {
    const S = struct {
        fn HPyInit() *HPyModuleDef {
            return &mod_def;
        }
    };
    return S.HPyInit;
}

pub inline fn exportTest(name: []const u8) void {
    @export(add, .{
        .name = name,
        .linkage = .Strong,
    });
}

export fn add(a: i32, b: i32) i32 {
    return a + b;
}

comptime {
    exportTest("nameTesting");
}

test "basic add functionality" {
    try testing.expect(add(3, 7) == 10);
}

//! A collection of helper functions to help with writing Python modules in zig. They are not
//! strictly necessary, but they greatly reduce boilerplate code. Mainly used to replace
//! untranslatable HPy C macros such as the macro functions in hpydef.h.

const std = @import("std");

const abort = @cImport({
    @cInclude("stdlib.h");
}).abort;

const hpy = @import("./hpy_cimport.zig");

/// Module slot definition helper. Replaces the "HPyDef_SLOT" macro.
pub fn Def_SLOT(comptime mod_ctx: *?*hpy.HPyContext, comptime impl: anytype, comptime slot: hpy.HPySlot_Slot) hpy.HPyDef {
    const slot_func_sig = slotFuncSigLookup(slot);
    var S = Func_TRAMPOLINE(mod_ctx, impl, slot_func_sig);

    var slot_definition = hpy.HPyDef{
        .kind = @as(c_uint, @bitCast(hpy.HPyDef_Kind_Slot)),
        .unnamed_0 = .{
            .slot = hpy.HPySlot{
                .slot = @as(c_uint, @bitCast(slot)), //_enum)),
                .impl = @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))),
                .cpy_trampoline = @as(hpy.cpy_PyCFunction, @ptrCast(@alignCast(&S.trampoline))),
            },
        },
    };
    return slot_definition;
}

/// Gets the function signature associated with the slot enum passed in.
fn slotFuncSigLookup(comptime slot: hpy.HPySlot_Slot) hpy.HPyFunc_Signature {
    const autogen_hpyslot = @cImport({
        @cDefine("HPY", {});
        @cDefine("HPY_ABI_UNIVERSAL", {});
        @cInclude("hpy/autogen_hpyslot.h");
    });
    const hpy_decls = @typeInfo(autogen_hpyslot).Struct.decls;
    var slot_name: []const u8 = undefined;
    for (hpy_decls) |declaration| {
        if (std.mem.startsWith(u8, declaration.name, "HPy_")) {
            const val = @field(hpy, declaration.name);
            if (val == slot) {
                slot_name = declaration.name;
                break;
            }
        }
    }

    const slot_func_sig_name = "_HPySlot_SIG__" ++ slot_name;
    const slot_func_sig: hpy.HPyFunc_Signature = @field(hpy, slot_func_sig_name);
    return slot_func_sig;
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

/// Convenience function for generating an HPyCallFunction definition. Replaces the "HPyDef_CALL_FUNCTION" macro
pub fn Def_CALL_FUNCTION(comptime mod_ctx: *?*hpy.HPyContext, comptime name: []const u8, comptime impl: anytype) hpy.HPyCallFunction {
    _ = name;
    var S = Func_TRAMPOLINE(mod_ctx, impl, hpy.HPyFunc_KEYWORDS);
    var call_function_definition = hpy.HPyCallFunction{
        .cpy_trampoline = @as(hpy.cpy_vectorcallfunc, @ptrCast(@alignCast(&S.trampoline))),
        .impl = @as(hpy.HPyFunc_keywords, @ptrCast(@alignCast(&impl))),
    };
    return call_function_definition;
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
        hpy.HPyFunc_DESTROYFUNC => {
            S = struct {
                pub fn trampoline() callconv(.C) noreturn {
                    abort();
                }
            };
        },
        hpy.HPyFunc_GETBUFFERPROC => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, view: ?*hpy.cpy_Py_buffer, flags: c_int) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_GETBUFFERPROC{
                        .self = self,
                        .view = view,
                        .flags = flags,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_GETBUFFERPROC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_RELEASEBUFFERPROC => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, view: ?*hpy.cpy_Py_buffer) callconv(.C) void {
                    var a = hpy._HPyFunc_args_RELEASEBUFFERPROC{
                        .self = self,
                        .view = view,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_RELEASEBUFFERPROC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return;
                }
            };
        },
        hpy.HPyFunc_UNARYFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_UNARYFUNC{
                        .arg0 = arg0,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_UNARYFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_BINARYFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_BINARYFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_BINARYFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_TERNARYFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject, arg2: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_TERNARYFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_TERNARYFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
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
        hpy.HPyFunc_LENFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) hpy.HPy_ssize_t {
                    var a = hpy._HPyFunc_args_LENFUNC{
                        .arg0 = arg0,
                        .result = std.mem.zeroes(hpy.HPy_ssize_t),
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_LENFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_SSIZEARGFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: hpy.HPy_ssize_t) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_SSIZEARGFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_SSIZEARGFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_SSIZESSIZEARGFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: hpy.HPy_ssize_t, arg2: hpy.HPy_ssize_t) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_SSIZESSIZEARGFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_SSIZESSIZEARGFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_SSIZEOBJARGPROC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: hpy.HPy_ssize_t, arg2: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_SSIZEOBJARGPROC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_SSIZEOBJARGPROC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_SSIZESSIZEOBJARGPROC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: hpy.HPy_ssize_t, arg2: hpy.HPy_ssize_t, arg3: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_SSIZESSIZEOBJARGPROC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .arg3 = arg3,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_SSIZESSIZEOBJARGPROC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_OBJOBJARGPROC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject, arg2: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_OBJOBJARGPROC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_OBJOBJARGPROC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_FREEFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*anyopaque) callconv(.C) void {
                    var a = hpy._HPyFunc_args_FREEFUNC{
                        .arg0 = arg0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_FREEFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return;
                }
            };
        },
        hpy.HPyFunc_GETATTRFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: [*c]u8) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_GETATTRFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_GETATTRFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_GETATTROFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_GETATTROFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_GETATTROFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_SETATTRFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: [*c]u8, arg2: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_SETATTRFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_SETATTRFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_SETATTROFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject, arg2: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_SETATTROFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_SETATTROFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
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
        hpy.HPyFunc_HASHFUNC => {
            S = struct {
                pub fn HASHFUNC_trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) hpy.HPy_hash_t {
                    var a = hpy._HPyFunc_args_HASHFUNC{
                        .arg0 = arg0,
                        .result = std.mem.zeroes(hpy.HPy_hash_t),
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_HASHFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_RICHCMPFUNC => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, obj: ?*hpy.cpy_PyObject, op: c_int) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_RICHCMPFUNC{
                        .arg0 = self,
                        .arg1 = obj,
                        .arg2 = @as(c_uint, @bitCast(op)),
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_RICHCMPFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_GETITERFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_GETITERFUNC{
                        .arg0 = arg0,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_GETITERFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_ITERNEXTFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_ITERNEXTFUNC{
                        .arg0 = arg0,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_ITERNEXTFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_DESCRGETFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject, arg2: ?*hpy.cpy_PyObject) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_DESCRGETFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_DESCRGETFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_DESCRSETFUNC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject, arg2: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_DESCRSETFUNC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_DESCRSETFUNC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_INITPROC => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, args: ?*hpy.cpy_PyObject, kw: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_INITPROC{
                        .self = self,
                        .args = args,
                        .kw = kw,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_INITPROC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
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
        hpy.HPyFunc_GETTER => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*anyopaque) callconv(.C) ?*hpy.cpy_PyObject {
                    var a = hpy._HPyFunc_args_GETTER{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_GETTER)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_SETTER => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject, arg2: ?*anyopaque) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_SETTER{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .arg2 = arg2,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_SETTER)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_OBJOBJPROC => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject, arg1: ?*hpy.cpy_PyObject) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_OBJOBJPROC{
                        .arg0 = arg0,
                        .arg1 = arg1,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_OBJOBJPROC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_TRAVERSEPROC => {
            S = struct {
                pub fn trampoline(self: ?*hpy.cpy_PyObject, visit: hpy.cpy_visitproc, arg: ?*anyopaque) callconv(.C) c_int {
                    var a = hpy._HPyFunc_args_TRAVERSEPROC{
                        .self = self,
                        .visit = visit,
                        .arg = arg,
                        .result = 0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_TRAVERSEPROC)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
            };
        },
        hpy.HPyFunc_DESTRUCTOR => {
            S = struct {
                pub fn trampoline(arg0: ?*hpy.cpy_PyObject) callconv(.C) void {
                    var a = hpy._HPyFunc_args_DESTRUCTOR{
                        .arg0 = arg0,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_DESTRUCTOR)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return;
                }
            };
        },
        hpy.HPyFunc_CAPSULE_DESTRUCTOR => {
            S = struct {
                pub fn trampoline(capsule: ?*hpy.cpy_PyObject) callconv(.C) void {
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_CAPSULE_DESTRUCTOR)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(capsule)));
                }
            };
        },
        //hpy.HPyFunc_VECTORCALLFUNC, // Not used, not supported
        hpy.HPyFunc_MOD_CREATE => {
            S = struct {
                pub fn trampoline(spec: ?*hpy.cpy_PyObject, def: ?*hpy.cpy_PyModuleDef) callconv(.C) ?*hpy.cpy_PyObject {
                    _ = @TypeOf(def);
                    var a = hpy._HPyFunc_args_UNARYFUNC{
                        .arg0 = spec,
                        .result = null,
                    };
                    hpy._HPy_CallRealFunctionFromTrampoline(mod_ctx.*, @as(c_uint, @bitCast(hpy.HPyFunc_MOD_CREATE)), @as(hpy.HPyCFunction, @ptrCast(@alignCast(&impl))), @as(?*anyopaque, @ptrCast(&a)));
                    return a.result;
                }
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
    return S;
}

/// A convenience function for creating a helper function for the supplied type.
/// Replaces the "HPyType_HELPERS" macro.
pub fn Type_HELPERS(comptime custom_type: type, comptime shape: hpy.HPyType_BuiltinShape) fn (ctx: ?*hpy.HPyContext, h: hpy.HPy) callconv(.C) ?*custom_type {
    _ = shape;

    // TODO: Add check that custom_type is an extern struct.

    const S = struct {
        pub fn objectHelper(ctx: ?*hpy.HPyContext, h: hpy.HPy) callconv(.C) ?*custom_type {
            return @as([*c]custom_type, @ptrCast(@alignCast(hpy._HPy_AsStruct_Object(ctx, h))));
        }
    };
    return S.objectHelper;
}

/// Initializes the global context variable used by function trampolines.
/// Partially replaces the "HPy_MODINIT" macro.
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

/// A convenience type for creating a module definition in zig, rather than interop with the
/// C definition, HPyModuleDef.
pub const ModuleDef = extern struct {
    doc: [*]const u8 = "",
    size: hpy.HPy_ssize_t = 0,
    legacy_methods: ?*hpy.cpy_PyMethodDef = null,
    defines: [*:null]?*hpy.HPyDef,
    globals: ?[*:null]?*hpy.HPyGlobal = null,
};

/// Exports functions required by the HPy ABI. Partially replaces the "HPy_MODINIT" macro.
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

/// The HPy major version that this code was compiled with. Required by the HPy ABI.
fn get_required_hpy_major_version_module() callconv(.C) u32 {
    return hpy.HPY_ABI_VERSION;
}

/// The HPy minor version that this code was compiled with. Required by the HPy ABI.
fn get_required_hpy_minor_version_module() callconv(.C) u32 {
    return hpy.HPY_ABI_VERSION_MINOR;
}

const std = @import("std");
const expect = std.testing.expect;
const mem = std.mem;

const hpy = @import("hpy.zig");
const HPyMeth = hpy.HPyMeth;
const HPyFunc = hpy.HPyFunc;
const HPyCFunction = hpy.HPyCFunction;
const HPy = hpy.HPy;
const HPyContext = hpy.HPyContext;
const HPyUnicode_FromString = hpy.HPyUnicode_FromString;
const cpy_PyObject = hpy.cpy_PyObject;
const _HPyFunc_args_NOARGS = hpy._HPyFunc_args_NOARGS;
const _HPy_CallRealFunctionFromTrampoline = hpy._HPy_CallRealFunctionFromTrampoline;

var _ctx_for_trampolines = undefined;

test "test HPyMeth assignment" {
    const testHPyMeth = HPyMeth{
        .name = "TestName",
        .impl = &say_hello_impl,
        .cpy_trampoline = &say_hello_trampoline,
        .signature = HPyFunc.NOARGS,
        .doc = null,
    };
    expect(mem.eql(u8, testHPyMeth.name, "TestName"));
}

fn say_hello_impl(arg_ctx: HPyContext, arg_self: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var self = arg_self;
    _ = @TypeOf(self);
    return HPyUnicode_FromString(ctx, "Hello world!");
}

fn say_hello_trampoline(arg_self: ?*cpy_PyObject) callconv(.C) ?*cpy_PyObject {
    var self = arg_self;
    var a: _HPyFunc_args_NOARGS = _HPyFunc_args_NOARGS{
        .self = self,
        .result = null,
    };
    _HPy_CallRealFunctionFromTrampoline(_ctx_for_trampolines, HPyFunc.NOARGS, @ptrCast(HPyCFunction, @alignCast(@import("std").meta.alignment(HPyCFunction), &say_hello_impl)), @ptrCast(?*anyopaque, &a));
    return a.result;
}

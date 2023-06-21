const hpy = @cImport({
    @cDefine("HPY", {});
    @cDefine("HPY_ABI_UNIVERSAL", {});
    @cInclude("hpy.h");
});

pub const HPY_ABI_VERSION = hpy.HPY_ABI_VERSION;
pub const HPY_ABI_VERSION_MINOR = hpy.HPY_ABI_VERSION_MINOR;

pub const HPy_ssize_t = isize;
pub const HPyCFunction = ?*const fn (...) callconv(.C) ?*anyopaque;
pub const cpy_PyCFunction = ?*const fn (?*cpy_PyObject, [*c]const ?*cpy_PyObject, HPy_ssize_t) callconv(.C) ?*cpy_PyObject;
pub const HPyFunc_Signature = c_uint;
pub const struct_FORBIDDEN_cpy_PyObject = opaque {};
pub const cpy_PyObject = struct_FORBIDDEN_cpy_PyObject;

const HPyFunc = enum(c_uint) {
    VARARGS = 1, // METH_FASTCALL
    KEYWORDS = 2, // METH_FASTCALL | METH_KEYWORDS
    NOARGS = 3, // METH_NOARGS
    O = 4, // METH_O

    DESTROYFUNC,

    GETBUFFERPROC,
    RELEASEBUFFERPROC,
    UNARYFUNC,
    BINARYFUNC,
    TERNARYFUNC,
    INQUIRY,
    LENFUNC,
    SSIZEARGFUNC,
    SSIZESSIZEARGFUNC,
    SSIZEOBJARGPROC,
    SSIZESSIZEOBJARGPROC,
    OBJOBJARGPROC,
    FREEFUNC,
    GETATTRFUNC,
    GETATTROFUNC,
    SETATTRFUNC,
    SETATTROFUNC,
    REPRFUNC,
    HASHFUNC,
    RICHCMPFUNC,
    GETITERFUNC,
    ITERNEXTFUNC,
    DESCRGETFUNC,
    DESCRSETFUNC,
    INITPROC,
    NEWFUNC,
    GETTER,
    SETTER,
    OBJOBJPROC,
    TRAVERSEPROC,
    DESTRUCTOR,
    CAPSULE_DESTRUCTOR,
    VECTORCALLFUNC,

    MOD_CREATE,
};

pub const HPyMeth = extern struct {
    // The name of Python attribute (UTF-8 encoded)
    name: [*]const u8,

    // Function pointer of the C function implementation
    impl: HPyCFunction,

    // Function pointer to the CPython trampoline function which is used by
    // CPython to call the actual HPy function ``impl``.
    cpy_trampoline: cpy_PyCFunction,

    // Indicates the C function's expected signature
    signature: HPyFunc_Signature,

    // Docstring of the method (UTF-8 encoded; may be ``NULL``)
    doc: ?[*]const u8 = null,
};

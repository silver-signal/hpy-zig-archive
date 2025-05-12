const hpy = @import("../hpy_cimport.zig");

pub const HPyStructSequence_UnnamedField: []const u8 = "_";

pub fn HPyStructSequence_NewType(ctx: [*c]hpy.HPyContext, desc: [*c]hpy.HPyStructSequence_Desc) hpy.HPy {
    _ = ctx;
    _ = desc;
}

pub fn HPyStructSequence_New(ctx: [*c]hpy.HPyContext, @"type": hpy.HPy, nargs: hpy.HPy_ssize_t, args: [*c]hpy.HPy) hpy.HPy {
    _ = ctx;
    _ = @"type";
    _ = nargs;
    _ = args;
}

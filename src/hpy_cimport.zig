const abi_setting = @import("config.zig");

pub usingnamespace @cImport({
    @cDefine("HPY", {});
    @cDefine(abi_setting.hpy_abi, {});
    //@cDefine("HPY_ABI_UNIVERSAL", {});
    @cInclude("hpy.h");
});

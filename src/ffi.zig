const hpy = @cImport({
    @cDefine("HPY", {});
    @cDefine("HPY_ABI_UNIVERSAL", {});
    @cInclude("hpy.h");
});

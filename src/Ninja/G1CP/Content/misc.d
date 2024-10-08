/*
 * Miscellaneous functions
 */

/*
 * Compare bytes in memory (TRUE/FALSE) or check if hooked (-1) or hooked by third-party (-2)
 */
func int G1CP_CheckBytes(var int addr, var string hex) {
    if (IsHooked(addr)) {
        return -1;
    };
    var int len; len = STR_SplitCount(hex, " ");
    if (len != (STR_Len(hex)+1)/3) {
        MEM_Error("Malformatted string. Expecting format 'XX XX XX'");
        return FALSE;
    };
    var int c; var int b; var string s;
    var zString zstr; zstr = _^(_@s(s));
    repeat(i, len); var int i;
        s = STR_Split(hex, " ", i);
        c =  MEMINT_HexCharToInt(MEM_ReadByte(zstr.ptr+0))<<4;
        c += MEMINT_HexCharToInt(MEM_ReadByte(zstr.ptr+1));
        b = MEM_ReadByte(addr+i);
        if (b != c) {
            if (!i) {
                // Special case: Detect third-party hook at start of instruction
                if (len >= 5) && ((b == ASMINT_OP_jmp) || (b == ASMINT_OP_call)) {
                    return -2;
                };
            };
            return FALSE;
        };
    end;
    return TRUE;
};


/*
 * Left fill a string with a token string to fill total length
 */
func string G1CP_LFill(var string str, var string fill, var int total) {
    repeat(i, total-STR_Len(str)); var int i;
        str = ConcatStrings(fill, str);
    end;
    return str;
};


/*
 * Build formatted version string
 */
func string G1CP_GetVersionString(var int prefix, var int leadingZeros, var int forceMinor) {
    var int minor; minor =  G1CP_Version % 100;
    var int major; major = (G1CP_Version % 10000)   /   100;
    var int  base;  base = (G1CP_Version % 1000000) / 10000;
    var string version; version = "";

    // Add the name in front
    if (prefix) {
        version = "G1CP ";
    };

    // Base (no leading zeros)
    version = ConcatStrings(version, IntToString(base));
    version = ConcatStrings(version, ".");

    // Major
    if (leadingZeros) {
        version = ConcatStrings(version, G1CP_LFill(IntToString(major), "0", 2));
    } else {
        version = ConcatStrings(version, IntToString(major));
    };

    // Minor (only if non-zero or if forced)
    if (minor) || (forceMinor) {
        version = ConcatStrings(version, ".");
        if (leadingZeros) {
            version = ConcatStrings(version, G1CP_LFill(IntToString(minor), "0", 2));
        } else {
            version = ConcatStrings(version, IntToString(minor));
        };
    };

    return version;
};

/*
 * Miscellaneous functions
 */

/*
 * Left fill a string with a token string to fill total length
 */
func string Ninja_G1CP_LFill(var string str, var string fill, var int total) {
    repeat(i, total-STR_Len(str)); var int i;
        str = ConcatStrings(fill, str);
    end;
    return str;
};


/*
 * Copy of C_BodyStateContains to ensure it exists as expected
 */
func int Ninja_G1CP_BodyStateContains(var int npcInstance, var int bodystate) {
    const int mod = 31 | 32768 | 65536; // BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS
    var C_Npc slf; slf = Hlp_GetNpc(npcInstance);
    return ((Npc_GetBodyState(slf) & mod) == (bodystate & mod));
};


/*
 * Build formatted version string
 */
func string Ninja_G1CP_GetVersionString(var int prefix, var int leadingZeros, var int forceMinor) {
    var int minor; minor =  Ninja_G1CP_Version % 100;
    var int major; major = (Ninja_G1CP_Version % 10000)   /   100;
    var int  base;  base = (Ninja_G1CP_Version % 1000000) / 10000;
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
        version = ConcatStrings(version, Ninja_G1CP_LFill(IntToString(major), "0", 2));
    } else {
        version = ConcatStrings(version, IntToString(major));
    };

    // Minor (only if non-zero or if forced)
    if (minor) || (forceMinor) {
        version = ConcatStrings(version, ".");
        if (leadingZeros) {
            version = ConcatStrings(version, Ninja_G1CP_LFill(IntToString(minor), "0", 2));
        } else {
            version = ConcatStrings(version, IntToString(minor));
        };
    };

    return version;
};

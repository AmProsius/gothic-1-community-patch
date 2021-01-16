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

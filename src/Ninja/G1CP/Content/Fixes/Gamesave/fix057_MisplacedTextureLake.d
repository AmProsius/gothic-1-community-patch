/*
 * #57 Misplaced texture near Gravo
 */
func int G1CP_057_MisplacedTextureLake() {
    var int vobPtr; vobPtr = G1CP_FindVobByPosF(-5893.91455, -664.270386, 78.9339142);
    // if (G1CP_Hlp_Is_zCDecal) {}
    if (vobPtr) {
        const int zCDecal_vtbl = 8207876; //0x7D3E04
        if (MEM_ReadInt(vobPtr) == zCDecal_vtbl) {
            G1CP_MoveVobToPosF(vobPtr, -5902.01807, -664.270386, 82.8507462);
            return TRUE;
        };
        return FALSE;
    };
    return FALSE;
};

/*
 * This function reverts the changes
 */
func int G1CP_057_MisplacedTextureLakeRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(57)) {
        return FALSE;
    };

    // Find the VOB again
    var int vobPtr; vobPtr = G1CP_FindVobByPosF(-5902.01807, -664.270386, 82.8507462);
    // if (G1CP_Hlp_Is_zCDecal) {}
    if (vobPtr) {
        const int zCDecal_vtbl = 8207876; //0x7D3E04
        if (MEM_ReadInt(vobPtr) == zCDecal_vtbl) {
            G1CP_MoveVobToPosF(vobPtr, -5893.91455, -664.270386, 78.9339142);
            return TRUE;
        };
        return FALSE;
    };
    return FALSE;
};

/*
 * #57 Misplaced texture near Gravo
 */
func int G1CP_057_CastleWallTexture() {
    var int vobPtr; vobPtr = G1CP_FindVobByPosF(-5893.91455, -664.270386, 78.9339142, G1CP_057_CastleWallTextureCheck);
    if (vobPtr) {
        G1CP_MoveVobToPosF(vobPtr, -5902.01807, -664.270386, 82.8507462);
        return TRUE;
    };
    return FALSE;
};

/*
 * Callback function to check the found VOBs: Check if the VOB's visual is a decal
 */
func int G1CP_057_CastleWallTextureCheck(var int vobPtr) {
    var zCVob vob; vob = _^(vobPtr);
    const int zCDecal_classDef = 8861528; //0x873758
    return (MEM_GetClassDef(vob.visual) == zCDecal_classDef);
};

/*
 * This function reverts the changes
 */
func int G1CP_057_CastleWallTextureRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(57)) {
        return FALSE;
    };

    // Find the VOB again
    var int vobPtr; vobPtr = G1CP_FindVobByPosF(-5902.01807, -664.270386, 82.8507462, G1CP_057_CastleWallTextureCheck);
    if (vobPtr) {
        G1CP_MoveVobToPosF(vobPtr, -5893.91455, -664.270386, 78.9339142);
        return TRUE;
    };
    return FALSE;
};

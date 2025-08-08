/*
 * #57 Misplaced texture near Gravo
 */

/*
 * Make the positions available to the functions below
 */
const float G1CP_0057_CastleWallTexture_PosOld[3] = {-5893.91455, -664.270386, 78.9339142};
const float G1CP_0057_CastleWallTexture_PosNew[3] = {-5902.01807, -664.270386, 82.8507462};

/*
 * Callback function to check the found VOBs: Check if the VOB's visual is a decal
 */
func int G1CP_0057_CastleWallTextureCheck(var int vobPtr) {
    var zCVob vob; vob = _^(vobPtr);
    const int zCDecal_classDef = 8861528; //0x873758

    return (MEM_GetClassDef(vob.visual) == zCDecal_classDef);
};

/*
 * Apply the fix
 */
func int G1CP_0057_CastleWallTexture() {
    return G1CP_Tpl_ChangeVobLocation(
        _@(G1CP_0057_CastleWallTexture_PosOld),
        _@(G1CP_0057_CastleWallTexture_PosNew),
        G1CP_0057_CastleWallTextureCheck
    );
};

/*
 * This function reverts the changes
 */
func int G1CP_0057_CastleWallTextureRevert() {
    if (!G1CP_IsFixApplied(57)) {
        return FALSE;
    };

    return G1CP_Tpl_ChangeVobLocation(
        _@(G1CP_0057_CastleWallTexture_PosNew),
        _@(G1CP_0057_CastleWallTexture_PosOld),
        G1CP_0057_CastleWallTextureCheck
    );
};

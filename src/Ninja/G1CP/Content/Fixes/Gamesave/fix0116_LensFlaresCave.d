/*
 * #116 Lens flares in the swampweed cave
 */
const float G1CP_0116_LensFlaresCave_Pos[3] = {-43824.2109, 240.022049, -3729.67432};

/*
 * Apply the fix
 */
func int G1CP_0116_LensFlaresCave() {
    var int vobPtr; vobPtr = G1CP_FindLightVobByPosPtr(_@f(G1CP_0116_LensFlaresCave_Pos), NOFUNC);
    if (vobPtr) {
        var zCVobLight vob; vob  = _^(vobPtr);
        if (vob.lensflareFX) { // Ensure it has a lens flare object before checking its name
            var zCObject fx; fx = _^(vob.lensflareFX);
            if (Hlp_StrCmp(fx.objectname, "ZSUN_FLARE")) {
                return G1CP_VobLightSetLensflare(vobPtr, "");
            };
        };
    };
    return FALSE;
};

/*
 * Revert the changes
 */
func int G1CP_0116_LensFlaresCaveRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(116)) {
        return FALSE;
    };

    var int vobPtr; vobPtr = G1CP_FindLightVobByPosPtr(_@f(G1CP_0116_LensFlaresCave_Pos), NOFUNC);
    if (vobPtr) {
        var zCVobLight vob; vob  = _^(vobPtr);
        if (!vob.lensflareFX) { // No lens flare effect present
            return G1CP_VobLightSetLensflare(vobPtr, "ZSUN_FLARE");
        };
    };
    return FALSE;
};

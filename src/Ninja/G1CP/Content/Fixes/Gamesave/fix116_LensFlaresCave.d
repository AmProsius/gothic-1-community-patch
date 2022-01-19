/*
 * #116 Lens flares in the swampweed cave
 */
func int G1CP_116_LensFlaresCave() {
    var int vobPtr; vobPtr = G1CP_FindLightVobByPosF(-43824.2109, 240.022049, -3729.67432, NOFUNC);
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
 * This function reverts the changes
 */
func int G1CP_116_LensFlaresCaveRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(116)) {
        return FALSE;
    };

    // Find the VOB again
    var int vobPtr; vobPtr = G1CP_FindLightVobByPosF(-43824.2109, 240.022049, -3729.67432, NOFUNC);
    if (vobPtr) {
        var zCVobLight vob; vob  = _^(vobPtr);
        if (!vob.lensflareFX) { // No lens flare effect present
            return G1CP_VobLightSetLensflare(vobPtr, "ZSUN_FLARE");
        };
    };
    return FALSE;
};

/*
 * #116 Lens flares in the swampweed cave
 */
func int G1CP_116_LensFlaresCave() {
    var int vobPtr; vobPtr = G1CP_FindVobByPosF(-43824.2109, 240.022049, -3729.67432);
    if (Hlp_Is_zCVobLight(vobPtr)) { // Make sure we found a (the) light
        var zCVobLight vob; vob  = _^(vobPtr);
/*        if (Hlp_StrCmp(vob.lensflareFX, "ZSUN_FLARE")) {
            vob.lensflareFX = "";
            return TRUE;
        };*/
        return FALSE;
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
    var int vobPtr; vobPtr = G1CP_FindVobByPosF(-43824.2109, 240.022049, -3729.67432);
    if (Hlp_Is_zCVobLight(vobPtr)) {
        var zCVobLight vob; vob  = _^(vobPtr);
/*        if (Hlp_StrCmp(vob.lensflareFX, "")) {
            vob.lensflareFX = "ZSUN_FLARE";
            return TRUE;
        };*/
        return FALSE;
    };
    return FALSE;
};

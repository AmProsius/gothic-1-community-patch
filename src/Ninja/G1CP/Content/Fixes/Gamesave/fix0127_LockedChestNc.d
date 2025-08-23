/*
 * #127 One chest in NC cannot be opened
 */
func int G1CP_0127_LockedChestNc() {
    var int vobPtr; vobPtr = G1CP_FindVobByPosF(-55158.1367, 2919.41309, 1144.36926, Hlp_Is_oCMobContainer);
    if (vobPtr) {
        var oCMobContainer mob; mob = _^(vobPtr);
        if (Hlp_StrCmp(mob._oCMobLockable_keyInstance, "LRL"))
        && (Hlp_StrCmp(mob._oCMobLockable_pickLockStr, "")) {
            mob._oCMobLockable_keyInstance = "";
            mob._oCMobLockable_pickLockStr = "LRL";
            return TRUE;
        };
        return FALSE;
    };
    return FALSE;
};

/*
 * This function reverts the changes
 */
func int G1CP_0127_LockedChestNcRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(127)) {
        return FALSE;
    };

    // Find the VOB again
    var int vobPtr; vobPtr = G1CP_FindVobByPosF(-55158.1367, 2919.41309, 1144.36926, Hlp_Is_oCMobContainer);
    if (vobPtr) {
        var oCMobContainer mob; mob = _^(vobPtr);
        if (Hlp_StrCmp(mob._oCMobLockable_keyInstance, ""))
        && (Hlp_StrCmp(mob._oCMobLockable_pickLockStr, "LRL")) {
            mob._oCMobLockable_keyInstance = "LRL";
            mob._oCMobLockable_pickLockStr = "";
            return TRUE;
        };
        return FALSE;
    };
    return FALSE;
};

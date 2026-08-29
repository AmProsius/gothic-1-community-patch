/*
 * #127 One chest in NC cannot be opened
 */
const float G1CP_0127_LockedChestNc_Pos[3] = {-55158.1367, 2919.41309, 1144.36926};

/*
 * Apply the fix
 */
func int G1CP_0127_LockedChestNc() {
    var int vobPtr; vobPtr = G1CP_FindVobByPosPtr(_@f(G1CP_0127_LockedChestNc_Pos), Hlp_Is_oCMobContainer);
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
 * Revert the changes
 */
func int G1CP_0127_LockedChestNcRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(127)) {
        return FALSE;
    };

    var int vobPtr; vobPtr = G1CP_FindVobByPosPtr(_@f(G1CP_0127_LockedChestNc_Pos), Hlp_Is_oCMobContainer);
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

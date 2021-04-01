/*
 * #51 Chest in stonehenge crypt behind wall
 */
func int G1CP_051_StonehengeCryptChest() {
    var int vobPtr; vobPtr = G1CP_FindVobByPosF(-35498.5625, 2331.01416, -13830.9131);
    if (Hlp_Is_oCMobContainer(vobPtr)) { // Make sure we found a (the) chest
        G1CP_MoveVobToPosF(vobPtr, -35311.8100, 2281.0100, -14096.8200);
        return TRUE;
    };
    return FALSE;
};

/*
 * This function reverts the changes
 */
func int G1CP_051_StonehengeCryptChestRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(51)) {
        return FALSE;
    };

    // Search the VOB again
    var int vobPtr; vobPtr = G1CP_FindVobByPosF(-35311.8100, 2281.0100, -14096.8200);
    if (Hlp_Is_oCMobContainer(vobPtr)) { // Make sure we found a (the) chest
        G1CP_MoveVobToPosF(vobPtr, -35498.5625, 2331.01416, -13830.9131);
        return TRUE;
    };
    return FALSE;
};

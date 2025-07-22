/*
 * #{ISSUE_NUM} {LONGNAME}
 *
 * Retrieve the symbol index of the NPC
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_GetInst() {
    const string npcName = "### TODO: NPC name ###";
    const int npcId = -2; // -1 is reserved for invalid symbols

    if (npcId == -2) {
        npcId = G1CP_GetNpcInstId(npcName);
    };

    return npcId;
};

/*
 * This function applies the changes
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}() {
    var oCNpc npc; npc = Hlp_GetNpc(G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_GetInst());

    if (!Hlp_IsValidNpc(npc)) {
        return FALSE;
    };

    // ### TODO: Add additional early return for desired property ###

    // ### TODO: Change desired property ###

    return TRUE;
 };

/*
 * This function reverts the changes. Not necessary here, but for completeness and proper applied-status.
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}Revert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied({ISSUE_NUM})) {
        return FALSE;
    };

    var oCNpc npc; npc = Hlp_GetNpc(G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_GetInst());

    if (!Hlp_IsValidNpc(npc)) {
        return FALSE;
    };

    // ### TODO: Add additional early return for changed property ###

    // ### TODO: Revert changed property ###

    return TRUE;
};

/*
 * #224 Undead orc priest can die from fall damage
 *
 * Retrieve the symbol index of the NPC
 */
func int G1CP_0224_OrcPriestFallDamage_GetInst() {
    const int npcId = -2; // -1 is reserved for invalid symbols

    if (npcId == -2) {
        npcId = G1CP_GetNpcInstId("ORC_Priest_5");
    };

    return npcId;
};

/*
 * This function applies the changes
 */
func int G1CP_0224_OrcPriestFallDamage() {
    var oCNpc npc; npc = Hlp_GetNpc(G1CP_0224_OrcPriestFallDamage_GetInst());

    if (!Hlp_IsValidNpc(npc)) {
        return FALSE;
    };

    if (npc.fallDownDamage != 10) {
        return FALSE;
    };

    npc.fallDownDamage = 0;
    return TRUE;
};

/*
 * This function reverts the changes. Not necessary here, but for completeness and proper applied-status.
 */
func int G1CP_0224_OrcPriestFallDamageRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(224)) {
        return FALSE;
    };

    var oCNpc npc; npc = Hlp_GetNpc(G1CP_0224_OrcPriestFallDamage_GetInst());

    if (!Hlp_IsValidNpc(npc)) {
        return FALSE;
    };

    if (npc.fallDownDamage != 0) {
        return FALSE;
    };

    npc.fallDownDamage = 10;
    return TRUE;
};

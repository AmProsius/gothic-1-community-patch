/*
 * #185 Scorpio offers to teach crossbow multiple times
 */
func int G1CP_185_ScorpioCrossbow() {
    if (MEM_GetSymbolIndex("GRD_205_Scorpio_CROSSBOW_Condition") != -1)
    && (MEM_GetSymbolIndex("NPC_TALENT_CROSSBOW") != -1) {
        HookDaedalusFuncS("GRD_205_Scorpio_CROSSBOW_Condition", "G1CP_185_ScorpioCrossbow_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_185_ScorpioCrossbow_Hook() {
    G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    var int symbPtr; symbPtr = MEM_GetSymbol("NPC_TALENT_CROSSBOW");
    if (symbPtr) {
        var int NPC_TALENT_CROSSBOW; NPC_TALENT_CROSSBOW = MEM_ReadInt(symbPtr + zCParSymbol_content_offset);
        if (Npc_GetTalentSkill(hero, NPC_TALENT_CROSSBOW) > 0) {
            return FALSE;
        };
    };

    // Continue with the original function
    ContinueCall();
};

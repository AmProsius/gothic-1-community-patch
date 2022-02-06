/*
 * #185 Scorpio offers to teach crossbow multiple times
 */
func int G1CP_185_ScorpioCrossbow() {
    if (G1CP_IsFunc("GRD_205_Scorpio_CROSSBOW_Condition", "int|none"))
    && (G1CP_IsIntConst("NPC_TALENT_CROSSBOW", 0)) {
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
    if (Npc_GetTalentSkill(hero, G1CP_GetIntConst("NPC_TALENT_CROSSBOW", 0, 0)) > 0) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};

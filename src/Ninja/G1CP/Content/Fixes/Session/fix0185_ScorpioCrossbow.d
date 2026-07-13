/*
 * #185 Scorpio offers to teach crossbow multiple times
 */
func int G1CP_0185_ScorpioCrossbow() {
    const string conditionFuncName = "GRD_205_Scorpio_CROSSBOW_Condition";
    if (!G1CP_IsFunc(conditionFuncName, "int|none"))
    || (!G1CP_IsIntConst("NPC_TALENT_CROSSBOW")) {
        return FALSE;
    };

    HookDaedalusFuncS(conditionFuncName, "G1CP_0185_ScorpioCrossbow_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0185_ScorpioCrossbow_Hook() {
    G1CP_ReportFuncToSpy();

    const int NPC_TALENT_CROSSBOW = 0; NPC_TALENT_CROSSBOW = G1CP_GetIntConst("NPC_TALENT_CROSSBOW", 4);

    // Add the new conditions (other conditions remain untouched)
    if (Npc_GetTalentSkill(hero, NPC_TALENT_CROSSBOW) > 0) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};

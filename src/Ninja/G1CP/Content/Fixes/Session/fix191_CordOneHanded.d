/*
 * #191 Cord teaches One-handed Sword Level 2 too soon
 */
func int G1CP_191_CordOneHanded() {
    if (G1CP_IsFunc("SLD_709_Cord_TRAINAGAIN_Condition", "int|none"))
    && (G1CP_IsIntConst("NPC_TALENT_1H", 0)) {
        HookDaedalusFuncS("SLD_709_Cord_TRAINAGAIN_Condition", "G1CP_191_CordOneHanded_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_191_CordOneHanded_Hook() {
    G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    const int NPC_TALENT_1H = 0; NPC_TALENT_1H = G1CP_GetIntConst("NPC_TALENT_1H", 0, 0);
    if (Npc_GetTalentSkill(hero, NPC_TALENT_1H) != 1) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};

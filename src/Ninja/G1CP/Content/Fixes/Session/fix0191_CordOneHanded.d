/*
 * #191 Cord teaches One-handed Sword Level 2 too soon
 */
func int G1CP_0191_CordOneHanded() {
    const string conditionFuncName = "SLD_709_Cord_TRAINAGAIN_Condition";
    if (!G1CP_IsFunc(conditionFuncName, "int|none"))
    || (!G1CP_IsIntConst("NPC_TALENT_1H")) {
        return FALSE;
    };

    HookDaedalusFuncS(conditionFuncName, "G1CP_0191_CordOneHanded_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0191_CordOneHanded_Hook() {
    G1CP_ReportFuncToSpy();

    const int NPC_TALENT_1H = 0; NPC_TALENT_1H = G1CP_GetIntConst("NPC_TALENT_1H", 1);
    if (Npc_GetTalentSkill(hero, NPC_TALENT_1H) != 1) {
        return FALSE;
    };

    ContinueCall();
};

/*
 * #29 Buster trains Acrobatics multiple times
 */
func int G1CP_0029_BusterAcrobatics() {
    const string conditionFuncName = "DIA_ORG_833_Buster3_Condition";
    if (!G1CP_IsFunc(conditionFuncName, "int|none"))
    || (!G1CP_IsIntConst("NPC_TALENT_ACROBAT")) {
        return FALSE;
    };

    HookDaedalusFuncS(conditionFuncName, "G1CP_0029_BusterAcrobatics_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0029_BusterAcrobatics_Hook() {
    G1CP_ReportFuncToSpy();

    const int NPC_TALENT_ACROBAT = 0; NPC_TALENT_ACROBAT = G1CP_GetIntConst("NPC_TALENT_ACROBAT", 11);
    if (Npc_GetTalentSkill(hero, NPC_TALENT_ACROBAT) != 0) {
        return FALSE;
    };

    ContinueCall();
};

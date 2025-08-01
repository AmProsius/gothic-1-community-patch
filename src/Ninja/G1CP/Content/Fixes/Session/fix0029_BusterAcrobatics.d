/*
 * #29 Buster trains Acrobatics multiple times
 */
func int G1CP_0029_BusterAcrobatics() {
    if (G1CP_IsFunc("DIA_ORG_833_Buster3_Condition", "int|none"))
    && (G1CP_IsIntConst("NPC_TALENT_ACROBAT", 0)) {
        HookDaedalusFuncS("DIA_ORG_833_Buster3_Condition", "G1CP_0029_BusterAcrobatics_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0029_BusterAcrobatics_Hook() {
    G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    const int NPC_TALENT_ACROBAT = 0; NPC_TALENT_ACROBAT = G1CP_GetIntConst("NPC_TALENT_ACROBAT", 0, 0);
    if (Npc_GetTalentSkill(hero, NPC_TALENT_ACROBAT) != 0) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};

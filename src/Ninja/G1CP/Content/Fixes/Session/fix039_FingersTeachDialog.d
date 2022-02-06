/*
 * #39 Fingers teaches advanced skills too soon
 */
func int G1CP_039_FingersTeachDialog() {
    // Check if all necessary symbols exist
    var int funcId; funcId = G1CP_GetFuncId("DIA_Fingers_Lehrer_Info", "void|none");
    if (funcId == -1)
    || (!G1CP_IsFunc("DIA_Fingers_Lehrer_Pickpocket2", "void|none"))
    || (!G1CP_IsFunc("DIA_Fingers_Lehrer_Pickpocket", "void|none"))
    || (!G1CP_IsFunc("DIA_Fingers_Lehrer_Lockpick2", "void|none"))
    || (!G1CP_IsFunc("DIA_Fingers_Lehrer_Lockpick", "void|none"))
    || (!G1CP_IsIntConst("NPC_TALENT_PICKPOCKET", 0))
    || (!G1CP_IsIntConst("NPC_TALENT_PICKLOCK", 0)) {
        return FALSE;
    };

    // Get the symbol indices of the functions
    var int addChoiceId; addChoiceId = MEM_GetFuncId(Info_AddChoice);
    var int interceptId; interceptId = MEM_GetFuncId(G1CP_039_AllowAddChoice);

    // Replace all function calls to "Info_AddChoice"
    return (G1CP_ReplaceCall(funcId, 0, addChoiceId, interceptId) > 0);
};

/*
 * Intercept any calls to "Info_AddChoice" in "DIA_Fingers_Lehrer_Info"
 */
func void G1CP_039_AllowAddChoice(var int dia, var string choice, var int fncId) {
    G1CP_ReportFuncToSpy();

    // Get the necessary symbols (existence verified by function above)
    const int diaId = -1;
    const int pp2Id = -1;
    const int pp1Id = -1;
    const int lp2Id = -1;
    const int lp1Id = -1;
    const int NPC_TALENT_PICKPOCKET = -1;
    const int NPC_TALENT_PICKLOCK   = -1;
    if (diaId == -1) {
        diaId = MEM_GetSymbolIndex("DIA_Fingers_Lehrer");
        pp2Id = MEM_GetSymbolIndex("DIA_Fingers_Lehrer_Pickpocket2");
        pp1Id = MEM_GetSymbolIndex("DIA_Fingers_Lehrer_Pickpocket");
        lp2Id = MEM_GetSymbolIndex("DIA_Fingers_Lehrer_Lockpick2");
        lp1Id = MEM_GetSymbolIndex("DIA_Fingers_Lehrer_Lockpick");
        NPC_TALENT_PICKPOCKET = G1CP_GetIntConst("NPC_TALENT_PICKPOCKET", 0, 0);
        NPC_TALENT_PICKLOCK = G1CP_GetIntConst("NPC_TALENT_PICKLOCK", 0, 0);
    };

    // Sanity check
    if (dia == diaId) {
        // Add choices only when matching skill
        if (fncId == pp2Id) && (Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) != 1) {
            return;
        } else if (fncId == pp1Id) && (Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) != 0) {
            return;
        } else if (fncId == lp2Id) && (Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) != 1) {
            return;
        } else if (fncId == lp1Id) && (Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) != 0) {
            return;
        };
    };

    // Otherwise proceed
    // Info_AddChoice(dia, choice, fncId);
    MEM_PushIntParam(dia);
    MEM_PushStringParam(choice);
    MEM_PushIntParam(fncId); // Cannot re-push function correctly
    MEM_Call(Info_AddChoice);
};

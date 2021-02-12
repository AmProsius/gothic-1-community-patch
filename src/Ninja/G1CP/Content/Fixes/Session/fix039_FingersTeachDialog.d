/*
 * #39 Fingers teaches advanced skills too soon
 */
func int Ninja_G1CP_039_FingersTeachDialog() {
    // Check if all necessary symbols exist
    var int funcId;  funcId  = MEM_FindParserSymbol("DIA_Fingers_Lehrer_Info");
    var int cond1Id; cond1Id = MEM_FindParserSymbol("DIA_Fingers_Lehrer_Pickpocket2");
    var int cond2Id; cond2Id = MEM_FindParserSymbol("DIA_Fingers_Lehrer_Pickpocket");
    var int cond3Id; cond3Id = MEM_FindParserSymbol("DIA_Fingers_Lehrer_Lockpick2");
    var int cond4Id; cond4Id = MEM_FindParserSymbol("DIA_Fingers_Lehrer_Lockpick");
    var int cond5Id; cond5Id = MEM_FindParserSymbol("NPC_TALENT_PICKPOCKET");
    var int cond6Id; cond6Id = MEM_FindParserSymbol("NPC_TALENT_PICKLOCK");
    if (cond1Id == -1) || (cond2Id == -1) || (cond3Id == -1)
    || (cond4Id == -1) || (cond5Id == -1) || (cond6Id == -1) || (funcId == -1) {
        return FALSE;
    };

    // Get the symbol indices of the functions
    var int addChoiceId; addChoiceId = MEM_GetFuncId(Info_AddChoice);
    var int interceptId; interceptId = MEM_GetFuncId(Ninja_G1CP_039_AllowAddChoice);

    // Replace all function calls to "Info_AddChoice"
    return Ninja_G1CP_ReplaceCallInFunc(funcId, addChoiceId, interceptId) > 0;
};

/*
 * Intercept any calls to "Info_AddChoice" in "DIA_Fingers_Lehrer_Info"
 */
func void Ninja_G1CP_039_AllowAddChoice(var int dia, var string choice, var int fncId) {
    Ninja_G1CP_ReportFuncToSpy();

    // Get the necessary symbols (existence verified by function above)
    const int diaId = -1;
    const int pp2Id = -1;
    const int pp1Id = -1;
    const int lp2Id = -1;
    const int lp1Id = -1;
    const int NPC_TALENT_PICKPOCKET = -1;
    const int NPC_TALENT_PICKLOCK   = -1;
    if (diaId == -1) {
        diaId = MEM_FindParserSymbol("DIA_Fingers_Lehrer");
        pp2Id = MEM_FindParserSymbol("DIA_Fingers_Lehrer_Pickpocket2");
        pp1Id = MEM_FindParserSymbol("DIA_Fingers_Lehrer_Pickpocket");
        lp2Id = MEM_FindParserSymbol("DIA_Fingers_Lehrer_Lockpick2");
        lp1Id = MEM_FindParserSymbol("DIA_Fingers_Lehrer_Lockpick");
        NPC_TALENT_PICKPOCKET = MEM_ReadInt(MEM_GetSymbol("NPC_TALENT_PICKPOCKET") + zCParSymbol_content_offset);
        NPC_TALENT_PICKLOCK = MEM_ReadInt(MEM_GetSymbol("NPC_TALENT_PICKLOCK") + zCParSymbol_content_offset);
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

/*
 * #29 Buster trains Acrobatics multiple times
 *
 * The hero is given the acrobatics talent and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int Ninja_G1CP_Test_029() {
    // Check status of the test
    var int passed; passed = TRUE;

    // Check if the dialog exists
    var int funcId; funcId = MEM_FindParserSymbol("DIA_ORG_833_Buster3_Condition");
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog condition 'DIA_ORG_833_Buster3_Condition' not found");
        passed = FALSE;
    };

    // Check if symbol exists
    var int symbPtr; symbPtr = MEM_GetSymbol("NPC_TALENT_ACROBAT");
    if (!symbPtr) {
        Ninja_G1CP_TestsuiteErrorDetail("Symbol 'NPC_TALENT_ACROBAT' not found");
        passed = FALSE;
    };
    var int NPC_TALENT_ACROBAT; NPC_TALENT_ACROBAT = MEM_ReadInt(symbPtr + zCParSymbol_content_offset);

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Backup values
    var int talentBak; talentBak = Npc_GetTalentSkill(hero, NPC_TALENT_ACROBAT);                // Talent
    var int toldBak; toldBak = Npc_KnowsInfo(hero, MEM_FindParserSymbol("DIA_ORG_833_Buster")); // Told status
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);                                               // Self
    var C_Npc othBak; othBak = MEM_CpyInst(other);                                              // Other

    // Set new values
    Npc_SetTalentSkill(hero, NPC_TALENT_ACROBAT, TRUE);                                         // Talent
    Ninja_G1CP_SetInfoTold("DIA_ORG_833_Buster", TRUE);                                         // Told status
    self  = MEM_CpyInst(hero);                                                                  // Self
    other = MEM_CpyInst(hero);                                                                  // Other

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self  = MEM_CpyInst(slfBak);                                                                // Self
    other = MEM_CpyInst(othBak);                                                                // Other
    Npc_SetTalentSkill(hero, NPC_TALENT_ACROBAT, talentBak);                                    // Talent
    Ninja_G1CP_SetInfoTold("DIA_ORG_833_Buster", toldBak);                                      // Told status

    // Check return value
    if (ret) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};

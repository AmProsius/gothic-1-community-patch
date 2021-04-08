/*
 * #185 Scorpio offers to teach crossbow multiple times
 *
 * The hero's guild is reset and assigned to the Old Camp. The hero is given the crossbow level 1 talent and the 
 * condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_185() {
    // Check status of the test
    var int passed; passed = TRUE;

    // Check if the dialog exists
    var int funcId; funcId = MEM_GetSymbolIndex("GRD_205_Scorpio_CROSSBOW_Condition");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Dialog condition 'GRD_205_Scorpio_CROSSBOW_Condition' not found");
        passed = FALSE;
    };

    // Check if the guild variable exists
    var int guildPtr; guildPtr = MEM_GetSymbol("GIL_GRD");
    if (!guildPtr) {
        G1CP_TestsuiteErrorDetail("Variable 'GIL_GRD' not found");
        passed = FALSE;
    };
    var int GIL_GRD; GIL_GRD = MEM_ReadInt(guildPtr + zCParSymbol_content_offset);

    // Check if the talent symbol exists
    var int talentPtr; talentPtr = MEM_GetSymbol("NPC_TALENT_CROSSBOW");
    if (!talentPtr) {
        G1CP_TestsuiteErrorDetail("Symbol 'NPC_TALENT_CROSSBOW' not found");
        passed = FALSE;
    };
    var int NPC_TALENT_CROSSBOW; NPC_TALENT_CROSSBOW = MEM_ReadInt(talentPtr + zCParSymbol_content_offset);

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Backup values
    var int guildBak; guildBak = hero.guild;                                      // Player guild
    var int talentBak; talentBak = Npc_GetTalentSkill(hero, NPC_TALENT_CROSSBOW); // Talent
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);                                 // Self
    var C_Npc othBak; othBak = MEM_CpyInst(other);                                // Other

    // Set new values
    hero.guild = GIL_GRD;                                                         // Player guild
    Npc_SetTalentSkill(hero, NPC_TALENT_CROSSBOW, 1);                             // Talent
    self  = MEM_CpyInst(hero);                                                    // Self
    other = MEM_CpyInst(hero);                                                    // Other

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self  = MEM_CpyInst(slfBak);                                                  // Self
    other = MEM_CpyInst(othBak);                                                  // Other
    hero.guild = guildBak;                                                        // Player guild
    Npc_SetTalentSkill(hero, NPC_TALENT_CROSSBOW, talentBak);                     // Talent

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};

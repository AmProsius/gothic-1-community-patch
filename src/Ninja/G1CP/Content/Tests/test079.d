/*
 * #79 Wolf teaches guards dexterity instead of bandits/mercs
 *
 * The hero's guild is reset and assigned to the new camp. The condition function of the dialog is called for each.
 *
 * Expected behavior: The condition function will return FALSE for the first and TRUE for the second pass.
 */
func int Ninja_G1CP_Test_079() {
    var int symbPtr;
    var int GIL_GRD;
    var int GIL_ORG;

    // Check status of the test
    var int passed; passed = TRUE;

    // Check if the dialog exists
    var int funcId; funcId = MEM_FindParserSymbol("ORG_855_Wolf_Teach_Condition");
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog condition 'ORG_855_Wolf_Teach_Condition' not found");
        passed = FALSE;
    };

    // Check if guild exists
    symbPtr = MEM_GetSymbol("GIL_GRD");
    if (!symbPtr) {
        Ninja_G1CP_TestsuiteErrorDetail("Symbol 'GIL_GRD' not found");
        passed = FALSE;
    } else {
        GIL_GRD = MEM_ReadInt(symbPtr + zCParSymbol_content_offset);
    };

    // Check if guild exists
    symbPtr = MEM_GetSymbol("GIL_ORG");
    if (!symbPtr) {
        Ninja_G1CP_TestsuiteErrorDetail("Symbol 'GIL_ORG' not found");
        passed = FALSE;
    } else {
        GIL_ORG = MEM_ReadInt(symbPtr + zCParSymbol_content_offset);
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Backup values
    var int guildBak; guildBak = hero.guild;                     // True guild
    var int guildTrueBak; guildTrueBak = Npc_GetTrueGuild(hero); // Guild
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);                // Self
    var C_Npc othBak; othBak = MEM_CpyInst(other);               // Other

    // Set self and other
    self  = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Do two passes (first one should yield true, second false)
    var int ret1;
    var int ret2;

    // First pass
    hero.guild = GIL_GRD;
    Npc_SetTrueGuild(hero, GIL_GRD);

    // Call dialog condition function
    MEM_CallByID(funcId);
    ret1 = MEM_PopIntResult();
    if (ret1) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog condition returned true for GIL_GRD");
    };

    // Second pass
    hero.guild = GIL_ORG;
    Npc_SetTrueGuild(hero, GIL_ORG);

    // Call dialog condition function
    MEM_CallByID(funcId);
    ret2 = MEM_PopIntResult();
    if (!ret2) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog condition returned false for GIL_ORG");
    };

    // Restore values
    self  = MEM_CpyInst(slfBak);           // Self
    other = MEM_CpyInst(othBak);           // Other
    hero.guild = guildBak;                 // Guild
    Npc_SetTrueGuild(hero, guildTrueBak);  // True guild

    // Pass on return value
    return (!ret1) && (ret2);
};

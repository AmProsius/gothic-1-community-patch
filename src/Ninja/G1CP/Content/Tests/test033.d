/*
 * #33 Shrike's Hut quest
 *
 * A variable and dialog are temporarily set and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int Ninja_G1CP_Test_033() {
    // Check status of the test
    var int passed; passed = TRUE;

    // Check if the dialog exists
    var int funcId; funcId = MEM_FindParserSymbol("DIA_Shrike_GetLost_Condition");
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog condition 'DIA_Shrike_GetLost_Condition' not found");
        passed = FALSE;
    };

    // Find Shrike
    var int symbId; symbId = MEM_FindParserSymbol("ORG_842_Shrike");
    if (symbId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("NPC 'ORG_842_Shrike' not found");
        passed = FALSE;
    };

    // Check if Shrike exists in the world
    var C_Npc shrike; shrike = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(shrike)) {
        Ninja_G1CP_TestsuiteErrorDetail("NPC 'ORG_842_Shrike' not valid");
        passed = FALSE;
    };

    // Check if the dialog exist
    if (MEM_FindParserSymbol("DIA_Gorn_Hut") == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog 'DIA_Gorn_Hut' not found");
        passed = FALSE;
    };

    // Check if variable exists
    var int questPtr; questPtr = MEM_GetSymbol("Gorn_ShrikesHut");
    if (!questPtr) {
        Ninja_G1CP_TestsuiteErrorDetail("Variable 'Gorn_ShrikesHut' not found");
        passed = FALSE;
    };
    questPtr += zCParSymbol_content_offset;

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Backup values
    var int questBak; questBak = MEM_ReadInt(questPtr);
    var int told1Bak; told1Bak = Npc_KnowsInfo(hero, MEM_FindParserSymbol("DIA_Gorn_Hut"));
    var int aivarBak; aivarBak = Ninja_G1CP_GetAIVar(shrike, "AIV_WASDEFEATEDBYSC", FALSE);
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set new values
    Ninja_G1CP_SetInfoTold("DIA_Gorn_Hut", FALSE);      // Not told
    MEM_WriteInt(questPtr, 0);                          // Quest not running
    Ninja_G1CP_SetAIVar(shrike, "AIV_WASDEFEATEDBYSC", TRUE);
    self  = MEM_CpyInst(shrike);
    other = MEM_CpyInst(hero);

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);
    Ninja_G1CP_SetAIVar(shrike, "AIV_WASDEFEATEDBYSC", aivarBak);
    MEM_WriteInt(questPtr, questBak);
    Ninja_G1CP_SetInfoTold("DIA_Gorn_Hut", told1Bak);

    // Check return value
    if (ret) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};

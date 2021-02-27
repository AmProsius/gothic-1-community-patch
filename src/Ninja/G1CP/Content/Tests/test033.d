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
    var int funcId; funcId = MEM_FindParserSymbol("DIA_Gorn_HutFree_Condition");
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog condition 'DIA_Gorn_HutFree_Condition' not found");
        passed = FALSE;
    };

    // Check if the dialogs exist
    if (MEM_FindParserSymbol("DIA_Gorn_Hut") == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog 'DIA_Gorn_Hut' not found");
        passed = FALSE;
    };
    if (MEM_FindParserSymbol("DIA_Shrike_GetLost") == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog 'DIA_Shrike_GetLost' not found");
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
    var int told2Bak; told2Bak = Npc_KnowsInfo(hero, MEM_FindParserSymbol("DIA_Shrike_GetLost"));
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set new values
    Ninja_G1CP_SetInfoTold("DIA_Shrike_GetLost", TRUE); // Requirement
    Ninja_G1CP_SetInfoTold("DIA_Gorn_Hut", FALSE);      // Not told
    MEM_WriteInt(questPtr, 0);                          // Quest not running
    self  = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);
    MEM_WriteInt(questPtr, questBak);
    Ninja_G1CP_SetInfoTold("DIA_Gorn_Hut", told1Bak);
    Ninja_G1CP_SetInfoTold("DIA_Shrike_GetLost", told2Bak);

    // Check return value
    if (ret) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};

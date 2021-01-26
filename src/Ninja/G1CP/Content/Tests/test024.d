/*
 * #24 Cor Kalom closes wrong quest
 *
 * The hero is given 500 ore nuggets and the dialog function is called.
 * Caution: This test will trigger the dialog as told and closes the quest. Save the game before this test.
 *
 * Expected behavior: The variable 'Kalom_DrugMonopol' remains as before and 'Kalom_Krautbote' is set to 'LOG_SUCCESS'
 */
func int Ninja_G1CP_Test_024() {
    // Define possibly missing symbols locally
    const int LOG_RUNNING = 1;
    const int LOG_SUCCESS = 2;

    // Check status of the test
    var int passed; passed = TRUE;

    // Find Cor Kalom first
    var int symbId; symbId = MEM_FindParserSymbol("GUR_1201_CorKalom");
    if (symbId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("NPC 'GUR_1201_CorKalom' not found");
        passed = FALSE;
    };

    // Check if Cor Kalom exists in the world
    var C_Npc kalom; kalom = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(kalom)) {
        Ninja_G1CP_TestsuiteErrorDetail("'GUR_1201_CorKalom' is not a valid NPC");
        passed = FALSE;
    };

    // Check if dialog exists
    var int funcId; funcId = MEM_FindParserSymbol("Info_Kalom_KrautboteBACK_Info");
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog function 'Info_Kalom_KrautboteBACK_Info' not found");
        passed = FALSE;
    };

    // Check if the ore nugget item exists
    var int nuggetId; nuggetId = MEM_FindParserSymbol("ItMiNugget");
    if (nuggetId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Item 'ItMiNugget' not found");
        passed = FALSE;
    };

    // Obtain symbols
    var int drugMonopolPtr; drugMonopolPtr = MEM_GetSymbol("Kalom_DrugMonopol");
    if (!drugMonopolPtr) {
        Ninja_G1CP_TestsuiteErrorDetail("Variable 'Kalom_DrugMonopol' not found");
        passed = FALSE;
    };
    drugMonopolPtr += zCParSymbol_content_offset;
    var int krautbotePtr; krautbotePtr = MEM_GetSymbol("Kalom_Krautbote");
    if (!krautbotePtr) {
        Ninja_G1CP_TestsuiteErrorDetail("Variable 'Kalom_Krautbote' not found");
        passed = FALSE;
    };
    krautbotePtr += zCParSymbol_content_offset;

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Back up the values
    var int drugMonopolBak; drugMonopolBak = MEM_ReadInt(drugMonopolPtr);
    var int krautboteBak;   krautboteBak   = MEM_ReadInt(krautbotePtr);

    // Set the variables
    MEM_WriteInt(drugMonopolPtr, LOG_RUNNING);
    MEM_WriteInt(krautbotePtr,   LOG_RUNNING);

    // Add 500 ore for the condition within the dialog
    CreateInvItems(hero, nuggetId, 500);

    // Backup self and other
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set self and other
    self  = MEM_CpyInst(kalom);
    other = MEM_CpyInst(hero);

    // Just run the dialog and see what happens
    MEM_CallByID(funcId);

    // Restore self and other
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Check the variables now
    var int drugMonopolAfter; drugMonopolAfter = MEM_ReadInt(drugMonopolPtr);
    var int krautboteAfter;   krautboteAfter   = MEM_ReadInt(krautbotePtr);

    // Restore the variables
    MEM_WriteInt(drugMonopolPtr, drugMonopolBak);
    MEM_WriteInt(krautbotePtr, krautboteBak);

    // Confirm the fix
    if (drugMonopolAfter != LOG_RUNNING) {
        Ninja_G1CP_TestsuiteErrorDetail("Mission 'Kalom_DrugMonopol' was wrongfully closed");
        passed = FALSE;
    };
    if (krautboteAfter != LOG_SUCCESS) {
        Ninja_G1CP_TestsuiteErrorDetail("Mission 'Kalom_Krautbote' is still open");
        passed = FALSE;
    };

    return passed;
};

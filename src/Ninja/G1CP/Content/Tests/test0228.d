/*
 * #228 Gorn can't be asked about after talking to Lares
 *
 * Check if the dialog updated the AI variable.
 *
 * Expected behavior: The AI variable is updated correctly after talking to Lares.
 */
func int G1CP_Test_0228() {
    const string TEMP_TOPIC_NAME = "G1CP Test 228"; // Has to be a unique name with absolute certainty
    const string CH1_JoinNC = ""; CH1_JoinNC = G1CP_Testsuite_GetStringConst("CH1_JoinNC");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("PC_Fighter");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("ORG_801_Lares_BringListAnteil_Info");
    var int aiVarId; aiVarId = G1CP_Testsuite_CheckIntConst("AIV_FINDABLE");
    G1CP_Testsuite_CheckPassed();

    // Backup values
    G1CP_LogRenameTopic(CH1_JoinNC, TEMP_TOPIC_NAME);
    var int aiVarBak; aiVarBak = G1CP_NpcGetAiVarI(npc, aiVarId, 0);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, npc, hero, TRUE);

    // Retrieve the AI variable's value
    var int passed; passed = G1CP_NpcGetAiVarI(npc, aiVarId, 0);

    // Restore values
    G1CP_LogRemoveTopic(CH1_JoinNC);
    G1CP_LogRenameTopic(TEMP_TOPIC_NAME, CH1_JoinNC);
    G1CP_NpcSetAiVarI(npc, aiVarId, aiVarBak);

    // Check return value
    if (!passed) {
        G1CP_TestsuiteErrorDetail("The dialog function did not update the AI variable");
        return FALSE;
    };

    return TRUE;
};

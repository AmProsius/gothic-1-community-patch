/*
 * #228 Gorn can't be asked about after talking to Lares
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: Gorn is findable after talking to Lares.
 */
func int G1CP_Test_228() {
    const string TEMP_TOPIC_NAME = "G1CP Test 228"; // Has to be a unique name with absolute certainty
    const string CH1_JoinNC = ""; CH1_JoinNC = G1CP_Testsuite_GetStringConst("CH1_JoinNC", 0);
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("PC_Fighter");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("ORG_801_Lares_BringListAnteil_Info");
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("ORG_801_Lares_BringListBack");
    var int aiVarId; aiVarId = G1CP_Testsuite_CheckIntConst("AIV_FINDABLE", 0);
    G1CP_Testsuite_CheckPassed();

    // Backup values
    G1CP_LogRenameTopic(CH1_JoinNC, TEMP_TOPIC_NAME);
    var int aiVarBak; aiVarBak = G1CP_NpcGetAiVarI(npc, aiVarId, 0);
    var int toldBak; toldBak = Npc_KnowsInfo(hero, infoId);

    // Set new values
    G1CP_SetInfoToldI(infoId, TRUE);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, npc, hero, TRUE);

    // Retrieve the AI variable's value
    var int passed; passed = G1CP_NpcGetAiVarI(npc, aiVarId, 0);

    // Restore values
    G1CP_LogRenameTopic(CH1_JoinNC, TEMP_TOPIC_NAME);
    G1CP_NpcSetAiVarI(npc, aiVarId, aiVarBak);
    G1CP_SetInfoToldI(infoId, toldBak);

    // Check return value
    if (passed) {
        return TRUE;
    };

    G1CP_TestsuiteErrorDetail("The dialog function did not set the AI variable");
    return FALSE;
};

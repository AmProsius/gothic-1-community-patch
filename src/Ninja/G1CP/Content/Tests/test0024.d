/*
 * #24 Cor Kalom closes wrong quest
 *
 * The hero is given 500 ore nuggets and the dialog function is called.
 * Caution: This test will trigger the dialog as told and closes the quest. Save the game before this test.
 *
 * Expected behavior: The variable 'Kalom_DrugMonopol' remains as before and 'Kalom_Krautbote' is set to 'LOG_SUCCESS'
 */
func void G1CP_Test_0024() {
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("GUR_1201_CorKalom");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Info_Kalom_KrautboteBACK_Info");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ItMiNugget");
    var int drugId; drugId = G1CP_Testsuite_CheckIntVar("Kalom_DrugMonopol");
    var int krautId; krautId = G1CP_Testsuite_CheckIntVar("Kalom_Krautbote");
    const int LOG_RUNNING = 1;
    const int LOG_SUCCESS = 2;

    G1CP_Testsuite_BackupInt(drugId, 0);
    G1CP_Testsuite_BackupInt(krautId, 0);

    G1CP_SetIntVarI(drugId, 0, LOG_RUNNING);
    G1CP_SetIntVarI(krautId, 0, LOG_RUNNING);
    CreateInvItems(hero, itemId, 500);

    G1CP_Testsuite_Call(funcId, npc, hero, TRUE);
    G1CP_Testsuite_Assert(G1CP_GetIntVarI(drugId, 0, 0), LOG_RUNNING);
    G1CP_Testsuite_Assert(G1CP_GetIntVarI(krautId, 0, 0), LOG_SUCCESS);
};

/*
 * #126 The trading menu is opened after Sharky is appointed as new fence
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: Sharky will not open the trade menu when talking about Fisk's quest.
 */
func void G1CP_Test_126() {
    G1CP_Testsuite_CheckManual();
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("Org_843_Sharky_Fisk");
    var int fenceId; fenceId = G1CP_Testsuite_CheckIntVar("Fisk_GetNewHehler", 0);
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("Org_843_Sharky");
    G1CP_Testsuite_CheckPassed();

    // Define possibly missing symbols locally
    const int LOG_RUNNING = 1;

    // Enable the dialog by setting the quest marker to running
    G1CP_SetIntVarI(fenceId, 0, LOG_RUNNING);
    G1CP_SetInfoToldI(infoId, FALSE);

    // Teleport the hero to the NPC
    AI_Teleport(hero, npc.wp);
};

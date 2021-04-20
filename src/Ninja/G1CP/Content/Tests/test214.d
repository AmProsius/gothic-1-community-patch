/*
 * #214 Graham doesn't sit at campfire
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test will break the game. Save the game beforehand.
 *
 * Expected behavior: Graham will sit down by the campfire shortly (one game minute) after triggering this test.
 */
func void G1CP_Test_214() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCR_OUTSIDE_HUT_77_MOVEMENT");
    var int paydayId; paydayId = G1CP_Testsuite_CheckIntVar("Bloodwyn_PayDay", 0);
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("Info_Bloodwyn_Hello");
    G1CP_Testsuite_CheckPassed();

    // Shut up Bloodwyn
    G1CP_SetIntVarI(paydayId, 0, Wld_GetDay()+1);
    G1CP_SetInfoToldI(infoId, TRUE);

    // Set time and place
    Wld_SetTime(18, 0);
    AI_Teleport(hero, wp.name);
};

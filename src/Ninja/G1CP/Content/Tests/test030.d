/*
 * #30 Silas trades only one time
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: Silas can trade multiple times.
 */
func void G1CP_Test_030() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };

    // Prior checks
    G1CP_Testsuite_CheckInfo("DIA_Silas_Trade");
    var C_Npc npc; npc = G1CP_Testsuite_GetNpc("Org_841_Silas");
    G1CP_Testsuite_CheckPassed();

    // Teleport the hero to Silas
    AI_Teleport(hero, silas.wp);
};

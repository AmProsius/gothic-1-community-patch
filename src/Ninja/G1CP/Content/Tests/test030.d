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

    // Check status of the test
    var int passed; passed = TRUE;

    // Check if the dialog exists
    var int funcId; funcId = MEM_GetSymbolIndex("DIA_Silas_Trade");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Info 'DIA_Silas_Trade' not found");
        passed = FALSE;
    };

    // Find Silas
    var int symbId; symbId = MEM_GetSymbolIndex("Org_841_Silas");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("NPC 'Org_841_Silas' not found");
        return;
    };

    // Check if Silas exists in the world
    var C_Npc silas; silas = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(silas)) {
        G1CP_TestsuiteErrorDetail("NPC 'Org_841_Silas' not valid");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return;
    };

    // Teleport the hero to Silas
    AI_Teleport(hero, silas.wp);
};

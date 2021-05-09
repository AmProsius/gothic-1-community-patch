/*
 * #129 Drake has wrong body skin color
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: Drake's body has the same color as his head.
 */
func void G1CP_Test_129() {
    G1CP_Testsuite_CheckManual();
    G1CP_TeleportToWorld("OLDMINE.ZEN", "OM_CAVE1_13A");
};

/*
 * #128 Guard has duplicated END dialog
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The guard should only have one END dialog.
 */
func void G1CP_Test_0128() {
    G1CP_Testsuite_CheckManual();
    G1CP_Testsuite_NpcTeleportToWorld(hero, "OLDMINE.ZEN", "OM_CAVE1_16");
};

/*
 * #58 Player can decelerate falls by fight actions in mid-air
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The player should no longer be able to intercept falling by blocking.
 */
func void G1CP_Test_058() {
    G1CP_Testsuite_CheckManual();

    Npc_SetToFistMode(hero);
    G1CP_Testsuite_NpcBeamToPosF(hero, -5055.20459, 3906.66333, -3661.51001);
};

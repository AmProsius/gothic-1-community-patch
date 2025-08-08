/*
 * #51 Chest in crypt behind wall
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: The player character will be made immortal for this test. Save the game beforehand.
 *
 * Expected behavior: The chest is now accessible.
 */
func void G1CP_Test_0051() {
    G1CP_Testsuite_CheckManual();
    G1CP_Testsuite_CheckPassed();

    // Set PC to invincible to not be killed
    const int NPC_FLAG_IMMORTAL = 1 << 1;
    hero.flags = hero.flags | NPC_FLAG_IMMORTAL;

    G1CP_Testsuite_NpcBeamToNearestWpPosPtr(hero, _@f(G1CP_0051_StonehengeCryptChest_PosNew));
};

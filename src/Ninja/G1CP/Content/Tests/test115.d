/*
 * #115 Dummy Templars survive in orc graveyard
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The templars will be dead or reliably dying when walking through the orc graveyard.
 */
func void G1CP_Test_115() {
    G1CP_Testsuite_CheckManual();
    const string WORLD = "ORCGRAVEYARD.ZEN";
    const string WP = "GRYD_001";

    // Define possibly missing symbols locally
    const int NPC_FLAG_IMMORTAL = 1 << 1;

    // Set PC to invincible to observe the action
    hero.flags = hero.flags | NPC_FLAG_IMMORTAL;

    // Teleport the player to the entrance of the orc graveyard
    if (!Hlp_StrCmp(MEM_World.worldFilename, WORLD)) {
        const int oCGame__TriggerChangeLevel = 6542464; //0x63D480
        CALL_zStringPtrParam(WP);
        CALL_zStringPtrParam(WORLD);
        CALL__thiscall(_@(MEM_Game), oCGame__TriggerChangeLevel);
    } else {
        AI_Teleport(hero, WP);
    };
};

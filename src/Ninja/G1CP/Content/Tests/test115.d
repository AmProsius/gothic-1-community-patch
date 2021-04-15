/*
 * #115 Dummy Templars survive in orc graveyard
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The templars will be dead or reliably dying when walking through the orc graveyard.
 */
func void G1CP_Test_115() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };
    
    // Define possibly missing symbols locally
    const int NPC_FLAG_IMMORTAL = 1 << 1;

    // Set PC to invincible to observe the action
    hero.flags = hero.flags | NPC_FLAG_IMMORTAL;

    // Teleport the player to the entrance of the orc graveyard
    if (!Hlp_StrCmp(MEM_World.worldFilename, "ORCGRAVEYARD.ZEN")) {
        const int oCGame__TriggerChangeLevel = 6542464; //0x63D480
        CALL_zStringPtrParam("GRYD_001");
        CALL_zStringPtrParam("ORCGRAVEYARD.ZEN");
        CALL__thiscall(_@(MEM_Game), oCGame__TriggerChangeLevel);
    } else {
        AI_Teleport(hero, "GRYD_001");
    };
};

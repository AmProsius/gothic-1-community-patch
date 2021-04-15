/*
 * #136 NPCs cannot use ladders when following the player
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: Gorn should be able to climb up the ladder to reach the PC without interruptions.
 */
func void G1CP_Test_136() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };
    
    // Teleport the player to the entrance of the Free Mine
    if (!Hlp_StrCmp(MEM_World.worldFilename, "FREEMINE.ZEN")) {
        const int oCGame__TriggerChangeLevel = 6542464; //0x63D480
        CALL_zStringPtrParam("FM_20");
        CALL_zStringPtrParam("FREEMINE.ZEN");
        CALL__thiscall(_@(MEM_Game), oCGame__TriggerChangeLevel);
    } else {
        AI_Teleport(hero, "FM_20");
    };
};

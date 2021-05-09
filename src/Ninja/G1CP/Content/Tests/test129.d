/*
 * #129 Drake has wrong body skin color
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: Drake's body has the same color as his head.
 */
func void G1CP_Test_129() {
    G1CP_Testsuite_CheckManual();
    const string WORLD = "OLDMINE.ZEN";
    const string WP = "OM_CAVE1_13A";

    // Teleport the player to the entrance of the Free Mine
    if (!Hlp_StrCmp(MEM_World.worldFilename, WORLD)) {
        const int oCGame__TriggerChangeLevel = 6542464; //0x63D480
        CALL_zStringPtrParam(WP);
        CALL_zStringPtrParam(WORLD);
        CALL__thiscall(_@(MEM_Game), oCGame__TriggerChangeLevel);
    } else {
        AI_Teleport(hero, WP);
    };
};

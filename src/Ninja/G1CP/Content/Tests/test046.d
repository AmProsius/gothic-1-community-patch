/*
 * #46 Smith's door has wrong key instance
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation. The
 * function should be called twice: On first function call to find and pick up the key, on second function call to try
 * it on the door.
 * Caution: This test will break the game. Save the game beforehand.
 *
 * Expected behavior: First function call: The key is on the ground in the cell. Second function call: The key opens the
 * door.
 */
func void G1CP_Test_046() {
    G1CP_Testsuite_CheckManual();
    var int funcId; funcId = G1CP_Testsuite_CheckFunc("B_Story_ExploreSunkenTower", "void|none", "");
    var int guildId; guildId = G1CP_Testsuite_CheckIntConst("GIL_GRD", 0);
    var int bartholoId; bartholoId = G1CP_Testsuite_CheckInfo("DIA_EBR_106_Bartholo_Wait4SC");
    var int skipId; skipId = G1CP_Testsuite_CheckInfo("GRD_211_Skip_WELCOME");
    var zCWaypoint cellarWp; cellarWp = G1CP_Testsuite_FindWaypoint("OCC_CELLAR_BACK_LEFT_CELL");
    var zCWaypoint staircaseWp; staircaseWp = G1CP_Testsuite_FindWaypoint("OCC_STABLE_STAIRCASE_TOP");
    G1CP_Testsuite_CheckPassed();

    // Get constant values
    const int GUILD = 0; GUILD = G1CP_GetIntConstI(guildId, 0, 0);

    // Two passes
    if (!Npc_HasItems(hero, G1CP_046_SmithDoor_Item)) {
        // First function call (PC doesn't have the key yet): Teleport to the key

        // Advance the story progression
        MEM_CallByID(funcId);

        // This dialog would strangely trigger through walls (investigate why! Maybe by "B_CheckForImportantInfo"?)
        G1CP_SetInfoToldI(bartholoId, TRUE);
        G1CP_SetInfoToldI(skipId, TRUE);

        // Teleport to the cell
        AI_Teleport(hero, cellarWp.name);

        // Change the player's guild to not be attacked (just in case)
        hero.guild = GUILD;
        Npc_SetTrueGuild(hero, GUILD);

        // Some information
        Print("Confirm that the key is on the ground, pick it up and call the test again to teleport to the door.");

    } else {
        // Second function cell (PC does have the key): Teleport

        // Allow the player to confirm
        AI_Teleport(hero, staircaseWp.name);

        // Some information
        Print("Drop the key first and check if the door is unlocked already. Confirm that the key opens the door.");
    };
};

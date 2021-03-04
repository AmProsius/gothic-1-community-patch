/*
 * #47 Key to smithy doesn't spawn
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test makes the game unplayable. Save the game beforehand.
 *
 * Expected behavior: The key lies on the floor and vanishes during saving and re-appears afterwards.
 */
func void Ninja_G1CP_Test_047() {
    if (Ninja_G1CP_TestsuiteAllowManual) {

        // Find the story function
        var int funcId; funcId = MEM_FindParserSymbol("B_Story_ExploreSunkenTower");
        if (funcId == -1) {
            Ninja_G1CP_TestsuiteErrorDetail("Function 'B_Story_ExploreSunkenTower' not found");
        };

        // Advance the story progression
        MEM_CallByID(funcId);

        // This dialog would strangely trigger through walls (investigate why! Maybe by "B_CheckForImportantInfo"?)
        Ninja_G1CP_SetInfoTold("DIA_EBR_106_Bartholo_Wait4SC", TRUE);

        // Teleport to the cell
        AI_Teleport(hero, "OCC_CELLAR_BACK_LEFT_CELL");

        // Some information
        Print("Confirm that the keys present and watch if it disappears during and re-appears after saving.");
    };
};

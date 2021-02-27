/*
 * #126 The trading menu is opened after Sharky is appointed as new fence
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: Sharky will not open the trade menu when talking about Fisk's quest.
 */
func void Ninja_G1CP_Test_126() {
    if (!Ninja_G1CP_TestsuiteAllowManual) {
        return;
    };

    // Define possibly missing symbols locally
    const int LOG_RUNNING = 1;

    // Check status of the test
    var int passed; passed = TRUE;

    // Check if the dialog exists
    var int funcId; funcId = MEM_FindParserSymbol("Org_843_Sharky_Fisk");
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Info 'Org_843_Sharky_Fisk' not found");
        passed = FALSE;
    };

    // Check if variable exists
    var int questPtr; questPtr = MEM_GetSymbol("Fisk_GetNewHehler");
    if (!questPtr) {
        Ninja_G1CP_TestsuiteErrorDetail("Variable 'Fisk_GetNewHehler' not found");
        passed = FALSE;
    };
    questPtr += zCParSymbol_content_offset;

    // Find Sharky
    var int symbId; symbId = MEM_FindParserSymbol("Org_843_Sharky");
    if (symbId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("NPC 'Org_843_Sharky' not found");
        return;
    };

    // Check if Sharky exists in the world
    var C_Npc sharky; sharky = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(sharky)) {
        Ninja_G1CP_TestsuiteErrorDetail("NPC 'Org_843_Sharky' not valid");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return;
    };

    // Enable the dialog by setting the quest marker to running
    MEM_WriteInt(questPtr, LOG_RUNNING);
    Ninja_G1CP_SetInfoTold("Org_843_Sharky_Fisk", FALSE);

    // Teleport the hero to Sharky
    AI_Teleport(hero, sharky.wp);
};

/*
 * #31 Wolf's minecrawler plate dialog doesn't disappear
 *
 * A required dialog is set to 'told' and the condition functions of both dialogs are called.
 *
 * Expected behavior: The condition functions will return FALSE.
 */
func int G1CP_Test_031_RunDialog(var int itmInst, var int num, var string dialogName) {
    // Check if dialog exists
    var int funcId; funcId = MEM_FindParserSymbol(dialogName);
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail(ConcatStrings(ConcatStrings("Dialog condition '", dialogName), "' not found"));
        return FALSE;
    };

    // Backup values
    var int toldBak; toldBak = Npc_KnowsInfo(hero, MEM_FindParserSymbol("Info_Wolf_MCPLATESENOUGH")); // Told status
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);                                                     // Self
    var C_Npc othBak; othBak = MEM_CpyInst(other);                                                    // Other

    // Set new values
    G1CP_SetInfoTold("Info_Wolf_MCPLATESENOUGH", TRUE);                                               // Told status
    CreateInvItems(hero, itmInst, num);                                                               // Create items
    self  = MEM_CpyInst(hero);                                                                        // Self
    other = MEM_CpyInst(hero);                                                                        // Other

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self  = MEM_CpyInst(slfBak);                                                                      // Self
    other = MEM_CpyInst(othBak);                                                                      // Other
    Npc_RemoveInvItems(hero, itmInst, Npc_HasItems(hero, itmInst));                                   // Remove items
    G1CP_SetInfoTold("Info_Wolf_MCPLATESENOUGH", toldBak);                                            // Told status

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail(ConcatStrings(ConcatStrings("Dialog condition '", dialogName), "' failed"));
        return FALSE;
    };

    return TRUE;
};
func int G1CP_Test_031() {
    // Check status of the test
    var int passed; passed = TRUE;

    // Find item
    var int itmInst; itmInst = MEM_FindParserSymbol("ItAt_Crawler_02");
    if (itmInst == -1) {
        G1CP_TestsuiteErrorDetail("Item 'ItAt_Crawler_02' not found");
        passed = FALSE;
    };

    // Check if variable exists
    var int knowsPlatesPtr; knowsPlatesPtr = MEM_GetSymbol("Knows_GetMCPlates");
    if (!knowsPlatesPtr) {
        G1CP_TestsuiteErrorDetail("Variable 'Knows_GetMCPlates' not found");
        passed = FALSE;
    };
    knowsPlatesPtr += zCParSymbol_content_offset;

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Backup common values
    var int knowsPlatesBak; knowsPlatesBak = MEM_ReadInt(knowsPlatesPtr);
    var int itmNumBak; itmNumBak = Npc_HasItems(hero, itmInst);

    // Set new values
    MEM_WriteInt(knowsPlatesPtr, TRUE);
    if (itmNumBak > 0) {
        Npc_RemoveInvItems(hero, itmInst, itmNumBak);
    };

    // Run dialogs
    var int ret; ret = 0;
    ret += G1CP_Test_031_RunDialog(itmInst, 1,  "Info_Wolf_MCPLATESFEW_Condition");
    ret += G1CP_Test_031_RunDialog(itmInst, 15, "Info_Wolf_MCPLATESENOUGH_Condition");

    // Restore values
    MEM_WriteInt(knowsPlatesPtr, knowsPlatesBak);
    if (itmNumBak > 0) {
        CreateInvItems(hero, itmInst, itmNumBak);
    };

    return (ret == 2);
};

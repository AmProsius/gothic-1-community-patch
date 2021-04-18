/*
 * #176 The text of items with no value is incomplete in the inventory
 */
func void G1CP_Test_176() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };

    var int passed; passed = TRUE;

    var int item1Id; item1Id = G1CP_GetItemInstId("ItKe_Gomez_01");
    if (item1Id == -1) {
        G1CP_TestsuiteErrorDetail("Item instance 'ItKe_Gomez_01' not found");
        passed = FALSE;
    };

    var int item2Id; item2Id = G1CP_GetItemInstId("ItMw_1H_Sword_01");
    if (item2Id == -1) {
        G1CP_TestsuiteErrorDetail("Item instance 'ItMw_1H_Sword_01' not found");
        passed = FALSE;
    };

    if (!passed) {
        return;
    };

    // Give two items in the inventory
    CreateInvItem(hero, item1Id);
    CreateInvItem(hero, item2Id);

    // Give some info
    Print("Two items have been placed in the inventory. Please check their text display.");
};

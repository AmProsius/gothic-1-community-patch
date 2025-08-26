/*
 * #176 The text of items with no value is incomplete in the inventory
 */
func void G1CP_Test_0176() {
    G1CP_Testsuite_CheckManual();
    var int item1Id; item1Id = G1CP_Testsuite_CheckItem("ItKe_Gomez_01");
    var int item2Id; item2Id = G1CP_Testsuite_CheckItem("ItMw_1H_Sword_01");

    // Give two items in the inventory
    CreateInvItem(hero, item1Id);
    CreateInvItem(hero, item2Id);

    // Give some info
    Print("Two items have been placed in the inventory. Please check their text display.");
};

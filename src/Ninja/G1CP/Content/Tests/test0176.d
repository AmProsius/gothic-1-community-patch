/*
 * #176 The text of items with no value is incomplete in the inventory
 */
func void G1CP_Test_0176() {
    const string instr[2] = {
        "Two items (Gomez's key and a crude sword) have been placed in the inventory. Check their text display.",
        "Expected behavior: The items with no value no longer show an empty 'Value:' in the inventory text."
    };
    G1CP_Testsuite_CheckManual(instr);
    var int item1Id; item1Id = G1CP_Testsuite_CheckItem("ItKe_Gomez_01");
    var int item2Id; item2Id = G1CP_Testsuite_CheckItem("ItMw_1H_Sword_01");

    // Give two items in the inventory
    CreateInvItem(hero, item1Id);
    CreateInvItem(hero, item2Id);
};

/*
 * #44 Bugmeat in the wrong inventory category
 *
 * The mainflag (item category) of the item "ItAt_Meatbug_01" is inspected programmatically.
 *
 * Expected behavior: The item will have the correct mainflag.
 */
func void G1CP_Test_0044() {
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItAt_Meatbug_01");
    const int ITEM_KAT_FOOD = 1 << 5;
    G1CP_Testsuite_Assert(itm.mainflag, ITEM_KAT_FOOD);
};

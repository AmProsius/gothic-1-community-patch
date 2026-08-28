/*
 * Test the updated item description.
 */
func void G1CP_Tpl_TestItemDescription(var string itemInstName, var string correctStr) {
    var C_Item itm; itm = G1CP_Testsuite_CreateItem(itemInstName);
    G1CP_Testsuite_AssertS(itm.description, correctStr);
};

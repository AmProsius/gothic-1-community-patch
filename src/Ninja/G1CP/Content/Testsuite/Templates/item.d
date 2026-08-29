/*
 * Test the updated string variable (e.g. description, text[2], etc.) of an item.
 */
func void G1CP_Tpl_TestItemStringVar(var string itemInstName, var string prop, var string correctStr) {
    var C_Item itm; itm = G1CP_Testsuite_CreateItem(itemInstName);
    G1CP_Testsuite_AssertS(G1CP_Testsuite_GetInstStringVar(itm, prop), correctStr);
};

/*
 * Test the updated integer variable (e.g. value, count[2], etc.) of an item.
 */
func void G1CP_Tpl_TestItemIntVar(var string itemInstName, var string prop, var int correctVal) {
    var C_Item itm; itm = G1CP_Testsuite_CreateItem(itemInstName);
    G1CP_Testsuite_Assert(G1CP_Testsuite_GetInstIntVar(itm, prop), correctVal);
};

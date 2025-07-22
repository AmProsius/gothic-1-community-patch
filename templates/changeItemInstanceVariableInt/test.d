/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    // ### TODO: Replace item name of "Item_Name" ###
    // ### TODO: Replace int constant name of "Const_Name" ###
    // ### TODO: Replace property name of "property" and "itm.property" ###
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("Item_Name");
    const int Const_Name = 0; Const_Name = G1CP_Testsuite_GetIntConst("Const_Name", 0);
    G1CP_Testsuite_CheckPassed();

    if (itm.property != Const_Name) {
        G1CP_TestsuiteErrorDetailSIS("Property incorrect: property = '", itm.property, "'");
        return FALSE;
    }

    return TRUE;
};

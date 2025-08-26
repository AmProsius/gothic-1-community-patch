/*
 * #157 Potion of Velocity has wrong ore value
 *
 * The value of the item "ItFo_Potion_Haste_02" is inspected programmatically.
 *
 * Expected behavior: The item will have the correct value.
 */
func int G1CP_Test_0157() {
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItFo_Potion_Haste_02");
    const int Value_Haste2 = 0; Value_Haste2 = G1CP_Testsuite_GetIntConst("Value_Haste2");

    if (itm.value == Value_Haste2) {
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetailSIS("Category incorrect: value = '", itm.value, "'");
        return FALSE;
    };
};

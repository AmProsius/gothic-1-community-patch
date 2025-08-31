/*
 * #157 Potion of Velocity has wrong ore value
 *
 * The value of the item "ItFo_Potion_Haste_02" is inspected programmatically.
 *
 * Expected behavior: The item will have the correct value.
 */
func void G1CP_Test_0157() {
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItFo_Potion_Haste_02");
    var int Value_Haste2; Value_Haste2 = G1CP_Testsuite_GetIntConst("Value_Haste2");
    G1CP_Testsuite_Assert(itm.value, Value_Haste2);
};

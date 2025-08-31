/*
 * #158 Potion of Haste has wrong ore value
 *
 * The value of the item "ItFo_Potion_Haste_03" is inspected programmatically.
 *
 * Expected behavior: The item will have the correct value.
 */
func void G1CP_Test_0158() {
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItFo_Potion_Haste_03");
    var int Value_Haste3; Value_Haste3 = G1CP_Testsuite_GetIntConst("Value_Haste3");
    G1CP_Testsuite_Assert(itm.value, Value_Haste3);
};

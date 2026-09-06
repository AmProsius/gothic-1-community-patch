/*
 * #157 Potion of Velocity has wrong ore value
 */
func void G1CP_Test_0157() {
    var int Value_Haste2; Value_Haste2 = G1CP_Testsuite_GetIntConst("Value_Haste2");
    G1CP_Tpl_TestItemIntVar("ItFo_Potion_Haste_02", "value", Value_Haste2);
};

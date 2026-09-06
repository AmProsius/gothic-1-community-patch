/*
 * #158 Potion of Haste has wrong ore value
 */
func void G1CP_Test_0158() {
    var int Value_Haste3; Value_Haste3 = G1CP_Testsuite_GetIntConst("Value_Haste3");
    G1CP_Tpl_TestItemIntVar("ItFo_Potion_Haste_03", "value", Value_Haste3);
};

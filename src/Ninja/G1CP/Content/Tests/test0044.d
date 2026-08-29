/*
 * #44 Bugmeat in the wrong inventory category
 */
func void G1CP_Test_0044() {
    const int ITEM_KAT_FOOD = 1 << 5;
    G1CP_Tpl_TestItemIntVar("ItAt_Meatbug_01", "mainflag", ITEM_KAT_FOOD);
};

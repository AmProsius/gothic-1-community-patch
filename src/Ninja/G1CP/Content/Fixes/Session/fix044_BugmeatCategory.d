/*
 * #44 Bugmeat in the wrong inventory category
 */
func int G1CP_044_BugmeatCategory() {
    // Define possibly missing symbols locally
    const int ITEM_KAT_NONE = 1 << 0;
    const int ITEM_KAT_FOOD = 1 << 5;

    // Update ITEM_KAT_FOOD and ITEM_KAT_NONE if found (highly unlikely that they differ but let's be safe)
    ITEM_KAT_NONE = G1CP_GetIntConst("ITEM_KAT_NONE", 0, ITEM_KAT_NONE);
    ITEM_KAT_FOOD = G1CP_GetIntConst("ITEM_KAT_FOOD", 0, ITEM_KAT_FOOD);

    return G1CP_ItemChangeIntVar("ItAt_Meatbug_01", "mainflag", ITEM_KAT_NONE, ITEM_KAT_FOOD);
};

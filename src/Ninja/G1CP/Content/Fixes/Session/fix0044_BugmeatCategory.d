/*
 * #44 Bugmeat in the wrong inventory category
 */
func int G1CP_0044_BugmeatCategory() {
    // Define possibly missing symbols locally
    const int ITEM_KAT_NONE = 1 << 0;
    const int ITEM_KAT_FOOD = 1 << 5;

    // Update ITEM_KAT_FOOD and ITEM_KAT_NONE if found (highly unlikely that they differ but let's be safe)
    ITEM_KAT_NONE = G1CP_GetIntConst("ITEM_KAT_NONE", 0, ITEM_KAT_NONE);
    ITEM_KAT_FOOD = G1CP_GetIntConst("ITEM_KAT_FOOD", 0, ITEM_KAT_FOOD);

    // Replace any assignments to mainflag
    var int itemId; itemId = G1CP_GetItemInstId("ItAt_Meatbug_01");
    return (G1CP_ReplaceAssignInt(itemId, 0, "C_ITEM.mainflag", 0, ITEM_KAT_NONE, ITEM_KAT_FOOD) > 0);
};

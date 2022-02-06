/*
 * #172 Spelling - Kalom's Recipe (DE)
 */
func int G1CP_172_DE_KalomsRecipeName() {
    var int itemId; itemId = G1CP_GetItemInstId("KalomsRecipe");
    return (G1CP_ReplaceAssignStr(itemId, 0, "C_ITEM.NAME", 0, "Kalom's Rezept", "Kaloms Rezept") > 0);
};


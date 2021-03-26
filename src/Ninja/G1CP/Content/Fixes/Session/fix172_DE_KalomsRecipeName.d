/*
 * #172 Spelling - Kalom's Recipe (DE)
 */
func int G1CP_172_DE_KalomsRecipeName() {
    var int symbId; symbId = MEM_GetSymbolIndex("KalomsRecipe");
    return (G1CP_ReplaceAssignStr(symbId, "C_ITEM.NAME", 0, "Kalom's Rezept", "Kaloms Rezept") > 0);
};


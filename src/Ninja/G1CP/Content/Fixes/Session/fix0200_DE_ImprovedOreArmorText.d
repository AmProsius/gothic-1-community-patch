/*
 * #200 Text of Improved Ore Armor too long (DE)
 */
func int G1CP_0200_DE_ImprovedOreArmorText() {
    var int itemId; itemId = G1CP_GetItemInstId("ORE_ARMOR_H");
    const string needle  = "Stone der Schmied hat diese antike R�stung noch verbessern k�nnen!";
    const string replace = "Stone der Schmied hat sie noch verbessern k�nnen!"; // Must be a constant
    return (G1CP_ReplaceAssignStr(itemId, 0, "C_Item.text", needle, replace) > 0);
};

/*
 * #200 Description of Improved Ore Armor too long (DE)
 */
func int G1CP_200_DE_ImprovedOreArmorDescription() {
    var int symbId; symbId = MEM_GetSymbolIndex("ORE_ARMOR_H");
    const string needle  = "Stone der Schmied hat diese antike R�stung noch verbessern k�nnen!";
    const string replace = "Stone der Schmied hat sie noch verbessern k�nnen!"; // Must be a constant
    return (G1CP_ReplaceAssignStr(symbId, "C_ITEM.TEXT", 0, needle, replace) > 0);
};

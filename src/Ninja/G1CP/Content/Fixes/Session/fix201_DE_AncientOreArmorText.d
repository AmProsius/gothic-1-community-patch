/*
 * #201 Text of Ancient Ore Armor too long (DE)
 */
func int G1CP_201_DE_AncientOreArmorText() {
    var int symbId; symbId = MEM_GetSymbolIndex("ORE_ARMOR_M");
    const string needle  = "Diese uralte R�stung wurde vollst�ndig aus magischen Erz geschmiedet.";
    const string replace = "Diese alte R�stung wurde aus magischem Erz gefertigt."; // Must be a constant
    return (G1CP_ReplaceAssignStr(symbId, 0, "C_ITEM.TEXT", 0, needle, replace) > 0);
};

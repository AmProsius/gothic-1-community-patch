/*
 * #149 Spelling - Improved Ore Armor (DE/EN)
 */
func int G1CP_149_DE_EN_ImprovedOreArmorName() {
    var int symbId; symbId = MEM_GetSymbolIndex("ORE_ARMOR_H");
    const string needle = "";
    const string replace = "";
    if (G1CP_Lang == G1CP_Lang_DE) {
        needle  = "verbesserte Erzrüstung";
        replace = "Verbesserte Erzrüstung";
    } else if (G1CP_Lang == G1CP_Lang_EN) {
        needle  = "Improved ore Armor";
        replace = "Improved Ore Armor";
    };
    return (G1CP_ReplaceAssignStr(symbId, "C_Item.name", 0, needle, replace) > 0);
};

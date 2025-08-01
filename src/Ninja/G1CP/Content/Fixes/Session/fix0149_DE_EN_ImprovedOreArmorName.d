/*
 * #149 Spelling - Improved Ore Armor (DE/EN)
 */
func int G1CP_0149_DE_EN_ImprovedOreArmorName() {
    var int itemId; itemId = G1CP_GetItemInstId("ORE_ARMOR_H");
    const string needle = "G1CP invalid string";
    const string replace = "G1CP invalid string";
    if (G1CP_Lang & G1CP_Lang_DE) {
        needle  = "verbesserte Erzr�stung";
        replace = "Verbesserte Erzr�stung";
    } else if (G1CP_Lang & G1CP_Lang_EN) {
        needle  = "Improved ore Armor";
        replace = "Improved Ore Armor";
    };
    return (G1CP_ReplaceAssignStr(itemId, 0, "C_ITEM.NAME", 0, needle, replace) > 0);
};

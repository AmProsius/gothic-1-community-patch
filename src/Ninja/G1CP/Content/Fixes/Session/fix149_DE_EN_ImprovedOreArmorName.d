/*
 * #149 Spelling - Improved Ore Armor (DE/EN)
 */
func int G1CP_149_DE_EN_ImprovedOreArmorName() {
    const string originalStr = "G1CP invalid string";
    const string correctedStr = "G1CP invalid string";

    if (G1CP_Lang & G1CP_Lang_DE) {
        originalStr = "verbesserte Erzrüstung";
        correctedStr = "Verbesserte Erzrüstung";
    } else if (G1CP_Lang & G1CP_Lang_EN) {
        originalStr = "Improved ore Armor";
        correctedStr = "Improved Ore Armor";
    };

    return G1CP_ItemChangeName("ORE_ARMOR_H", originalStr, correctedStr);
};

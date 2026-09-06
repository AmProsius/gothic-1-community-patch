/*
 * #149 Spelling - Improved Ore Armor (DE/EN)
 */
func int G1CP_0149_DE_EN_ImprovedOreArmorName() {
    if (G1CP_Lang & G1CP_Lang_DE) {
        return G1CP_Tpl_ChangeItemStrVar("ORE_ARMOR_H", "name", "verbesserte Erzrüstung", "Verbesserte Erzrüstung");
    } else if (G1CP_Lang & G1CP_Lang_EN) {
        return G1CP_Tpl_ChangeItemStrVar("ORE_ARMOR_H", "name", "Improved ore Armor", "Improved Ore Armor");
    } else {
        return FALSE;
    };
};

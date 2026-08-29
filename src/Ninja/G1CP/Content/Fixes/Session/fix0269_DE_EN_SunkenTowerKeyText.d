/*
 * #269 Spelling - Sunken Tower' Key Text (DE/EN)
 */
func int G1CP_0269_DE_EN_SunkenTowerKeyText() {
    if (G1CP_Lang & G1CP_Lang_DE) {
        return G1CP_Tpl_ChangeItemStrVar("ItKe_SunkenTower", "text", "öffnet die Türen", "Öffnet die Truhen");
    } else if (G1CP_Lang & G1CP_Lang_EN) {
        return G1CP_Tpl_ChangeItemStrVar(
            "ItKe_SunkenTower",
            "text",
            "Opens the doors in the",
            "Opens the chests in the"
        );
    } else {
        return FALSE;
    };
};

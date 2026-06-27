/*
 * #269 Spelling - Sunken Tower' Key Text (DE/EN)
 */
func int G1CP_0269_DE_EN_SunkenTowerKeyText() {
    const string needle = "G1CP invalid string";
    var string replace; // Use a variable instead of a constant to have a unique string on re-assignment below

    if (G1CP_Lang & G1CP_Lang_DE) {
        needle  = "öffnet die Türen";
        replace = "Öffnet die Truhen";
    } else if (G1CP_Lang & G1CP_Lang_EN) {
        needle  = "Opens the doors in the";
        replace = "Opens the chests in the";
    };

    return G1CP_Tpl_ChangeItemStrVar("ItKe_SunkenTower", "text", needle, replace);
};

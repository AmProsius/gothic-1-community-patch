/*
 * #266 Spelling - Old Mine storage chest key (DE/EN)
 */
func int G1CP_0266_DE_EN_StorageChestKey() {
    const string needle = "G1CP invalid string";
    var string replace; // Use a variable instead of a constant to have a unique string on re-assignment below

    if (G1CP_Lang & G1CP_Lang_DE) {
        needle  = "öffnet die Truhen";
        replace = "Öffnet die Truhen";
    } else if (G1CP_Lang & G1CP_Lang_EN) {
        needle  = "opens the chests in the";
        replace = "Opens the chests in the";
    };

    return G1CP_Tpl_ChangeItemStrVar("ItKe_OM_03", "text", needle, replace);
};

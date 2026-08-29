/*
 * #266 Spelling - Old Mine storage chest key (DE/EN)
 */
func int G1CP_0266_DE_EN_StorageChestKey() {
    if (G1CP_Lang & G1CP_Lang_DE) {
        return G1CP_Tpl_ChangeItemStrVar("ItKe_OM_03", "text", "öffnet die Truhen", "Öffnet die Truhen");
    } else if (G1CP_Lang & G1CP_Lang_EN) {
        return G1CP_Tpl_ChangeItemStrVar("ItKe_OM_03", "text", "opens the chests in the", "Opens the chests in the");
    } else {
        return FALSE;
    };
};

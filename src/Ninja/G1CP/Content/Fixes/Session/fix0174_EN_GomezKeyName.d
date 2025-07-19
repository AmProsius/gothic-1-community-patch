/*
 * #174 Spelling - Gomez' Key (EN)
 */
func int G1CP_0174_EN_GomezKeyName() {
    var int itemId; itemId = G1CP_GetItemInstId("ItKe_Gomez_01");
    return (G1CP_ReplaceAssignStr(itemId, 0, "C_ITEM.NAME", 0, "Gomez' Bowl", "Gomez' Key") > 0);
};

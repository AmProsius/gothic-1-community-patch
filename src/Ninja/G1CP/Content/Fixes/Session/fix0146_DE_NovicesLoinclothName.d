/*
 * #146 Spelling - Novice's Loincloth (DE)
 */
func int G1CP_0146_DE_NovicesLoinclothName() {
    var int itemId; itemId = G1CP_GetItemInstId("NOV_ARMOR_L");
    return (G1CP_ReplaceAssignStr(itemId, 0, "C_ITEM.NAME", 0, "Novizen Rock", "Novizenrock") > 0);
};

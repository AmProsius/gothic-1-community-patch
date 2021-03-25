/*
 * #146 Spelling - Novice's Loincloth (DE)
 */
func int G1CP_146_DE_NovicesLoinclothName() {
    var int symbId; symbId = MEM_GetSymbolIndex("NOV_ARMOR_L");
    return (G1CP_ReplaceAssignStr(symbId, "C_ITEM.NAME", 0, "Novizen Rock", "Novizenrock") > 0);
};

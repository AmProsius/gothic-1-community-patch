/*
 * #174 Spelling - Gomez' Key (EN)
 */
func int G1CP_174_EN_GomezKeyName() {
    var int symbId; symbId = MEM_GetSymbolIndex("ItKe_Gomez_01");
    return (G1CP_ReplaceAssignStr(symbId, "C_Item.name", 0, "Gomez' Bowl", "Gomez' Key") > 0);
};

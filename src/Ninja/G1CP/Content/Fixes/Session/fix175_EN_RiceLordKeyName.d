/*
 * #175 Spelling - Rice Lord's Key (EN)
 */
func int G1CP_175_EN_RiceLordKeyName() {
    var int symbId; symbId = MEM_GetSymbolIndex("ItKey_RB_01");
    return (G1CP_ReplaceAssignStr(symbId, "C_Item.name", 0, "Rice Lord's Bowl", "Rice Lord's Key") > 0);
};

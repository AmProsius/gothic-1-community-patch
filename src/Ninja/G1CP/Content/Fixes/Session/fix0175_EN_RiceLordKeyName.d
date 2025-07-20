/*
 * #175 Spelling - Rice Lord's Key (EN)
 */
func int G1CP_0175_EN_RiceLordKeyName() {
    var int itemId; itemId = G1CP_GetItemInstId("ItKey_RB_01");
    return (G1CP_ReplaceAssignStr(itemId, 0, "C_ITEM.NAME", 0, "Rice Lord's Bowl", "Rice Lord's Key") > 0);
};

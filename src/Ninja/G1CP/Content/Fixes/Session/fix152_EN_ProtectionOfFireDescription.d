/*
 * #152 Spelling - Ring of Fire Protection (EN)
 */
func int G1CP_152_EN_ProtectionOfFireDescription() {
    var int symbId; symbId = MEM_GetSymbolIndex("Schutzring_Feuer2");
    return (G1CP_ReplaceAssignStr(symbId, "C_ITEM.DESCRIPTION", 0, "Protection of Fire", "Ring of Fire Protection") > 0);
};

/*
 * #152 Spelling - Ring of Fire Protection (EN)
 */
func int G1CP_152_EN_ProtectionOfFireDescription() {
    var int symbId; symbId = MEM_GetSymbolIndex("Schutzring_Feuer2");
    const string needle = "Protection of Fire";
    const string replace = "Ring of Fire Protection";
    return (G1CP_ReplaceAssignStr(symbId, "C_ITEM.DESCRIPTION", 0, needle, replace) > 0);
};

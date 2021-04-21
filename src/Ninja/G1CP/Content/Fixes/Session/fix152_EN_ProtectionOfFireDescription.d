/*
 * #152 Spelling - Ring of Fire Protection (EN)
 */
func int G1CP_152_EN_ProtectionOfFireDescription() {
    var int itemId; itemId = G1CP_GetItemInstId("Schutzring_Feuer2");
    const string needle = "Protection of Fire";
    const string replace = "Ring of Fire Protection";
    return (G1CP_ReplaceAssignStr(itemId, 0, "C_ITEM.DESCRIPTION", 0, needle, replace) > 0);
};

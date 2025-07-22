/*
 * #232 Spelling - Transform Bloodfly (DE)
 */
func int G1CP_0232_DE_TransformBloodflyDescription() {
    var int itemId; itemId = G1CP_GetItemInstId("ItArScrollTrfBloodfly");
    const string needle = "Verwandlung Bloodfly";
    const string replace = "Verwandlung Blutfliege";
    return (G1CP_ReplaceAssignStr(itemId, 0, "C_ITEM.DESCRIPTION", 0, needle, replace) > 0);
};

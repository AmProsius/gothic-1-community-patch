/*
 * #231 Spelling - Transform Orc Dog (DE)
 */
func int G1CP_231_DE_TransformOrcDogDescription() {
    var int itemId; itemId = G1CP_GetItemInstId("ItArScrollTrfOrcdog");
    const string needle = "Verwandlung Orcdog";
    const string replace = "Verwandlung Orkhund";
    return (G1CP_ReplaceAssignStr(itemId, 0, "C_ITEM.DESCRIPTION", 0, needle, replace) > 0);
};

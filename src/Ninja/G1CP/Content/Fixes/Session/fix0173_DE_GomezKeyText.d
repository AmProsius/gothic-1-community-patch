/*
 * #173 Spelling - Gomez' Key: "Gomez' Truhen" (DE)
 */
func int G1CP_0173_DE_GomezKeyText() {
    var int itemId; itemId = G1CP_GetItemInstId("ItKe_Gomez_01");
    return (G1CP_ReplaceAssignStr(itemId, 0, "C_ITEM.TEXT", 0, "Öffnet Gomez Truhen", "Öffnet Gomez' Truhen") > 0);
};

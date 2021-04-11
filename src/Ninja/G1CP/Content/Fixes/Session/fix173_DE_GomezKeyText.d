/*
 * #173 Spelling - Gomez' Key: "Gomez' Truhen" (DE)
 */
func int G1CP_173_DE_GomezKeyText() {
    var int symbId; symbId = MEM_GetSymbolIndex("ItKe_Gomez_01");
    return (G1CP_ReplaceAssignStr(symbId, 0, "C_ITEM.TEXT", 0, "Öffnet Gomez Truhen", "Öffnet Gomez' Truhen") > 0);
};

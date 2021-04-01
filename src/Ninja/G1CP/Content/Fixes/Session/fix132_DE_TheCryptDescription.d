/*
 * #132 Spelling - Book: "Die Gruft" (DE)
 */
func int G1CP_132_DE_TheCryptDescription() {
    var int symbId; symbId = MEM_GetSymbolIndex("Die_Gruft");
    return (G1CP_ReplaceAssignStr(symbId, "C_ITEM.DESCRIPTION", 0, "Kampfkunst", "Die Gruft") > 0);
};

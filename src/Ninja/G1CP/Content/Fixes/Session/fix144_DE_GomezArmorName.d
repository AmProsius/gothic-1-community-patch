/*
 * #144 Spelling - Gomez' Armor (DE)
 */
func int G1CP_144_DE_GomezArmorName() {
    var int symbId; symbId = MEM_GetSymbolIndex("EBR_ARMOR_H");
    return (G1CP_ReplaceAssignStr(symbId, "C_ITEM.NAME", 0, "Gomez'R�stung", "Gomez' R�stung") > 0);
};

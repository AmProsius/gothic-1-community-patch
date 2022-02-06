/*
 * #144 Spelling - Gomez' Armor (DE)
 */
func int G1CP_144_DE_GomezArmorName() {
    var int itemId; itemId = G1CP_GetItemInstId("EBR_ARMOR_H");
    return (G1CP_ReplaceAssignStr(itemId, 0, "C_ITEM.NAME", 0, "Gomez'Rüstung", "Gomez' Rüstung") > 0);
};

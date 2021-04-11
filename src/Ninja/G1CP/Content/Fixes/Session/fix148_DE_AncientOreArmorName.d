/*
 * #148 Spelling - Ancient Ore Armor (DE)
 */
func int G1CP_148_DE_AncientOreArmorName() {
    var int symbId; symbId = MEM_GetSymbolIndex("ORE_ARMOR_M");
    return (G1CP_ReplaceAssignStr(symbId, 0, "C_ITEM.NAME", 0, "antike Erzrüstung", "Antike Erzrüstung") > 0);
};

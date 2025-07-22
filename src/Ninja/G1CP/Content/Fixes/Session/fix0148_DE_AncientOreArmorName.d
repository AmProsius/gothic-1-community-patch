/*
 * #148 Spelling - Ancient Ore Armor (DE)
 */
func int G1CP_0148_DE_AncientOreArmorName() {
    var int itemId; itemId = G1CP_GetItemInstId("ORE_ARMOR_M");
    return (G1CP_ReplaceAssignStr(itemId, 0, "C_ITEM.NAME", 0, "antike Erzrüstung", "Antike Erzrüstung") > 0);
};

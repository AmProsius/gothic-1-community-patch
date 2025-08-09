/*
 * #145 Spelling - Light Mercenary's Armor (DE)
 */
func int G1CP_0145_DE_LightMercenarysArmorName() {
    var int itemId; itemId = G1CP_GetItemInstId("SLD_ARMOR_L");
    return (G1CP_ReplaceAssignStr(itemId, 0, "C_Item.name", "leichte Söldnerrüstung", "Leichte Söldnerrüstung") > 0);
};

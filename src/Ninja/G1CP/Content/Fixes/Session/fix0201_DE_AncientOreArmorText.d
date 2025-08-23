/*
 * #201 Text of Ancient Ore Armor too long (DE)
 */
func int G1CP_0201_DE_AncientOreArmorText() {
    var int itemId; itemId = G1CP_GetItemInstId("ORE_ARMOR_M");
    const string needle  = "Diese uralte Rüstung wurde vollständig aus magischen Erz geschmiedet.";
    const string replace = "Diese alte Rüstung wurde aus magischem Erz gefertigt."; // Must be a constant
    return (G1CP_ReplaceAssignStr(itemId, 0, "C_Item.text", needle, replace) > 0);
};

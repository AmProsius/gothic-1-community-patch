/*
 * #201 Text of Ancient Ore Armor too long (DE)
 */
func int G1CP_201_DE_AncientOreArmorText() {
    const string originalStr  = "Diese uralte Rüstung wurde vollständig aus magischen Erz geschmiedet.";
    const string correctedStr = "Diese alte Rüstung wurde aus magischem Erz gefertigt.";

    return G1CP_ItemChangeText("ORE_ARMOR_M", originalStr, correctedStr);
};

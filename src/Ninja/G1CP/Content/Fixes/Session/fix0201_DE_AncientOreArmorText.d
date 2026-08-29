/*
 * #201 Text of Ancient Ore Armor too long (DE)
 */
func int G1CP_0201_DE_AncientOreArmorText() {
    return G1CP_Tpl_ChangeItemStrVar(
        "ORE_ARMOR_M",
        "text",
        "Diese uralte Rüstung wurde vollständig aus magischen Erz geschmiedet.",
        "Diese alte Rüstung wurde aus magischem Erz gefertigt."
    );
};

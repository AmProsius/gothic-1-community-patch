/*
 * #200 Text of Improved Ore Armor too long (DE)
 */
func int G1CP_200_DE_ImprovedOreArmorText() {
    const string originalStr  = "Stone der Schmied hat diese antike Rüstung noch verbessern können!";
    const string correctedStr = "Stone der Schmied hat sie noch verbessern können!";

    return G1CP_ItemChangeText("ORE_ARMOR_H", originalStr, correctedStr);
};

/*
 * #200 Text of Improved Ore Armor too long (DE)
 */
func int G1CP_200_DE_ImprovedOreArmorText() {
    const string originalStr  = "Stone der Schmied hat diese antike R�stung noch verbessern k�nnen!";
    const string correctedStr = "Stone der Schmied hat sie noch verbessern k�nnen!";

    return G1CP_ItemChangeText("ORE_ARMOR_H", originalStr, correctedStr);
};

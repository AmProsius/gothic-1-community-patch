/*
 * #338 Spelling - Grilled Meat (DE/EN)
 */
func int G1CP_0338_DE_EN_GrilledMeatName() {
    if (G1CP_Lang & G1CP_Lang_DE) {
        return G1CP_Tpl_ChangeItemStrVar("ItFoMutton", "name", "gebratenes Fleisch", "Gebratenes Fleisch");
    } else if (G1CP_Lang & G1CP_Lang_EN) {
        return G1CP_Tpl_ChangeItemStrVar("ItFoMutton", "name", "Grilled meat", "Grilled Meat");
    } else {
        return FALSE;
    };
};

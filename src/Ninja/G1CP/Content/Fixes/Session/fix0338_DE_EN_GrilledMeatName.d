/*
 * #338 Spelling - Grilled Meat (DE/EN)
 */
func int G1CP_0338_DE_EN_GrilledMeatName() {
    const string needle = "G1CP invalid string";
    var string replace; // Use a variable instead of a constant to have a unique string on re-assignment below
    if (G1CP_Lang & G1CP_Lang_DE) {
        needle  = "gebratenes Fleisch";
        replace = "Gebratenes Fleisch";
    } else if (G1CP_Lang & G1CP_Lang_EN) {
        needle  = "Grilled meat";
        replace = "Grilled Meat";
    };
    return G1CP_Tpl_ChangeItemStrVar("ItFoMutton", "name", needle, replace);
};

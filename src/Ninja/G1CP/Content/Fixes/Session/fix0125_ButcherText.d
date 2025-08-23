/*
 * #125 The Butcher is described as two-handed sword
 */
func int G1CP_0125_ButcherText() {
    var int itemId; itemId = G1CP_GetItemInstId("ItMw_1H_Sword_Bastard_02");
    var int oneHandedSymbId; oneHandedSymbId = G1CP_GetStringConstId("NAME_OneHanded");
    var string NAME_TwoHanded; NAME_TwoHanded = G1CP_GetStringConst("NAME_TwoHanded", "G1CP_invalid_string");
    return (G1CP_ReplaceAssignStrId(itemId, 0, "C_Item.text[4]", NAME_TwoHanded, oneHandedSymbId) > 0);
};

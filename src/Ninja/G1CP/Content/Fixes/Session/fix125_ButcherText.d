/*
 * #125 The Butcher is described as two-handed sword
 */
func int G1CP_125_ButcherText() {
    var int itemId; itemId = G1CP_GetItemInstId("ItMw_1H_Sword_Bastard_02");
    var int oneHandedSymbId; oneHandedSymbId = G1CP_GetStringConstId("NAME_OneHanded", 0);
    var string NAME_TwoHanded; NAME_TwoHanded = G1CP_GetStringConst("NAME_TwoHanded", 0, "G1CP_invalid_string");

    return (G1CP_ReplaceAssignStrId(itemId, 0, "C_ITEM.TEXT", 4, NAME_TwoHanded, oneHandedSymbId) > 0);
};

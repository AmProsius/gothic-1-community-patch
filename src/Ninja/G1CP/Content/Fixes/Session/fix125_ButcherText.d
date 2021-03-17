/*
 * #125 The Butcher is described as two-handed sword
 */
func int G1CP_125_ButcherText() {
    var int symbId; symbId = MEM_FindParserSymbol("ItMw_1H_Sword_Bastard_02");
    var int oneHandedSymbId; oneHandedSymbId = MEM_FindParserSymbol("NAME_OneHanded");
    var string NAME_TwoHanded; NAME_TwoHanded = G1CP_GetStringVar("NAME_TwoHanded", 0, "G1CP_invalid_string");
    return (G1CP_ReplaceAssignStrID(symbId, "C_ITEM.TEXT", 4, NAME_TwoHanded, oneHandedSymbId) > 0);
};

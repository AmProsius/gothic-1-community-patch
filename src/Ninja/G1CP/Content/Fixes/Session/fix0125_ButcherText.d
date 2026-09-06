/*
 * #125 The Butcher is described as two-handed sword
 */
func int G1CP_0125_ButcherText() {
    var string NAME_OneHanded; NAME_OneHanded = G1CP_GetStringConst("NAME_OneHanded", "G1CP_invalid_string");
    var string NAME_TwoHanded; NAME_TwoHanded = G1CP_GetStringConst("NAME_TwoHanded", "G1CP_invalid_string");
    return G1CP_Tpl_ChangeItemStrVar("ItMw_1H_Sword_Bastard_02", "text[4]", NAME_TwoHanded, NAME_OneHanded);
};

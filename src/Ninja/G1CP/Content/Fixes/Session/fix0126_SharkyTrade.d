/*
 * #126 The trading menu is opened after Sharky is appointed as new fence
 */
func int G1CP_0126_SharkyTrade() {
    return G1CP_Tpl_ChangeInfoInstIntVar("Org_843_Sharky_Fisk", "trade", 1, 0);
};

/*
 * #126 The trading menu is opened after Sharky is appointed as new fence
 */
func int G1CP_126_SharkyTrade() {
    var int symbId; symbId = MEM_GetSymbolIndex("Org_843_Sharky_Fisk");
    return (G1CP_ReplaceAssignInt(symbId, "C_Info.trade", 0, 1, 0) > 0);
};

/*
 * #126 The trading menu is opened after Sharky is appointed as new fence
 */
func int G1CP_126_SharkyTrade() {
    const string infoName = "Org_843_Sharky_Fisk";
    const string infoProp = "trade";
    const int originalInt = 1;
    const int correctedInt = 0;

    return (G1CP_ChangeInfoIntVar(infoName, infoProp, originalInt, correctedInt) > 0);
};

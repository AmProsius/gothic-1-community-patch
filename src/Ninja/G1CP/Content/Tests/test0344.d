/*
 * #344 Spelling - There are quotation marks in Ian's subtitles (EN)
 */
func int G1CP_Test_0344() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var int ouPtr; ouPtr = G1CP_Testsuite_CheckOu("STT_301_IAN_GEAR_SUC_Info_13_04");
    const int DOUBLE_QUOTE = 34;
    const string cleaned = "";
    if (SB_New()) {
        SB("Just tell him ");
        SBc(DOUBLE_QUOTE);
        SB("Everything's gonna be fine");
        SBc(DOUBLE_QUOTE);
        SB(". Then he'll know that I've given you permission.");
        cleaned = SB_ToString();
        SB_Destroy();
    };
    G1CP_Testsuite_AssertS(G1CP_GetOuTextP(ouPtr), cleaned);
};

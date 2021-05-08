/*
 * #235 Spelling - Magic book: "Verwandlung Orkhund" (DE)
 */
func int G1CP_Test_235() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    const int SPL_TRF_ORCDOG = 0; SPL_TRF_ORCDOG = G1CP_Testsuite_GetIntConst("SPL_TRF_ORCDOG", 0);
    var string name; name = G1CP_Testsuite_GetStringConst("TXT_SPELLS", SPL_TRF_ORCDOG);
    G1CP_Testsuite_CheckPassed();

    return Hlp_StrCmp(name, "Verwandlung Orkhund");
};
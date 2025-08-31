/*
 * #235 Spelling - Magic book: "Verwandlung Orkhund" (DE)
 */
func void G1CP_Test_0235() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    const string SPELL_NAME = "SPL_TRF_ORCDOG";
    const int SPL_TRF_ORCDOG = 0; SPL_TRF_ORCDOG = G1CP_Testsuite_GetIntConst(SPELL_NAME);
    var string strName; strName = G1CP_ComposeArraySymbolName("TXT_SPELLS", SPL_TRF_ORCDOG);
    var string name; name = G1CP_Testsuite_GetStringConst(strName);
    G1CP_Testsuite_AssertS(name, "Verwandlung Orkhund");
};

/*
 * #235 Spelling - Magic book: "Verwandlung Orkhund" (DE)
 */
func int G1CP_Test_235() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    const string SPELL_NAME = ""; SPELL_NAME = "SPL_TRF_ORCDOG";
    const int SPL_TRF_ORCDOG = 0; SPL_TRF_ORCDOG = G1CP_Testsuite_GetIntConst(SPELL_NAME, 0);
    var string name; name = G1CP_Testsuite_GetStringConst("TXT_SPELLS", SPL_TRF_ORCDOG);
    G1CP_Testsuite_CheckPassed();

    if (!Hlp_StrCmp(name, "Verwandlung Orkhund")) {
        G1CP_TestsuiteErrorDetailSSSSS("String incorrect: TXT_SPELLS[", SPELL_NAME, "] = '", name, "'");
        return FALSE;
    };

    return TRUE;
};

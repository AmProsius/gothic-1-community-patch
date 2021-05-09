/*
 * #236 Spelling - Guild: "Orkhund" (DE)
 */
func int G1CP_Test_236() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    const int GIL_ORCDOG = 0; GIL_ORCDOG = G1CP_Testsuite_GetIntConst("GIL_ORCDOG", 0);
    var string name; name = G1CP_Testsuite_GetStringConst("TXT_GUILDS", GIL_ORCDOG);
    G1CP_Testsuite_CheckPassed();

    if (Hlp_StrCmp(name, "Orkhund")) {
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetailSSS("Name incorrect: name = '", name, "'");
        return FALSE;
    };
};
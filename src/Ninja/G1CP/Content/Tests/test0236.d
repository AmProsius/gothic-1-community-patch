/*
 * #236 Spelling - Guild: "Orkhund" (DE)
 */
func int G1CP_Test_0236() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    const string GUILD_NAME = "GIL_ORCDOG";
    const int GIL_ORCDOG = 0; GIL_ORCDOG = G1CP_Testsuite_GetIntConst(GUILD_NAME, 0);
    var string expected; expected = "Orkhund";
    var string name; name = G1CP_Testsuite_GetStringConst("TXT_GUILDS", GIL_ORCDOG);
    G1CP_Testsuite_CheckPassed();

    if (!Hlp_StrCmp(name, expected)) {
        G1CP_TestsuiteErrorDetailSSSSS("String incorrect: TXT_GUILDS[", GUILD_NAME, "] = '", name, "'");
        return FALSE;
    };

    return TRUE;
};

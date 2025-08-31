/*
 * #236 Spelling - Guild: "Orkhund" (DE)
 */
func void G1CP_Test_0236() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    const string GUILD_NAME = "GIL_ORCDOG";
    const int GIL_ORCDOG = 0; GIL_ORCDOG = G1CP_Testsuite_GetIntConst(GUILD_NAME);
    var string strName; strName = G1CP_ComposeArraySymbolName("TXT_GUILDS", GIL_ORCDOG);
    var string name; name = G1CP_Testsuite_GetStringConst(strName);
    G1CP_Testsuite_AssertS(name, "Orkhund");
};

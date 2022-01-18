/*
 * Function for one-time initial actions before anything else
 */
func void G1CP_InitPre() {
    // Version check
    if (NINJA_VERSION < G1CP_NinjaMinVer) {
        var string msg;
        msg = ConcatStrings(ConcatStrings("The G1CP requires at least Ninja ", G1CP_NinjaMinVerStr), " or higher.");
        MEM_SendToSpy(zERR_TYPE_FATAL, msg);
    };

    // Obtain script language
    G1CP_Lang = G1CP_GuessLocalization();

    // Get some annoying prints out of the way
    free(create(zCArray@), zCArray@);

    // Find start and end of the symbols that are introduced by G1CP
    G1CP_SymbStart = Ninja_Symbols_Start_G1CP;
    G1CP_SymbEnd = MEM_GetSymbolIndex("Ninja_Symbols_End_G1CP");
    // LeGo might be squeezed in
    var int LeGoEnd; LeGoEnd = MEM_GetSymbolIndex("LEGO_MERGEFLAGS");
    if (LeGoEnd > Ninja_Symbols_Start_G1CP) {
        G1CP_SymbStart = LeGoEnd;
    };
};

/*
 * Release stub. This function will be replaced if the test suite is present
 */
func int G1CP_Testsuite() {
    MEM_Info("Test suite disabled in release version");
    return FALSE;
};

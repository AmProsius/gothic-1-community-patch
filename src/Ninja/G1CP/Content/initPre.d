/*
 * Function for one-time initial actions before anything else
 */
func void G1CP_InitPre() {
    // Version check
    if (NINJA_VERSION < 2308) {
        MEM_SendToSpy(zERR_TYPE_FATAL, "G1CP requires at least Ninja 2.3.08 or higher");
    };

    // Obtain script language
    G1CP_Lang = G1CP_GuessLocalization();

    // Get some annoying prints out of the way
    free(create(zCArray@), zCArray@);

    // Find start and end of the symbols that are introduced by G1CP
    G1CP_SymbStart = Ninja_Symbols_Start_G1CP;
    G1CP_SymbEnd = MEM_FindParserSymbol("Ninja_Symbols_End_G1CP");
    // LeGo might be squeezed in
    var int LeGoEnd; LeGoEnd = MEM_FindParserSymbol("LEGO_MERGEFLAGS");
    if (LeGoEnd > Ninja_Symbols_Start_G1CP) {
        G1CP_SymbStart = LeGoEnd;
    };
};

/*
 * Function for one-time initial actions before anything else
 */
func void Ninja_G1CP_InitOnce() {
    // Version check
    if (NINJA_VERSION < 2308) {
        MEM_SendToSpy(zERR_TYPE_FATAL, "G1CP requires at least Ninja 2.3.08 or higher");
    };

    // Obtain script language
    Ninja_G1CP_Lang = Ninja_G1CP_GuessLocalization();

    // Get some annoying prints out of the way
    MEM_Free(create(zCArray@));

    // Find start and end of the symbols that are introduced by G1CP
    Ninja_G1CP_SymbStart = Ninja_Symbols_Start_G1CP;
    Ninja_G1CP_SymbEnd = MEM_FindParserSymbol("Ninja_Symbols_End_G1CP");
    // LeGo might be squeezed in
    var int LeGoEnd; LeGoEnd = MEM_FindParserSymbol("LEGO_MERGEFLAGS");
    if (LeGoEnd > Ninja_Symbols_Start_G1CP) {
        Ninja_G1CP_SymbStart = LeGoEnd;
    };
};

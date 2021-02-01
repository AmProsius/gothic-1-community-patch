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
};

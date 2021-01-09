/*
 * Menu initialization function called by Ninja every time a menu is opened
 */
func void Ninja_G1CP_Menu(var int menuPtr) {
    MEM_InitAll();

    // Initialize one-time-per-session fixes
    const int once = 0;
    if (!once) {

        once = 1;
    };
};


/*
 * Initialization function called by Ninja after "Init_Global" (G2) / "Init_<Levelname>" (G1)
 */
func void Ninja_G1CP_Init() {
    // Wrapper for "LeGo_Init" to ensure correct LeGo initialization without breaking the mod
    // LeGo_MergeFlags( /* DESIRED LEGO PACKAGES */ ); // Not in use yet

};

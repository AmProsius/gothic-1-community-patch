/*
 * Menu initialization function called by Ninja every time a menu is opened
 */
func void Ninja_G1CP_Menu(var int menuPtr) {
    MEM_InitAll();


    // WRITE YOUR INITIALIZATIONS HERE

};


/*
 * Initialization function called by Ninja after "Init_Global" (G2) / "Init_<Levelname>" (G1)
 */
func void Ninja_G1CP_Init() {
    // Wrapper for "LeGo_Init" to ensure correct LeGo initialization without breaking the mod
    LeGo_MergeFlags( /* DESIRED LEGO PACKAGES */ );


    // WRITE YOUR INITIALIZATIONS HERE

};

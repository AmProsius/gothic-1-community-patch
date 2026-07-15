/*
 * Open a menu screen that blocks the game to present multi-line text information.
 * The argument can be a static string array to add several lines. Pass an empty string for title to skip it.
 */
func void G1CP_Testsuite_OpenInfoScreen(var string title, var string text) {
    // The menu is reused so only created once and therefore no recyclable calls necessary
    if (!statusScreenPtr) {
        // Menu constants
        const int MENU_OVERTOP = 1;
        const int MENU_EXCLUSIVE = 2;
        const int MENU_DONTSCALE_DIM = 8;
        const int MENU_ALIGN_CENTER = 32;
        const int IT_CHROMAKEYED = 1;
        const int IT_TRANSPARENT = 2;
        const int IT_MULTILINE = 2048;
        const int MENU_ITEM_TEXT = 1;
        const string BACK_PIC = "LOG_PAPER.TGA";
        const string FONT_NAME = "FONT_OLD_10_WHITE.TGA";

        // Pointers
        const int statusScreenPtr = 0;
        const int statusMenuPtr = 0;
        const int menuItemPtr = 0;
        const int textPtr = 0;

        // Sizes and offsets
        const int sizeof_oCStatusScreen = 8;
        const int sizeof_oCMenu_Status = 3304; //0xCE8
        const int sizeof_zCMenuItem = 980; //0x3D4
        const int oCStatusScreen_m_pStatusMenu_offset = 4;

        // Addresses
        const int oCStatusScreen__oCStatusScreen = 4682624; //0x477380
        const int oCStatusScreen_vftable = 8200304; //0x7D2070
        const int oCMenu_Status_vftable = 8200228; //0x7D2024
        const int zCMenu__zCMenu = 5036112; //0x4CD850
        const int zCMenuItem__zCMenuItem = 5054816; //0x4D2160

        // Create oCStatusScreen
        statusScreenPtr = MEM_Alloc(sizeof_oCStatusScreen);
        MEM_WriteInt(statusScreenPtr, oCStatusScreen_vftable);

        // Create menu
        statusMenuPtr = MEM_Alloc(sizeof_oCMenu_Status);
        CALL__thiscall(statusMenuPtr, zCMenu__zCMenu);
        MEM_WriteInt(statusMenuPtr, oCMenu_Status_vftable);
        MEM_WriteInt(statusScreenPtr + oCStatusScreen_m_pStatusMenu_offset, statusMenuPtr);
        var zCMenu statusMenu; statusMenu = _^(statusMenuPtr);
        statusMenu.backPic = BACK_PIC;
	    statusMenu.defaultInGame = -1;
        statusMenu.flags = MENU_OVERTOP | MENU_EXCLUSIVE | MENU_DONTSCALE_DIM | MENU_ALIGN_CENTER;

        // Create menu item and text
        menuItemPtr = MEM_Alloc(sizeof_zCMenuItem);
        textPtr = MEM_Alloc(sizeof_zString);
        CALL__thiscall(menuItemPtr, zCMenuItem__zCMenuItem);
        MEM_ArrayPush(_@(statusMenu.m_listItems_array), menuItemPtr);
        var zCMenuItem menuItem; menuItem = _^(menuItemPtr);
        menuItem.m_parType = MENU_ITEM_TEXT;
        menuItem.m_parFontName = FONT_NAME;
        menuItem.m_parDimx = PS_VMax;
	    menuItem.m_parDimy = PS_VMax;
        menuItem.m_parFrameSizeX = 800;
	    menuItem.m_parFrameSizeY = 1000;
        menuItem.m_parItemFlags = IT_CHROMAKEYED | IT_TRANSPARENT | IT_MULTILINE;
        menuItem.m_listLines_array = textPtr;
        menuItem.m_listLines_numAlloc = 1;
        menuItem.m_listLines_numInArray = 1;
    };

    // If text is string array, determine number of lines
    var int num_lines;
    var int symbId; symbId = G1CP_GetStringSourceId(text);
    if (symbId != -1) {
        var zCPar_Symbol symb; symb = _^(MEM_GetSymbolByIndex(symbId));
        num_lines = symb.bitfield & zCPar_Symbol_bitfield_ele;
    } else {
        // Allow to pass constructed string, e.g. with ConcatStrings
        num_lines = 1;
    };

    // Format and write multi-line text
    const string newline = "\n";
    if (SB_New()) {
        // Optional title
        if (!Hlp_StrCmp(title, "")) {
            SB(title);
            SB(newline);
            SB(newline);
        };
        // First (or only) line
        SB(text);
        SB(newline);
        // Optional following lines from string array
        repeat(line, num_lines-1); var int line;
            SB(G1CP_GetStringI(symbId, line+1, ""));
            SB(newline);
        end;
        MEM_WriteString(textPtr, SB_ToString());
        SB_Destroy();
    };

    // Open the screen
    if (CALL_Begin(call)) {
        const int call = 0;
        const int oCStatusScreen__Show = 4683824; //0x477830
        const int zCConsole__Hide = 7185712; //0x6DA530
        CALL__thiscall(_@(zcon_address), zCConsole__Hide);
        CALL__thiscall(_@(statusScreenPtr), oCStatusScreen__Show);
        call = CALL_End();
    };
};

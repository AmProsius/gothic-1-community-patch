/*
 * World names
 */
const string G1CP_WLD_MAIN = "WORLD";
const string G1CP_WLD_OLDMINE = "OLDMINE";
const string G1CP_WLD_FREEMINE = "FREEMINE";
const string G1CP_WLD_ORCTEMPEL = "ORCTEMPEL";
const string G1CP_WLD_ORCGRAVEYARD = "ORCGRAVEYARD";

/*
 * Check if running automatic test
 */
func void G1CP_Testsuite_CheckManual(var string instructions) {
    if (!G1CP_TestsuiteAllowManual) {
        G1CP_Testsuite_ForceTestToReturn();
        return;
    };

    // Obtain fix ID and short name
    var int fixId; fixId = G1CP_Testsuite_FindCallerTestId();
    var string fixName; fixName = G1CP_GetFixShortName(fixId);
    if (SB_New()) {
        SB("#"); SBi(fixId); SB(" "); SB(fixName);
        var string title; title = SB_ToString();
        SB_Destroy();
    };

    G1CP_Testsuite_OpenInfoScreen(title, instructions);

    // Reset the time if nighttime for better visibility
    var int time; time = G1CP_GetWorldTime();
    if (time < 800) || (1880 < time) {
        Wld_SetTime(9, 0);
    };

    // Reset attitudes to initial state
    Wld_ExchangeGuildAttitudes("GIL_ATTITUDES");
    G1CP_SetIntVarI(MEM_GetSymbolIndex("Kapitel"), 0, 1); // Set the chapter to reset attitudes on any level change
};

/*
 * Check localization of the game and abort if it does not match
 */
 func void G1CP_Testsuite_CheckLang(var int lang) {
    if (!(G1CP_Lang & lang)) {
        // Get language name by given parameter
        var string langNames; langNames = "";
        if (lang & G1CP_Lang_EN) {
            langNames = ConcatStrings(langNames, " English");
        };
        if (lang & G1CP_Lang_DE) {
            langNames = ConcatStrings(langNames, " German");
        };
        if (lang & G1CP_Lang_PL) {
            langNames = ConcatStrings(langNames, " Polish");
        };
        if (lang & G1CP_Lang_RU) {
            langNames = ConcatStrings(langNames, " Russian");
        };
        G1CP_TestsuiteErrorDetail3("Test applicable for", langNames, " localization only.");
        G1CP_Testsuite_SkipTest();
    };
 };

/*
 * Check and ensure that the test takes place in the correct level
 */
func void G1CP_Testsuite_CheckWorld(var string world) {
    if (!Hlp_StrCmp(MEM_World.worldName, world)) {
        var string zen; zen = ConcatStrings(world, ".ZEN");

        const int DIR_WORLD                    = 13; //0xD
        const int zCOption__ChangeDir          = 4586240; //0x45FB00
        const int zfactory                     = 8863624; //0x873F88
        const int zCObjectFactory__CreateZFile = 5815648; //0x58BD60
        const int zFILE_VDFS__Exists           = 4476816; //0x444F90
        const int zFILE_VDFS__delete           = 4476272; //0x444D70
        const int oCGame__ChangeLevel          = 6540640; //0x63CD60

        if (CALL_Begin(call)) {
            const int call = 0;
            const int filePtr = 0;
            const int fileExists = 0;
            const int wpStrPtr = 0; wpStrPtr = _@s("");
            const int wldStrPtr = 0; wldStrPtr = _@s(zen);

            // Check if world file exists to avoid crash and instead fail the test with a descriptive message
            CALL_IntParam(_@(DIR_WORLD));
            CALL__thiscall(zoptions_Pointer_Address, zCOption__ChangeDir);
            CALL_PtrParam(_@(wldStrPtr));
            CALL_PutRetValTo(_@(filePtr));
            CALL__thiscall(zfactory, zCObjectFactory__CreateZFile);
            CALL_PutRetValTo(_@(fileExists));
            CALL__thiscall(_@(filePtr), zFILE_VDFS__Exists);
            ASM_1(ASMINT_OP_pushEAX); // Keep return value
            CALL_IntParam(_@(TRUE));
            CALL_PutRetValTo(_@(filePtr)); // Dump eax
            CALL__thiscall(_@(filePtr), zFILE_VDFS__delete);

            // Skip over loading if file does not exist
            ASM_1(ASMINT_OP_popEAX);
            ASM_2(49285);            // test   eax, eax
            ASM_1(117); ASM_1(1);    // jnz    .load
            ASM_1(ASMINT_OP_retn);

            // .load:
            CALL_PtrParam(_@(wpStrPtr));
            CALL_PtrParam(_@(wldStrPtr));
            CALL__thiscall(MEMINT_oGame_Pointer_Address, oCGame__ChangeLevel);
            call = CALL_End();
        };

        if (!fileExists) {
            G1CP_TestsuiteErrorDetail3("World '", world, "' not found.");
            G1CP_Testsuite_FailTest();
            return;
        };
    } else {
        // If already in the world, call the init function and reset the time to instantly update NPC attitudes
        MEM_CallByString(ConcatStrings("INIT_", world));
        Wld_SetTime(9, 0);
    };

    // Clear instances to avoid crash on invalid addresses from the previous world/state
    HookOverwriteInstances = TRUE;
    self = MEM_NullToInst();
    other = MEM_NullToInst();
    item = MEM_NullToInst();
    victim = MEM_NullToInst();
};

/*
 * Check if integer variable exists
 */
func int G1CP_Testsuite_CheckIntVar(var string name) {
    if (!G1CP_IsIntVar(name)) {
        G1CP_TestsuiteErrorDetail3("Integer variable '", name, "' not found.");
        G1CP_Testsuite_FailTest();
        return -1;
    };
    return G1CP_GetIntVarId(name); // Needed to handle array name decomposition "name[x]"
};

/*
 * Check if integer constant exists
 */
func int G1CP_Testsuite_CheckIntConst(var string name) {
    if (!G1CP_IsIntConst(name)) {
        G1CP_TestsuiteErrorDetail3("Integer constant '", name, "' not found.");
        G1CP_Testsuite_FailTest();
        return -1;
    };
    return G1CP_GetIntConstId(name);
};

/*
 * Check if string variable exists
 */
func int G1CP_Testsuite_CheckStringVar(var string name) {
    if (!G1CP_IsStringVar(name)) {
        G1CP_TestsuiteErrorDetail3("String variable '", name, "' not found.");
        G1CP_Testsuite_FailTest();
        return -1;
    };
    return G1CP_GetStringVarId(name);
};

/*
 * Check if string constant exists
 */
func int G1CP_Testsuite_CheckStringConst(var string name) {
    if (!G1CP_IsStringConst(name)) {
        G1CP_TestsuiteErrorDetail3("String constant '", name, "' not found.");
        G1CP_Testsuite_FailTest();
        return -1;
    };
    return G1CP_GetStringConstId(name);
};

/*
 * Check if info instance exists
 */
func int G1CP_Testsuite_CheckInfo(var string name) {
    if (!G1CP_IsInfoInst(name)) {
        G1CP_TestsuiteErrorDetail3("Info instance '", name, "' not found.");
        G1CP_Testsuite_FailTest();
        return -1;
    };
    return MEM_GetSymbolIndex(name);
};

/*
 * Check if item instance exists
 */
func int G1CP_Testsuite_CheckItem(var string name) {
    if (!G1CP_IsItemInst(name)) {
        G1CP_TestsuiteErrorDetail3("Item instance '", name, "' not found.");
        G1CP_Testsuite_FailTest();
        return -1;
    };
    return MEM_GetSymbolIndex(name);
};

/*
 * Check if NPC instance exists
 */
func int G1CP_Testsuite_CheckNpc(var string name) {
    if (!G1CP_IsNpcInst(name)) {
        G1CP_TestsuiteErrorDetail3("NPC instance '", name, "' not found.");
        G1CP_Testsuite_FailTest();
        return -1;
    };
    return MEM_GetSymbolIndex(name);
};

/*
 * Check if function exists
 */
func int G1CP_Testsuite_CheckFunc(var string name, var string signature, var string funcType) {
    if (Hlp_StrCmp(funcType, "")) {
        funcType = "Function";
    };
    if (!G1CP_IsFunc(name, signature)) {
        if (SB_New()) {
            SB(funcType); SB(" '"); SB(name); SB("' not found.");
            G1CP_TestsuiteErrorDetail(SB_ToString());
            SB_Destroy();
        };
        G1CP_Testsuite_FailTest();
        return -1;
    };
    return MEM_GetSymbolIndex(name);
};

/*
 * Check if dialog function exists
 */
func int G1CP_Testsuite_CheckDialogFunc(var string name) {
    return G1CP_Testsuite_CheckFunc(name, "void|none", "Dialog function");
};

/*
 * Check if dialog condition function exists
 */
func int G1CP_Testsuite_CheckDialogConditionFunc(var string name) {
    return G1CP_Testsuite_CheckFunc(name, "int|none", "Dialog condition");
};

/*
 * Check if daily routine function exists
 */
func int G1CP_Testsuite_CheckRoutineFunc(var string name) {
    return G1CP_Testsuite_CheckFunc(name, "void|none", "Daily routine");
};

/*
 * Check if AI state start function exists
 */
func int G1CP_Testsuite_CheckAiStateStartFunc(var string name) {
    return G1CP_Testsuite_CheckFunc(name, "void|none", "AI state");
};

/*
 * Check if AI state loop function exists
 */
func int G1CP_Testsuite_CheckAiStateLoopFunc(var string name) {
    return G1CP_Testsuite_CheckFunc(name, "|none", "AI state loop"); // Returns either int or void
};

/*
 * Check if AI state end function exists
 */
func int G1CP_Testsuite_CheckAiStateEndFunc(var string name) {
    return G1CP_Testsuite_CheckFunc(name, "void|none", "AI state end");
};

/*
 * Check if AI state (all functions) exists
 */
func void G1CP_Testsuite_CheckAiState(var string name) {
    var int i;
    i = G1CP_Testsuite_CheckAiStateStartFunc(name);
    i = G1CP_Testsuite_CheckAiStateLoopFunc(ConcatStrings(name, "_Loop"));
    i = G1CP_Testsuite_CheckAiStateEndFunc(ConcatStrings(name, "_End"));
};

/*
 * Check if an output unit exists
 */
func int G1CP_Testsuite_CheckOu(var string name) {
    var int ptr; ptr = G1CP_GetOu(name);
    if (!ptr) {
        G1CP_TestsuiteErrorDetail3("Output unit '", name, "' not found.");
        G1CP_Testsuite_FailTest();
        return 0;
    };
    return ptr;
};

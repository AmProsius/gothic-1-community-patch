/*
 * Keep records of active, inactive and disabled fixes in a lookup table
 */


/* Hashtable containing which fix worked and which failed */
const int Ninja_G1CP_FixTable = 0;


/*
 * Get status of a fix
 * This function returns one of four states
 *   Ninja_G1CP_FIX_NOT_FOUND
 *   Ninja_G1CP_FIX_DISABLED
 *   Ninja_G1CP_FIX_NOT_APPLIED
 *   Ninja_G1CP_FIX_APPLIED
 */
func int Ninja_G1CP_FixStatus(var int id) {
    if (Ninja_G1CP_FixTable) {
        if (_HT_Has(Ninja_G1CP_FixTable, id)) {
            return _HT_Get(Ninja_G1CP_FixTable, id);
        };
    };
    return Ninja_G1CP_FIX_NOT_FOUND;
};


/*
 * Check if fix is currently applied
 */
func int Ninja_G1CP_IsFixApplied(var int id) {
    return (Ninja_G1CP_FixStatus(id) == Ninja_G1CP_FIX_APPLIED);
};


/*
 * Find the short name (i.e. function name suffix) of a fix ID
 */
func string Ninja_G1CP_GetFixShortName(var int id) {
    if (id <= 0) {
        return "";
    };

    // Build function name prefix
    var string prefix; prefix = "NINJA_G1CP_";
    prefix = ConcatStrings(prefix, Ninja_G1CP_LFill(IntToString(id), "0", 3));
    prefix = ConcatStrings(prefix, "_");

    // Get symbol indices of the called functions within the initialization functions
    const int funcCalls = -1;
    if (funcCalls == -1) {
        funcCalls = MEM_ArrayCreate();
        var int dump; dump = MEM_ArrayCreate();
        MEMINT_TokenizeFunction(MEM_GetFuncID(Ninja_G1CP_Menu), dump, funcCalls, dump);
        MEMINT_TokenizeFunction(MEM_GetFuncID(Ninja_G1CP_GamesaveFixes_Apply), dump, funcCalls, dump);
        MEM_ArrayFree(dump);
    };

    // Iterate over all G1CP symbols
    repeat(i, Ninja_G1CP_SymbEnd); var int i; if (!i) { i = Ninja_G1CP_SymbStart; }; // From SymbStart to SymbEnd

        // Compare symbol name
        var zCPar_Symbol symb; symb = _^(MEM_GetSymbolByIndex(i));
        if (STR_StartsWith(symb.name, prefix))
        && ((symb.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_FUNC) {

            // Confirm that the function is called from one of the initialization functions
            if (MEM_ArrayIndexOf(funcCalls, symb.content) != -1) {
                return STR_SubStr(symb.name, 15, STR_Len(symb.name)-15);
            };
        };
    end;

    // Not found
    return "";
};


/*
 * Initialization function for console commands
 */
func int Ninja_G1CP_FixStatusInit() {
    CC_Register(Ninja_G1CP_FixAppliedAll, "fix status all", "Check which G1CP fixes are currently applied");
    CC_Register(Ninja_G1CP_FixAppliedCmd, "fix status ", "Check if a G1CP fix is currently applied");
    CC_Register(Ninja_G1CP_FixNameAll, "fix name all", "List the short names of all G1CP fixes in the zSpy");
    CC_Register(Ninja_G1CP_FixNameCmd, "fix name ", "Show the short name of a G1CP fix");

    // Confirm registration
    return ((CC_Active(Ninja_G1CP_FixAppliedAll))
         && (CC_Active(Ninja_G1CP_FixAppliedCmd))
         && (CC_Active(Ninja_G1CP_FixNameAll))
         && (CC_Active(Ninja_G1CP_FixNameCmd)));
};


/*
 * Console command function to list all fixes by their status
 */
const int Ninja_G1CP_FixAppliedAll_Active = 0;
const int Ninja_G1CP_FixAppliedAll_NonAct = 0;
const int Ninja_G1CP_FixAppliedAll_Disbld = 0;
func string Ninja_G1CP_FixAppliedAll(var string _) {
    if (!Ninja_G1CP_FixTable) {
        return "Error: Fix table not found";
    };
    if (!MEM_ArraySize(Ninja_G1CP_FixTable)) {
        return "Error: No fixes found";
    };

    // Sort and order all fixes
    if (!Ninja_G1CP_FixAppliedAll_Active) {
        Ninja_G1CP_FixAppliedAll_Active = MEM_ArrayCreate();
        Ninja_G1CP_FixAppliedAll_NonAct = MEM_ArrayCreate();
        Ninja_G1CP_FixAppliedAll_Disbld = MEM_ArrayCreate();
    } else {
        MEM_ArrayClear(Ninja_G1CP_FixAppliedAll_Active);
        MEM_ArrayClear(Ninja_G1CP_FixAppliedAll_NonAct);
        MEM_ArrayClear(Ninja_G1CP_FixAppliedAll_Disbld);
    };
    _HT_ForEach(Ninja_G1CP_FixTable, Ninja_G1CP_FixAppliedAll_Sub);
    MEM_ArraySort(Ninja_G1CP_FixAppliedAll_Active);
    MEM_ArraySort(Ninja_G1CP_FixAppliedAll_NonAct);
    MEM_ArraySort(Ninja_G1CP_FixAppliedAll_Disbld);

    var string ret;
    if (SB_New()) {
        SB("Active:     ");
        if (MEM_ArraySize(Ninja_G1CP_FixAppliedAll_Active)) {
            repeat(i, MEM_ArraySize(Ninja_G1CP_FixAppliedAll_Active)); var int i;
                SBi(MEM_ArrayRead(Ninja_G1CP_FixAppliedAll_Active, i));
                SB(" ");
            end;
        } else {
            SB("None");
        };
        SBc(10);
        SBc(13);
        SB("Inactive:   ");
        if (MEM_ArraySize(Ninja_G1CP_FixAppliedAll_NonAct)) {
            repeat(i, MEM_ArraySize(Ninja_G1CP_FixAppliedAll_NonAct)); var int i;
                SBi(MEM_ArrayRead(Ninja_G1CP_FixAppliedAll_NonAct, i));
                SB(" ");
            end;
        } else {
            SB("None");
        };
        SBc(10);
        SBc(13);
        SB("Disabled:   ");
        if (MEM_ArraySize(Ninja_G1CP_FixAppliedAll_Disbld)) {
            repeat(i, MEM_ArraySize(Ninja_G1CP_FixAppliedAll_Disbld)); var int i;
                SBi(MEM_ArrayRead(Ninja_G1CP_FixAppliedAll_Disbld, i));
                SB(" ");
            end;
        } else {
            SB("None");
        };
        ret = SB_ToString();
        SB_Destroy();
    };

    return ret;
};
func void Ninja_G1CP_FixAppliedAll_Sub(var int key, var int val) {
    if (val == Ninja_G1CP_FIX_DISABLED) {
        MEM_ArrayInsert(Ninja_G1CP_FixAppliedAll_Disbld, key);
    } else if (val == Ninja_G1CP_FIX_NOT_APPLIED) {
        MEM_ArrayInsert(Ninja_G1CP_FixAppliedAll_NonAct, key);
    } else if (val == Ninja_G1CP_FIX_APPLIED) {
        MEM_ArrayInsert(Ninja_G1CP_FixAppliedAll_Active, key);
    };
};


/*
 * Console command function to show the status of a specific fix
 */
func string Ninja_G1CP_FixAppliedCmd(var string command) {
    var int id; id = STR_ToInt(command);
    var int state; state = Ninja_G1CP_FixStatus(id);
    var string msg; msg = ConcatStrings("Fix #", IntToString(id));
    if (state == Ninja_G1CP_FIX_DISABLED) {
        return ConcatStrings(msg, " is disabled");
    } else if (state == Ninja_G1CP_FIX_NOT_APPLIED) {
        return ConcatStrings(msg, " is inactive");
    } else if (state == Ninja_G1CP_FIX_APPLIED) {
        return ConcatStrings(msg, " is active");
    } else {
        return "";
    };
};


/*
 * Console command function to list all fixes with their short name
 */
const int Ninja_G1CP_FixNameAll_Sorted = 0;
func string Ninja_G1CP_FixNameAll(var string _) {
    if (!Ninja_G1CP_FixTable) {
        return "Error: Fix table not found";
    };
    if (!MEM_ArraySize(Ninja_G1CP_FixTable)) {
        return "Error: No fixes found";
    };

    // Sort and order all fixes
    if (!Ninja_G1CP_FixNameAll_Sorted) {
        Ninja_G1CP_FixNameAll_Sorted = MEM_ArrayCreate();
    } else {
        MEM_ArrayClear(Ninja_G1CP_FixNameAll_Sorted);
    };
    _HT_ForEach(Ninja_G1CP_FixTable, Ninja_G1CP_FixNameAll_Sub);
    MEM_ArraySort(Ninja_G1CP_FixNameAll_Sorted);

    var int so; so = SB_Get();
    var int s; s = SB_New();

    MEM_Info("");
    MEM_Info("All G1CP fixes with short names");
    Ninja_G1CP_zSpyIndent("G1CP-FixNameAll", 1);

    repeat(i, MEM_ArraySize(Ninja_G1CP_FixNameAll_Sorted)); var int i;
        var int id; id = MEM_ArrayRead(Ninja_G1CP_FixNameAll_Sorted, i);
        SB(Ninja_G1CP_LFill(ConcatStrings("#", IntToString(id)), " ", 4));
        SB(" ");
        SB(Ninja_G1CP_GetFixShortName(id));
        SB(Ninja_G1CP_LFill("", " ", 42-SB_Length()));

        var int type;
        var int status; status = Ninja_G1CP_FixStatus(id);
        if (status == Ninja_G1CP_FIX_APPLIED) {
            SB("         APPLIED");
            type = zERR_TYPE_WARN;
        } else if (status == Ninja_G1CP_FIX_NOT_APPLIED) {
            SB("     NOT APPLIED");
            type = zERR_TYPE_FAULT;
        } else {
            if (status == Ninja_G1CP_FIX_DISABLED) {
                SB("        DISABLED");
            };
            type = zERR_TYPE_INFO;
        };

        MEM_SendToSpy(type, SB_ToString());
        SB_Clear();
    end;

    Ninja_G1CP_zSpyIndent("G1CP-FixNameAll", -1);
    MEM_Info("");

    SB_Destroy();
    SB_Use(so);

    return "See zSpy for details.";
};
func void Ninja_G1CP_FixNameAll_Sub(var int key, var int val) {
    MEM_ArrayInsert(Ninja_G1CP_FixNameAll_Sorted, key);
};


/*
 * Console command function to show the short name of a specific fix
 */
func string Ninja_G1CP_FixNameCmd(var string command) {
    var int id; id = STR_ToInt(command);
    return Ninja_G1CP_GetFixShortName(id);
};

/*
 * Keep records of active, inactive and disabled fixes in a lookup table
 */


/* Hashtable containing which fix worked and which failed */
const int G1CP_FixTable = 0;


/*
 * Get status of a fix
 * This function returns one of four states
 *   G1CP_FIX_NOT_FOUND
 *   G1CP_FIX_DISABLED
 *   G1CP_FIX_NOT_APPLIED
 *   G1CP_FIX_APPLIED
 */
func int G1CP_FixStatus(var int id) {
    if (G1CP_FixTable) {
        if (_HT_Has(G1CP_FixTable, id)) {
            return _HT_Get(G1CP_FixTable, id);
        };
    };
    return G1CP_FIX_NOT_FOUND;
};


/*
 * Check if fix is currently applied
 */
func int G1CP_IsFixApplied(var int id) {
    return (G1CP_FixStatus(id) == G1CP_FIX_APPLIED);
};


/*
 * Find the short name (i.e. function name suffix) of a fix ID
 */
func string G1CP_GetFixShortName(var int id) {
    if (id <= 0) {
        return "";
    };

    // Build function name prefix
    var string prefix; prefix = "G1CP_";
    prefix = ConcatStrings(prefix, G1CP_LFill(IntToString(id), "0", 3));
    prefix = ConcatStrings(prefix, "_");

    // Get symbol indices of the called functions within the initialization functions
    const int funcCalls = 0;
    if (!funcCalls) {
        funcCalls = MEM_ArrayCreate();
        var int dump; dump = MEM_ArrayCreate();
        MEMINT_TokenizeFunction(MEM_GetFuncID(Ninja_G1CP_Menu), dump, funcCalls, dump);
        MEMINT_TokenizeFunction(MEM_GetFuncID(G1CP_GamesaveFixes_Apply), dump, funcCalls, dump);
        MEM_ArrayFree(dump);
    };

    // Iterate over all G1CP symbols
    repeat(i, G1CP_SymbEnd); var int i; if (!i) { i = G1CP_SymbStart; }; // From SymbStart to SymbEnd

        // Compare symbol name
        var zCPar_Symbol symb; symb = _^(MEM_GetSymbolByIndex(i));
        if (STR_StartsWith(symb.name, prefix))
        && ((symb.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_FUNC) {

            // Confirm that the function is called from one of the initialization functions
            if (MEM_ArrayIndexOf(funcCalls, symb.content) != -1) {
                return STR_SubStr(symb.name, 9, STR_Len(symb.name)-9);
            };
        };
    end;

    // Not found
    return "";
};


/*
 * Initialization function for console commands
 */
func int G1CP_FixStatusInit() {
    CC_Register(G1CP_FixAppliedAll, "fix status all", "Check which G1CP fixes are currently applied");
    CC_Register(G1CP_FixAppliedCmd, "fix status ", "Check if a G1CP fix is currently applied");
    CC_Register(G1CP_FixNameAll, "fix name all", "List the short names of all G1CP fixes in the zSpy");
    CC_Register(G1CP_FixNameCmd, "fix name ", "Show the short name of a G1CP fix");

    // Confirm registration
    return ((CC_Active(G1CP_FixAppliedAll))
         && (CC_Active(G1CP_FixAppliedCmd))
         && (CC_Active(G1CP_FixNameAll))
         && (CC_Active(G1CP_FixNameCmd)));
};


/*
 * Console command function to list all fixes by their status
 */
const int G1CP_FixAppliedAll_Active = 0;
const int G1CP_FixAppliedAll_NonAct = 0;
const int G1CP_FixAppliedAll_Disbld = 0;
func string G1CP_FixAppliedAll(var string _) {
    if (!G1CP_FixTable) {
        return "Error: Fix table not found";
    };
    if (!MEM_ArraySize(G1CP_FixTable)) {
        return "Error: No fixes found";
    };

    // Sort and order all fixes
    if (!G1CP_FixAppliedAll_Active) {
        G1CP_FixAppliedAll_Active = MEM_ArrayCreate();
        G1CP_FixAppliedAll_NonAct = MEM_ArrayCreate();
        G1CP_FixAppliedAll_Disbld = MEM_ArrayCreate();
    } else {
        MEM_ArrayClear(G1CP_FixAppliedAll_Active);
        MEM_ArrayClear(G1CP_FixAppliedAll_NonAct);
        MEM_ArrayClear(G1CP_FixAppliedAll_Disbld);
    };
    _HT_ForEach(G1CP_FixTable, G1CP_FixAppliedAll_Sub);
    MEM_ArraySort(G1CP_FixAppliedAll_Active);
    MEM_ArraySort(G1CP_FixAppliedAll_NonAct);
    MEM_ArraySort(G1CP_FixAppliedAll_Disbld);

    var string ret;
    if (SB_New()) {
        SB("Active:     ");
        if (MEM_ArraySize(G1CP_FixAppliedAll_Active)) {
            repeat(i, MEM_ArraySize(G1CP_FixAppliedAll_Active)); var int i;
                SBi(MEM_ArrayRead(G1CP_FixAppliedAll_Active, i));
                SB(" ");
            end;
        } else {
            SB("None");
        };
        SBc(10);
        SBc(13);
        SB("Inactive:   ");
        if (MEM_ArraySize(G1CP_FixAppliedAll_NonAct)) {
            repeat(i, MEM_ArraySize(G1CP_FixAppliedAll_NonAct)); var int i;
                SBi(MEM_ArrayRead(G1CP_FixAppliedAll_NonAct, i));
                SB(" ");
            end;
        } else {
            SB("None");
        };
        SBc(10);
        SBc(13);
        SB("Disabled:   ");
        if (MEM_ArraySize(G1CP_FixAppliedAll_Disbld)) {
            repeat(i, MEM_ArraySize(G1CP_FixAppliedAll_Disbld)); var int i;
                SBi(MEM_ArrayRead(G1CP_FixAppliedAll_Disbld, i));
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
func void G1CP_FixAppliedAll_Sub(var int key, var int val) {
    if (val == G1CP_FIX_DISABLED) {
        MEM_ArrayInsert(G1CP_FixAppliedAll_Disbld, key);
    } else if (val == G1CP_FIX_NOT_APPLIED) {
        MEM_ArrayInsert(G1CP_FixAppliedAll_NonAct, key);
    } else if (val == G1CP_FIX_APPLIED) {
        MEM_ArrayInsert(G1CP_FixAppliedAll_Active, key);
    };
};


/*
 * Console command function to show the status of a specific fix
 */
func string G1CP_FixAppliedCmd(var string command) {
    var int id; id = STR_ToInt(command);
    var int state; state = G1CP_FixStatus(id);
    var string msg; msg = ConcatStrings("Fix #", IntToString(id));
    if (state == G1CP_FIX_DISABLED) {
        return ConcatStrings(msg, " is disabled");
    } else if (state == G1CP_FIX_NOT_APPLIED) {
        return ConcatStrings(msg, " is inactive");
    } else if (state == G1CP_FIX_APPLIED) {
        return ConcatStrings(msg, " is active");
    } else {
        return "";
    };
};


/*
 * Console command function to list all fixes with their short name
 */
const int G1CP_FixNameAll_Sorted = 0;
func string G1CP_FixNameAll(var string _) {
    if (!G1CP_FixTable) {
        return "Error: Fix table not found";
    };
    if (!MEM_ArraySize(G1CP_FixTable)) {
        return "Error: No fixes found";
    };

    // Sort and order all fixes
    if (!G1CP_FixNameAll_Sorted) {
        G1CP_FixNameAll_Sorted = MEM_ArrayCreate();
    } else {
        MEM_ArrayClear(G1CP_FixNameAll_Sorted);
    };
    _HT_ForEach(G1CP_FixTable, G1CP_FixNameAll_Sub);
    MEM_ArraySort(G1CP_FixNameAll_Sorted);

    var int so; so = SB_Get();
    var int s; s = SB_New();

    MEM_Info("");
    MEM_Info("All G1CP fixes listed with their short names");
    G1CP_zSpyIndent("G1CP-FixNameAll", 1);

    repeat(i, MEM_ArraySize(G1CP_FixNameAll_Sorted)); var int i;
        var int id; id = MEM_ArrayRead(G1CP_FixNameAll_Sorted, i);
        SB(G1CP_LFill(ConcatStrings("#", IntToString(id)), " ", 4));
        SB(" ");
        SB(G1CP_GetFixShortName(id));
        SB(G1CP_LFill("", " ", 42-SB_Length()));

        var int type;
        var int status; status = G1CP_FixStatus(id);
        if (status == G1CP_FIX_APPLIED) {
            SB("         APPLIED");
            type = zERR_TYPE_WARN;
        } else if (status == G1CP_FIX_NOT_APPLIED) {
            SB("     NOT APPLIED");
            type = zERR_TYPE_FAULT;
        } else {
            if (status == G1CP_FIX_DISABLED) {
                SB("        DISABLED");
            };
            type = zERR_TYPE_INFO;
        };

        MEM_SendToSpy(type, SB_ToString());
        SB_Clear();
    end;

    G1CP_zSpyIndent("G1CP-FixNameAll", -1);
    MEM_Info("");

    SB_Destroy();
    SB_Use(so);

    return "See zSpy for details.";
};
func void G1CP_FixNameAll_Sub(var int key, var int val) {
    MEM_ArrayInsert(G1CP_FixNameAll_Sorted, key);
};


/*
 * Console command function to show the short name of a specific fix
 */
func string G1CP_FixNameCmd(var string command) {
    var int id; id = STR_ToInt(command);
    return G1CP_GetFixShortName(id);
};


/*
 * Initialize the lookup table: Find all possible fixes and enter them as non-active
 */
func int G1CP_InitLookupTable() {
    // Set up the lookup table
    if (!G1CP_FixTable) {
        G1CP_FixTable = _HT_Create();
    };

    // Iterate over all patch symbols, pick out any fixes, and add them to the lookup table
    repeat(i, G1CP_SymbEnd); var int i; if (!i) { i = G1CP_SymbStart; }; // From SymbStart to SymbEnd
        var zCPar_Symbol symb; symb = _^(MEM_GetSymbolByIndex(i));
        if (STR_StartsWith(symb.name, "G1CP_"))
        && (STR_Len(symb.name) >= 8)
        && ((symb.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_FUNC) {
            var int chr; chr = STR_GetCharAt(symb.name, 5) - 48;
            if (0 <= chr) && (chr <= 9) {
                var int id; id = STR_ToInt(STR_SubStr(symb.name, 5, 3));
                if (!_HT_Has(G1CP_FixTable, id)) {
                    _HT_Insert(G1CP_FixTable, G1CP_FIX_NOT_APPLIED, id);
                };
            };
        };
    end;

    // Return success
    return (_HT_GetNumber(G1CP_FixTable) > 0);
};


/*
 * Read Gothic.ini and ModName.ini and retrieve list of disabled fixes. Only numerical characters are considered. Any
 * non-numerical character denotes a delimiter, e.g. "11,#23 4,55abc7" renders the list [11, 23, 4, 55, 7].
 *
 * File reading order:
 *
 * 1. If found, the entry is read from the mod overrides. Only if there is no override, it is read from the Gothic.ini.
 *    If neither is found, the entry is created in the Gothic.ini with the default values.
 *
 * 2. Afterwards the ModName.ini is consulted again for additional(!) fixes to disable on top of the previous list.
 *
 * In mathematical terms the final list is the union of the list from Gothic.ini (or override) and from the ModName.ini.
 *
 * This procedure allows to disable fixes globally for all mods (Gothic.ini: G1CP.disabled) and to additionally disable
 * fixes on a mod-by-mod basis (ModName.ini: G1CP.disabled). In order to remove fixes from the global list for a
 * specific mod, the override allows to fully replace the list of disabled fixes (ModName.ini OVERRIDES.G1CP.disabled).
 *
 * Example:
 * With contents of the files as shown below, the final list will look like this: [5, 6, 7, 8, 9].
 *
 * Gothic.ini
 *
 *  [G1CP]
 *  disabled = 1, 2, 3, 4
 *
 *
 * ModNmae.ini
 *
 *  [OVERRIDES]
 *  G1CP.disabled = 5, 6
 *
 *  [G1CP]
 *  disabled = 7, 8, 9
 *
 */
func int G1CP_ReadDisabledFixesIni() {
    // First load the basis of disabled fixes
    var string base;
    if (MEM_ModOptExists("OVERRIDES", "G1CP.disabled")) {
        // Priority 1: Overrides from the mod
        base = MEM_GetModOpt("OVERRIDES", "G1CP.disabled");
    } else if (MEM_GothOptExists("G1CP", "disabled")) {
        // Priority 2: Global setting
        base = MEM_GetGothOpt("G1CP", "disabled");
    } else {
        base = "55";
        MEM_SetGothOpt("G1CP", "disabled", base);
    };

    // Then add any that may be mod specific on top
    var string add;
    if (MEM_ModOptExists("G1CP", "disabled")) {
        add = MEM_GetModOpt("G1CP", "disabled");
    } else {
        add = "";
    };

    // Create lookup table
    if (!G1CP_FixTable) {
        G1CP_FixTable = _HT_Create();
    };

    // Collect the disabled fixes temporarily
    var int arr; arr = MEM_ArrayCreate();

    // Add a final delimiter
    base = ConcatStrings(base, " ");
    add = ConcatStrings(add, " ");

    // Check "base" first, then check "add"
    var zString zStr; zStr = _^(_@s(base));
    repeat(i, 2); var int i;
        var int buffer; buffer = 0;
        var int bufferLen; bufferLen = 0;

        // Iterate character-by-character
        repeat(j, zStr.len); var int j;
            var int chr; chr = MEM_ReadByte(zStr.ptr+j) - 48;
            if (chr < 0) || (9 < chr) {
                // Split at any non-numerical character
                if (bufferLen > 0) {
                    // Check if valid fix ID
                    if (!Hlp_StrCmp(G1CP_GetFixShortName(buffer), "")) {
                        MEM_ArrayInsert(arr, buffer);
                        _HT_InsertOrChange(G1CP_FixTable, G1CP_FIX_DISABLED, buffer);
                    };
                    bufferLen = 0;
                    buffer = 0;
                };
            } else {
                buffer *= 10;
                buffer += chr;
                bufferLen += 1;
            };
        end;

        // Repeat for mod additions
        zStr = _^(_@s(add));
    end;

    // Report disabled fixes (unique and ordered)
    if (MEM_ArraySize(arr)) {
        MEM_ArraySort(arr);
        MEM_ArrayUnique(arr);

        var int so; so = SB_Get();
        if (SB_New()) {
            SB("Disabled fixes");
            repeat(i, MEM_ArraySize(arr));
                SB(" #");
                SBi(MEM_ArrayRead(arr, i));
            end;
            MEM_Info(SB_ToString());
            SB_Destroy();
        };
        SB_Use(so);
    };
    MEM_ArrayFree(arr);

    // Needs return value
    return TRUE;
};

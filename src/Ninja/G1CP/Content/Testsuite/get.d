/*
 * Check if integer variable exists
 */
func int G1CP_Testsuite_GetIntVarID(var string name, var int arrIdx) {
    G1CP_Testsuite_CheckIntVar(name, arrIdx);
    return MEM_GetSymbolIndex(name);
};

/*
 * Check if integer constant exists
 */
func int G1CP_Testsuite_GetIntConstID(var string name, var int arrIdx) {
    G1CP_Testsuite_CheckIntConst(name, arrIdx);
    return MEM_GetSymbolIndex(name);
};

/*
 * Check if string variable exists
 */
func int G1CP_Testsuite_GetStringVarID(var string name, var int arrIdx) {
    G1CP_Testsuite_CheckStringVar(name, arrIdx);
    return MEM_GetSymbolIndex(name);
};

/*
 * Check if string constant exists
 */
func int G1CP_Testsuite_GetStringConstID(var string name, var int arrIdx) {
    G1CP_Testsuite_CheckStringConst(name, arrIdx);
    return MEM_GetSymbolIndex(name);
};

/*
 * Check if dialog function exists and return its symbol index
 */
func int G1CP_Testsuite_GetDialogFuncID(var string name) {
    G1CP_Testsuite_CheckDialogFunc(name);
    return MEM_GetSymbolIndex(name);
};

/*
 * Check if dialog condition function exists and return its symbol index
 */
func int G1CP_Testsuite_GetDialogConditionFuncID(var string name) {
    G1CP_Testsuite_CheckDialogConditionFunc(name);
    return MEM_GetSymbolIndex(name);
};

/*
 * Check if info instance exists and return its symbol index
 */
func int G1CP_Testsuite_GetInfoID(var string name) {
    G1CP_Testsuite_CheckInfo(name);
    return MEM_GetSymbolIndex(name);
};

/*
 * Check if item instance exists and return its symbol index
 */
func int G1CP_Testsuite_GetItemID(var string name) {
    G1CP_Testsuite_CheckItem(name);
    return MEM_GetSymbolIndex(name);
};

/*
 * Check if item instance exists, create an item of that instance and return it
 */
func MEMINT_HelperClass G1CP_Testsuite_GetItem(var string name) {
    // Check if item instance exists
    if (!G1CP_IsItemInst(name)) {
        G1CP_Testsuite_CheckItem(name); // Does not return anything
        MEM_NullToInst();
    } else {
        // Backup global symbol
        var C_Item itemBak; itemBak = MEM_CpyInst(item);

        // Create the item locally using the Item_Helper
        var C_Item itm; // Need an intermediate instance
        var int symbId; symbId = MEM_GetSymbolIndex(name);
        if (Itm_GetPtr(symbId)) {
            itm = MEM_CpyInst(item); // Item_Helper assigns global symbol
            MEMINT_StackPushInst(itm);
        } else {
            G1CP_TestsuiteErrorDetailSSS("Item of instance '", name, "' could not be created");
            G1CP_TestsuiteStatusPassed = FALSE;
            MEM_NullToInst();
        };

        // Restore global symbol
        item = MEM_CpyInst(itemBak);
    };
};

/*
 * Check if NPC exists and return it
 */
func MEMINT_HelperClass G1CP_Testsuite_GetNpc(var string name) {
    // Check if NPC instance exists
    if (!G1CP_IsNpcInst(name)) {
        G1CP_TestsuiteErrorDetailSSS("NPC instance '", name, "' not found");
        G1CP_TestsuiteStatusPassed = FALSE;
        MEM_NullToInst();
    } else {
        // Find NPC
        var int symbId; symbId = MEM_GetSymbolIndex(name);
        var C_Npc npc; npc = Hlp_GetNpc(symbId);
        if (!Hlp_IsValidNpc(npc)) {
            G1CP_TestsuiteErrorDetailSSS("NPC '", name, "' not valid");
            G1CP_TestsuiteStatusPassed = FALSE;
            MEM_NullToInst();
        } else {
            // Return NPC
            MEMINT_StackPushInst(npc);
        };
    };
};

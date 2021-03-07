/*
 * Keep records of active and inactive fixes
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
 * Initialization function for console commands
 */
func int Ninja_G1CP_AppliedInit() {
    CC_Register(Ninja_G1CP_AppliedAll, "fix status all", "Check which G1CP fixes are currently applied");
    CC_Register(Ninja_G1CP_AppliedCmd, "fix status ", "Check if a G1CP fix is currently applied");

    // Confirm registration
    return (CC_Active(Ninja_G1CP_AppliedAll)) && (CC_Active(Ninja_G1CP_AppliedCmd));
};

const int Ninja_G1CP_AppliedAll_Active = 0;
const int Ninja_G1CP_AppliedAll_NonAct = 0;
const int Ninja_G1CP_AppliedAll_Disbld = 0;
func string Ninja_G1CP_AppliedAll(var string _) {
    if (!Ninja_G1CP_FixTable) {
        return "Error: Fix table not found";
    };
    if (!MEM_ArraySize(Ninja_G1CP_FixTable)) {
        return "Error: No fixes found";
    };

    // Sort and order all fixes
    if (!Ninja_G1CP_AppliedAll_Active) {
        Ninja_G1CP_AppliedAll_Active = MEM_ArrayCreate();
        Ninja_G1CP_AppliedAll_NonAct = MEM_ArrayCreate();
        Ninja_G1CP_AppliedAll_Disbld = MEM_ArrayCreate();
    } else {
        MEM_ArrayClear(Ninja_G1CP_AppliedAll_Active);
        MEM_ArrayClear(Ninja_G1CP_AppliedAll_NonAct);
        MEM_ArrayClear(Ninja_G1CP_AppliedAll_Disbld);
    };
    _HT_ForEach(Ninja_G1CP_FixTable, Ninja_G1CP_AppliedAll_Sub);
    MEM_ArraySort(Ninja_G1CP_AppliedAll_Active);
    MEM_ArraySort(Ninja_G1CP_AppliedAll_NonAct);
    MEM_ArraySort(Ninja_G1CP_AppliedAll_Disbld);

    var string ret;
    if (SB_New()) {
        SB("Active:     ");
        if (MEM_ArraySize(Ninja_G1CP_AppliedAll_Active)) {
            SB(MEM_ArrayToString(Ninja_G1CP_AppliedAll_Active));
        } else {
            SB("None");
        };
        SBc(10);
        SBc(13);
        SBc(10);
        SBc(13);
        SB("Inactive:   ");
        if (MEM_ArraySize(Ninja_G1CP_AppliedAll_NonAct)) {
            SB(MEM_ArrayToString(Ninja_G1CP_AppliedAll_NonAct));
        } else {
            SB("None");
        };
        SBc(10);
        SBc(13);
        SBc(10);
        SBc(13);
        SB("Disabled:   ");
        if (MEM_ArraySize(Ninja_G1CP_AppliedAll_Disbld)) {
            SB(MEM_ArrayToString(Ninja_G1CP_AppliedAll_Disbld));
        } else {
            SB("None");
        };
        ret = SB_ToString();
        SB_Destroy();
    };

    return ret;
};
func void Ninja_G1CP_AppliedAll_Sub(var int key, var int val) {
    if (val == Ninja_G1CP_FIX_DISABLED) {
        MEM_ArrayInsert(Ninja_G1CP_AppliedAll_Disbld, key);
    } else if (val == Ninja_G1CP_FIX_NOT_APPLIED) {
        MEM_ArrayInsert(Ninja_G1CP_AppliedAll_NonAct, key);
    } else if (val == Ninja_G1CP_FIX_APPLIED) {
        MEM_ArrayInsert(Ninja_G1CP_AppliedAll_Active, key);
    };
};

func string Ninja_G1CP_AppliedCmd(var string command) {
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

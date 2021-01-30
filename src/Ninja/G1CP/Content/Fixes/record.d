/*
 * Keep records of active and inactive fixes
 */

/* Hashtable containing which fix worked and which failed */
const int Ninja_G1CP_FixTable = 0;

/*
 * Check if fix was applied (or is currently applied)
 */
func int Ninja_G1CP_IsFixApplied(var int id) {
    if (!Ninja_G1CP_FixTable) {
        return FALSE;
    };
    if (_HT_Has(Ninja_G1CP_FixTable, id)) {
        return _HT_Get(Ninja_G1CP_FixTable, id);
    };
    return -1;
};

/*
 * Initialization function for console commands
 */
func void Ninja_G1CP_AppliedInit() {
    CC_Register(Ninja_G1CP_AppliedAll, "fix status all", "Check which G1CP fixes are currently applied");
    CC_Register(Ninja_G1CP_AppliedCmd, "fix status ", "Check if a G1CP fix is currently applied");
};

const int Ninja_G1CP_AppliedAll_Active = 0;
const int Ninja_G1CP_AppliedAll_NonAct = 0;
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
    } else {
        MEM_ArrayClear(Ninja_G1CP_AppliedAll_Active);
        MEM_ArrayClear(Ninja_G1CP_AppliedAll_NonAct);
    };
    _HT_ForEach(Ninja_G1CP_FixTable, Ninja_G1CP_AppliedAll_Sub);
    MEM_ArraySort(Ninja_G1CP_AppliedAll_Active);
    MEM_ArraySort(Ninja_G1CP_AppliedAll_NonAct);

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
        ret = SB_ToString();
        SB_Destroy();
    };

    return ret;
};
func void Ninja_G1CP_AppliedAll_Sub(var int key, var int val) {
    if (val) {
        MEM_ArrayInsert(Ninja_G1CP_AppliedAll_Active, key);
    } else {
        MEM_ArrayInsert(Ninja_G1CP_AppliedAll_NonAct, key);
    };
};

func string Ninja_G1CP_AppliedCmd(var string command) {
    var int id; id = STR_ToInt(command);
    var int ret; ret = Ninja_G1CP_IsFixApplied(id);
    const string TF[2] = {" is inactive", " is active"};
    if (ret == -1) {
        return "";
    } else {
        return ConcatStrings(ConcatStrings("Fix #", IntToString(id)), MEM_ReadStatStringArr(TF, ret));
    };
};

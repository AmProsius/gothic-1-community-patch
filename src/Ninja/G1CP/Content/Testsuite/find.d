/*
 * Check if NPC exists and return it
 */
func C_Npc G1CP_Testsuite_FindNpc(var string name) {
    var int symbId; symbId = G1CP_Testsuite_CheckNpc(name);
    if (symbId != -1) {
        var C_Npc npc; npc = Hlp_GetNpc(symbId);
        if (!Hlp_IsValidNpc(npc)) {
            G1CP_TestsuiteErrorDetailSSS("NPC of instance '", name, "' not found");
            G1CP_TestsuiteStatusPassed = FALSE;
            MEM_NullToInst();
        } else {
            MEMINT_StackPushInst(npc);
        };
    } else {
        MEM_NullToInst();
    };
};

/*
 * Check if an info exists in the info manager and return its oCInfo (not C_Info)
 */
func oCInfo G1CP_Testsuite_FindInfo(var string name) {
    if (G1CP_Testsuite_CheckInfo(name) != -1) {
        var int infoPtr; infoPtr = G1CP_GetInfo(name);
        if (!infoPtr) {
            G1CP_TestsuiteErrorDetailSSS("Info of instance '", name, "' not found");
            G1CP_TestsuiteStatusPassed = FALSE;
            MEM_NullToInst();
        } else {
            _^(infoPtr);
        };
    } else {
        MEM_NullToInst();
    };
};

/*
 * Check if waypoint exists and return it as zCWaypoint
 */
func zCWaypoint G1CP_Testsuite_FindWaypoint(var string name) {
    var int wpPtr; wpPtr = G1CP_GetWaypoint(name);
    if (!wpPtr) {
        G1CP_TestsuiteErrorDetailSSS("Waypoint '", name, "' not found");
        G1CP_TestsuiteStatusPassed = FALSE;
        MEM_NullToInst();
    } else {
        _^(wpPtr);
    };
};

/*
 * Check (by name) if a VOB exists and return it as any class inheriting from zCVob
 */
func zCVob G1CP_Testsuite_FindVob(var string name) {
    var int vobPtr; vobPtr = MEM_SearchVobByName(STR_Upper(name));
    if (!vobPtr) {
        G1CP_TestsuiteErrorDetailSSS("VOB with name '", name, "' not found");
        G1CP_TestsuiteStatusPassed = FALSE;
        MEM_NullToInst();
    } else {
        _^(vobPtr);
    };
};

/*
 * Copy of C_BodyStateContains to ensure it exists as expected
 */
func int G1CP_BodyStateContains(var C_Npc slf, var int bodystate) {
    // Define possibly missing symbols locally
    const int BS_MAX                = 31;
    const int BS_FLAG_INTERRUPTABLE = 32768;
    const int BS_FLAG_FREEHANDS     = 65536;

    const int mod = BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS;
    return ((Npc_GetBodyState(slf) & mod) == (bodystate & mod));
};


/*
 * More versatile version of Npc_CanSee
 */
func int G1CP_Npc_CanSeeVob(var int npcPtr, var int vobPtr, var int withAngles) {
    if (!vobPtr) || (!Hlp_Is_oCNpc(npcPtr)) {
        return FALSE;
    };

    const int oCNpc__CanSee = 6938640; //0x69E010
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_IntParam(_@(withAngles));
        CALL_PtrParam(_@(vobPtr));
        CALL_PutRetValTo(_@(ret));
        CALL__thiscall(_@(npcPtr), oCNpc__CanSee);
        call = CALL_End();
    };

    var int ret;
    return +ret;
};


/*
 * Equivalent function of Npc_CanSeeNpcFreeLOS for Items
 */
func int G1CP_Npc_CanSeeItemFreeLOS(var C_Npc slf, var C_Item itm) {
    if (Hlp_IsValidNpc(slf)) && (Hlp_IsValidItem(itm)) {
        return G1CP_Npc_CanSeeVob(_@(slf), _@(itm), TRUE);
    } else {
        return FALSE;
    };
};


/*
 * Check if an NPC is visible on the screen
 */
func int G1CP_NpcIsVisibleOnScreen(var C_Npc slf) {
    if (Hlp_IsValidNpc(slf)) {
        return G1CP_VobIsVisibleOnScreen(_@(slf));
    } else {
        return FALSE;
    };
};


/*
 * Instant teleport (for the testsuite functions)
 * Advantages:
 * - Destination may be anything from a waypoint to a VOB name/NPC instance name
 * - The teleport is instant
 */
func void G1CP_NpcBeamTo(var C_Npc slf, var string destination) {
    var int slfPtr; slfPtr = _@(slf);
    const int oCNpc__BeamTo = 6896400; //0x693B10
    const int strPtr = 0;
    const int call = 0;
    if (CALL_Begin(call)) {
        strPtr = _@s(destination);
        CALL_PtrParam(_@(strPtr));
        CALL__thiscall(_@(slfPtr), oCNpc__BeamTo);
        call = CALL_End();
    };
};

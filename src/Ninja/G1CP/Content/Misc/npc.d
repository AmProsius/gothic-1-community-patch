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
func int G1CP_NpcCanSeeVob(var int npcPtr, var int vobPtr, var int withAngles) {
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
func int G1CP_NpcCanSeeItemFreeLOS(var C_Npc slf, var C_Item itm) {
    if (Hlp_IsValidNpc(slf)) && (Hlp_IsValidItem(itm)) {
        return G1CP_NpcCanSeeVob(_@(slf), _@(itm), TRUE);
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


/*
 * Safe way to obtain the content of an AI-variable
 */
func int G1CP_NpcGetAIVar(var C_Npc slf, var string AIVarName, var int dflt) {
    // Check if NPC exists
    if (!Hlp_IsValidNpc(slf)) {
        return dflt;
    };

    // Check if AI variable exists
    if (!G1CP_IsIntConst(AIVarName, 0)) {
        return dflt;
    };

    // Read AI-variable
    return MEM_ReadStatArr(slf.aivar, G1CP_GetIntConst(AIVarName, 0, 0));
};
func int G1CP_NpcIDGetAIVar(var int npcInstance, var string AIVarName, var int dflt) {
    var C_Npc slf; slf = Hlp_GetNpc(npcInstance);
    return G1CP_NpcGetAIVar(slf, AIVarName, dflt);
};


/*
 * Safe way to set the content of an AI-variable
 */
func void G1CP_NpcSetAIVar(var C_Npc slf, var string AIVarName, var int value) {
    // Check if NPC exists
    if (!Hlp_IsValidNpc(slf)) {
        return;
    };

    // Check if AI variable exists
    if (!G1CP_IsIntConst(AIVarName, 0)) {
        return;
    };

    // Write AI-variable
    MEM_WriteStatArr(slf.aivar, G1CP_GetIntConst(AIVarName, 0, 0), value);
};
func void G1CP_NpcIDSetAIVar(var int npcInstance, var string AIVarName, var int value) {
    var C_Npc slf; slf = Hlp_GetNpc(npcInstance);
    G1CP_NpcSetAIVar(slf, AIVarName, value);
};

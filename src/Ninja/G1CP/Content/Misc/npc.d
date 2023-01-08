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
 * Copy of the external engine function Npc_ExchangeRoutine but taking a function symbol index
 */
func void G1CP_NpcExchangeRoutineI(var C_Npc slf, var int fncId) {
    if (!Hlp_IsValidNpc(slf)) {
        return;
    };

    const int oCNpc_state_offset = 1136; //0x0470
    var int npcStatePtr; npcStatePtr = _@(slf)+oCNpc_state_offset;

    const int oCNpc_States__ChangeRoutine = 7105008; //0x6C69F0
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(fncId));
        CALL__thiscall(_@(npcStatePtr), oCNpc_States__ChangeRoutine);
        call = CALL_End();
    };
};


/*
 * Get daily routine function symbol index
 */
func int G1CP_NpcGetRoutine(var C_Npc slf) {
    if (!Hlp_IsValidNpc(slf)) {
        return -1;
    };

    // Detour to read the function as integer
    return MEM_ReadInt(_@(slf.bodymass)+4);
};


/*
 * Functional version of the external engine function Npc_IsInRoutine
 */
func int G1CP_NpcIsInRoutine(var C_Npc slf, var func dailyRoutine) {
    if (Hlp_IsValidNpc(slf)) {
        return (MEM_GetFuncId(dailyRoutine) == MEM_ReadInt(_@(slf.bodymass)+4)); // Read daily_routine function as int
    } else {
        return FALSE;
    };
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
 * Equivalent function of Npc_CanSeeNpcFreeLos for Items
 */
func int G1CP_NpcCanSeeItemFreeLos(var C_Npc slf, var C_Item itm) {
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
 * Get the oTSpawnNode of an NPC, if currently in the spawn manager
 */
func int G1CP_NpcGetSpawnNode(var C_Npc slf) {
    // NPC must be valid
    if (!Hlp_IsValidNpc(slf)) {
        return 0;
    };

    // Iterate over spawn list (in machine code for performance)
    const int ret = 0;
    const int code = 0;
    const int npcPtr = 0;
    if (!code) {
        MEM_InitGlobalInst();
        ASM_Open(47+1);
        ASM_1(96);                              // pusha
        ASM_1(185);   ASM_4(MEM_Game.spawnman); // mov    ecx, spawnman
        ASM_3(545163);                          // mov    edx, [ecx+0x8]
        ASM_2(53893);                           // test   edx, edx
        ASM_2(6260);                            // jz     notFound
        ASM_2(2443);                            // mov    ecx, [ecx]
        ASM_2(13707); ASM_4(_@(npcPtr));        // mov    esi, npcPtr
        ASM_2(49201);                           // xor    eax, eax
        // loopStart:
        ASM_2(14731);                           // mov    edi, [ecx]
        ASM_2(14137);                           // cmp    [edi], esi
        ASM_2(2676);                            // jz     found
        ASM_1(64);                              // inc    eax
        ASM_3(311683);                          // add    ecx, 0x4
        ASM_2(53305);                           // cmp    eax, edx
        ASM_2(62076);                           // jl     loopStart
        // notFound:
        ASM_2(65329);                           // xor    edi, edi
        // found:
        ASM_2(15753);  ASM_4(_@(ret));          // mov    [ret], edi
        ASM_1(97);                              // popa
        ASM_1(195);                             // ret
        code = ASM_Close();
    };

    // Execute the code
    npcPtr = _@(slf);
    ASM_Run(code);
    return +ret;
};


/*
 * Check if an NPC is in the spawn manager. That is not the case if they are currently spawned, dead or lost.
 */
func int G1CP_NpcIsInSpawnMan(var C_Npc slf) {
    return (G1CP_NpcGetSpawnNode(slf) != 0);
};


/*
 * Safe way to obtain the content of an AI-variable
 */
func int G1CP_NpcGetAiVarI(var C_Npc slf, var int aiVarId, var int dflt) {
    // Check if NPC exists
    if (!Hlp_IsValidNpc(slf)) {
        return dflt;
    };

    // Index must be an integer constant
    if (!G1CP_IsIntConstI(aiVarId, 0)) {
        return dflt;
    };

    // Read AI variable
    return MEM_ReadStatArr(slf.aivar, G1CP_GetIntConstI(aiVarId, 0, 0));
};
func int G1CP_NpcGetAiVar(var C_Npc slf, var string aiVarName, var int dflt) {
    return G1CP_NpcGetAiVarI(slf, MEM_GetSymbolIndex(aiVarName), dflt);
};
func int G1CP_NpcIdGetAiVarI(var int npcInstance, var int aiVarId, var int dflt) {
    var C_Npc slf; slf = Hlp_GetNpc(npcInstance);
    return G1CP_NpcGetAiVarI(slf, aiVarId, dflt);
};
func int G1CP_NpcIdGetAiVar(var int npcInstance, var string aiVarName, var int dflt) {
    var C_Npc slf; slf = Hlp_GetNpc(npcInstance);
    return G1CP_NpcGetAiVar(slf, aiVarName, dflt);
};


/*
 * Safe way to set the content of an AI-variable
 */
func void G1CP_NpcSetAiVarI(var C_Npc slf, var int aiVarId, var int value) {
    // Check if NPC exists
    if (!Hlp_IsValidNpc(slf)) {
        return;
    };

    // Check if AI variable exists
    if (!G1CP_IsIntConstI(aiVarId, 0)) {
        return;
    };

    // Write AI-variable
    MEM_WriteStatArr(slf.aivar, G1CP_GetIntConstI(aiVarId, 0, 0), value);
};
func void G1CP_NpcSetAiVar(var C_Npc slf, var string aiVarName, var int value) {
    G1CP_NpcSetAiVarI(slf, MEM_GetSymbolIndex(aiVarName), value);
};
func void G1CP_NpcIdSetAiVarI(var int npcInstance, var int aiVarId, var int value) {
    var C_Npc slf; slf = Hlp_GetNpc(npcInstance);
    G1CP_NpcSetAiVarI(slf, aiVarId, value);
};
func void G1CP_NpcIdSetAiVar(var int npcInstance, var string aiVarName, var int value) {
    var C_Npc slf; slf = Hlp_GetNpc(npcInstance);
    G1CP_NpcSetAiVar(slf, aiVarName, value);
};

/*
 * Rename an NPC
 */
funt int G1CP_NpcRename(var string npcName, var string originalStr, var string correctedStr) {
    var int npcId; npcId = G1CP_GetNpcProtoId(npcName);

    return (G1CP_ReplaceAssignStr(npcId, 0, "C_Npc.name", 0, originalStr, correctedStr) > 0);
}

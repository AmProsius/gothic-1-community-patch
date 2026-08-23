/*
 * Copy of C_BodyStateContains to ensure it exists as expected
 */
func int G1CP_BodyStateContains(var int slf, var int bodystate) {
    // Define possibly missing symbols locally
    const int BS_MAX                = 31;
    const int BS_FLAG_INTERRUPTABLE = 32768;
    const int BS_FLAG_FREEHANDS     = 65536;

    const int mod = BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS;

    var C_Npc npc; npc = Hlp_GetNpc(slf);
    return ((Npc_GetBodyState(npc) & mod) == (bodystate & mod));
};


/*
 * Copy of the external engine function Npc_ExchangeRoutine but taking a function symbol index
 */
func void G1CP_NpcExchangeRoutineI(var int slf, var int fncId) {
    var C_Npc npc; npc = Hlp_GetNpc(slf);
    if (!Hlp_IsValidNpc(npc)) {
        return;
    };

    const int oCNpc_state_offset = 1136; //0x0470
    var int npcStatePtr; npcStatePtr = _@(npc)+oCNpc_state_offset;

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
func int G1CP_NpcGetRoutine(var int slf) {
    var C_Npc npc; npc = Hlp_GetNpc(slf);
    if (!Hlp_IsValidNpc(npc)) {
        return -1;
    };

    // Detour to read the function as integer
    return MEM_ReadInt(_@(npc.bodymass)+4);
};


/*
 * Functional version of the external engine function Npc_IsInRoutine
 */
func int G1CP_NpcIsInRoutineI(var int slf, var int dailyRoutine) {
    return (G1CP_NpcGetRoutine(slf) == dailyRoutine) && (dailyRoutine != -1);
};
func int G1CP_NpcIsInRoutine(var int slf, var string routineName) {
    var C_Npc npc; npc = Hlp_GetNpc(slf);
    if (!Hlp_IsValidNpc(npc)) {
        return FALSE;
    };

    var string name; name = ConcatStrings(ConcatStrings(ConcatStrings("RTN_", routineName), "_"), IntToString(npc.id));
    return G1CP_NpcIsInRoutineI(slf, MEM_GetSymbolIndex(name));
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
func int G1CP_NpcCanSeeItemFreeLos(var int slf, var int itm) {
    var C_Npc npc; npc = Hlp_GetNpc(slf);
    var C_Item citm; citm = MEM_CpyInst(itm);
    if (Hlp_IsValidNpc(npc)) && (Hlp_IsValidItem(citm)) {
        return G1CP_NpcCanSeeVob(_@(npc), _@(citm), TRUE);
    } else {
        return FALSE;
    };
};


/*
 * Check if an NPC is visible on the screen
 */
func int G1CP_NpcIsVisibleOnScreen(var int slf) {
    var C_Npc npc; npc = Hlp_GetNpc(slf);
    if (Hlp_IsValidNpc(npc)) {
        return G1CP_VobIsVisibleOnScreen(_@(npc));
    } else {
        return FALSE;
    };
};


/*
 * Get the oTSpawnNode of an NPC, if currently in the spawn manager
 */
func int G1CP_NpcGetSpawnNode(var int slf) {
    // NPC must be valid
    var C_Npc npc; npc = Hlp_GetNpc(slf);
    if (!Hlp_IsValidNpc(npc)) {
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
    npcPtr = _@(npc);
    ASM_Run(code);
    return +ret;
};


/*
 * Check if an NPC is in the spawn manager. That is not the case if they are currently spawned, dead or lost.
 */
func int G1CP_NpcIsInSpawnMan(var int slf) {
    return (G1CP_NpcGetSpawnNode(slf) != 0);
};


/*
 * Safe way to obtain the content of an AI-variable
 */
func int G1CP_NpcGetAiVarI(var int slf, var int aiVarId, var int dflt) {
    // Check if NPC exists
    var C_Npc npc; npc = Hlp_GetNpc(slf);
    if (!Hlp_IsValidNpc(npc)) {
        return dflt;
    };

    // Index must be an integer constant
    if (!G1CP_IsIntConstI(aiVarId, 0)) {
        return dflt;
    };

    // Read AI variable
    return MEM_ReadStatArr(npc.aivar, G1CP_GetIntConstI(aiVarId, 0, 0));
};
func int G1CP_NpcGetAiVar(var int slf, var string aiVarName, var int dflt) {
    return G1CP_NpcGetAiVarI(slf, MEM_GetSymbolIndex(aiVarName), dflt);
};


/*
 * Safe way to set the content of an AI-variable
 */
func void G1CP_NpcSetAiVarI(var int slf, var int aiVarId, var int value) {
    // Check if NPC exists
    var C_Npc npc; npc = Hlp_GetNpc(slf);
    if (!Hlp_IsValidNpc(npc)) {
        return;
    };

    // Check if AI variable exists
    if (!G1CP_IsIntConstI(aiVarId, 0)) {
        return;
    };

    // Write AI-variable
    MEM_WriteStatArr(npc.aivar, G1CP_GetIntConstI(aiVarId, 0, 0), value);
};
func void G1CP_NpcSetAiVar(var int slf, var string aiVarName, var int value) {
    G1CP_NpcSetAiVarI(slf, MEM_GetSymbolIndex(aiVarName), value);
};

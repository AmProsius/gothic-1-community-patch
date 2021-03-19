/*
 * Safe way to obtain the content of an AI-variable
 */
func int G1CP_GetAIVar(var C_Npc slf, var string AIVarName, var int dflt) {
    // Check if NPC exists
    if (!Hlp_IsValidNpc(slf)) {
        return dflt;
    };

    // Check if AI variable exists
    var int idx; idx = G1CP_GetIntVar(AIVarName, 0, -1);
    if (idx == -1) {
        return dflt;
    };

    // Read AI-variable
    return MEM_ReadStatArr(slf.aivar, idx);
};
func int G1CP_IdGetAIVar(var int npcInstance, var string AIVarName, var int dflt) {
    var C_Npc slf; slf = Hlp_GetNpc(npcInstance);
    return G1CP_GetAIVar(slf, AIVarName, dflt);
};


/*
 * Safe way to set the content of an AI-variable
 */
func int G1CP_SetAIVar(var C_Npc slf, var string AIVarName, var int value) {
    // Check if NPC exists
    if (!Hlp_IsValidNpc(slf)) {
        return FALSE;
    };

    // Check if AI variable exists
    var int idx; idx = G1CP_GetIntVar(AIVarName, 0, -1);
    if (idx == -1) {
        return FALSE;
    };

    // Write AI-variable
    MEM_WriteStatArr(slf.aivar, idx, value);
    return TRUE;
};
func int G1CP_IdSetAIVar(var int npcInstance, var string AIVarName, var int value) {
    var C_Npc slf; slf = Hlp_GetNpc(npcInstance);
    return G1CP_SetAIVar(slf, AIVarName, value);
};

/*
 * Safe way to obtain the content of an AI-variable
 */
func int Ninja_G1CP_GetAIVar(var C_Npc slf, var string AIVarName, var int dflt) {
    // Check if NPC exists
    if (!Hlp_IsValidNpc(slf)) {
        return dflt;
    };

    // Check if AI variable exists
    var int symb; symb = MEM_GetParserSymbol(AIVarName);
    if (!symb) {
        return dflt;
    };

    // Read AI-variable
    var int idx; idx = MEM_ReadInt(symb+zCParSymbol_content_offset);
    return MEM_ReadStatArr(slf.aivar, idx);
};
func int Ninja_G1CP_IdGetAIVar(var int npcInstance, var string AIVarName, var int dflt) {
    var C_Npc slf; slf = Hlp_GetNpc(npcInstance);
    return Ninja_G1CP_GetAIVar(slf, AIVarName, dflt);
};

/*
 * Safe way to set the content of an AI-variable
 */
func void Ninja_G1CP_SetAIVar(var C_Npc slf, var string AIVarName, var int value) {
    // Check if NPC exists
    if (!Hlp_IsValidNpc(slf)) {
        return;
    };

    // Check if AI variable exists
    var int symb; symb = MEM_GetParserSymbol(AIVarName);
    if (!symb) {
        return;
    };

    // Write AI-variable
    var int idx; idx = MEM_ReadInt(symb+zCParSymbol_content_offset);
    MEM_WriteStatArr(slf.aivar, idx, value);
};
func void Ninja_G1CP_IdSetAIVar(var int npcInstance, var string AIVarName, var int value) {
    var C_Npc slf; slf = Hlp_GetNpc(npcInstance);
    Ninja_G1CP_SetAIVar(slf, AIVarName, value);
};

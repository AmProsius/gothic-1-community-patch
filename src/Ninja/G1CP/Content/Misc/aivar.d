/*
 * Safe way to obtain the content of an AI-variable
 */
func int Ninja_G1CP_GetAIVar(var int npcInstance, var string AIVarName, var int dflt) {
    // Check if NPC exists
    var C_Npc slf; slf = Hlp_GetNpc(npcInstance);
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


/*
 * Safe way to set the content of an AI-variable
 */
func void Ninja_G1CP_SetAIVar(var int npcInstance, var string AIVarName, var int value) {
    // Check if NPC exists
    var C_Npc slf; slf = Hlp_GetNpc(npcInstance);
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

/*
 * Check if integer symbol exists and return its value
 */
func int G1CP_GetIntVarBySymbol(var int symbPtr, var int ele, var int dflt) {
    // Check if symbol exists
    if (!symbPtr) {
        return dflt;
    };

    // Check if integer
    var zCPar_Symbol symb; symb = _^(symbPtr);
    if ((symb.bitfield & zCPar_Symbol_bitfield_type) != zPAR_TYPE_INT)  {
        return dflt;
    };

    // Check if enough elements
    if ((symb.bitfield & zCPar_Symbol_bitfield_ele) <= ele) {
        return dflt;
    };

    // Check if array
    if ((symb.bitfield & zCPar_Symbol_bitfield_ele) > 1) {
        return MEM_ReadInt(symb.content + 4 * ele);
    } else {
        return symb.content;
    };
};
func int G1CP_GetIntVarByIndex(var int symbId, var int ele, var int dflt) {
    if (symbId < 0) || (symbId >= currSymbolTableLength) {
        return dflt;
    };
    return G1CP_GetIntVarBySymbol(MEM_GetSymbolByIndex(symbId), ele, dflt);
};
func int G1CP_GetIntVar(var string name, var int ele, var int dflt) {
    return G1CP_GetIntVarBySymbol(MEM_GetSymbol(name), ele, dflt);
};

/*
 * Check if string symbol exists and return its value
 */
func string G1CP_GetStringVarBySymbol(var int symbPtr, var int ele, var string dflt) {
    // Check if symbol
    if (!symbPtr) {
        return dflt;
    };

    // Check if string
    var zCPar_Symbol symb; symb = _^(symbPtr);
    if ((symb.bitfield & zCPar_Symbol_bitfield_type) != zPAR_TYPE_STRING)  {
        return dflt;
    };

    // Check if enough elements
    if ((symb.bitfield & zCPar_Symbol_bitfield_ele) <= ele) {
        return dflt;
    };

    // Check if string is present (should never happen)
    if (!symb.content) {
        return dflt;
    };

    // Check if content is string (paranoid)
    var int addr; addr = symb.content + sizeof_zString * ele;
    if (MEM_ReadInt(addr) != zString__vtbl) {
        return dflt;
    };

    // Return variable
    return MEM_ReadString(addr);
};
func string G1CP_GetStringVarByIndex(var int symbId, var int ele, var string dflt) {
    if (symbId < 0) || (symbId >= currSymbolTableLength) {
        return dflt;
    };
    return G1CP_GetStringVarBySymbol(MEM_GetSymbolByIndex(symbId), ele, dflt);
};
func string G1CP_GetStringVar(var string name, var int ele, var string dflt) {
    return G1CP_GetStringVarBySymbol(MEM_GetSymbol(name), ele, dflt);
};

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
func void G1CP_SetAIVar(var C_Npc slf, var string AIVarName, var int value) {
    // Check if NPC exists
    if (!Hlp_IsValidNpc(slf)) {
        return;
    };

    // Check if AI variable exists
    var int idx; idx = G1CP_GetIntVar(AIVarName, 0, -1);
    if (idx == -1) {
        return;
    };

    // Write AI-variable
    MEM_WriteStatArr(slf.aivar, idx, value);
};
func void G1CP_IdSetAIVar(var int npcInstance, var string AIVarName, var int value) {
    var C_Npc slf; slf = Hlp_GetNpc(npcInstance);
    G1CP_SetAIVar(slf, AIVarName, value);
};

/*
 * Miscellaneous functions
 */

/*
 * Left fill a string with a token string to fill total length
 */
func string Ninja_G1CP_LFill(var string str, var string fill, var int total) {
    repeat(i, total-STR_Len(str)); var int i;
        str = ConcatStrings(fill, str);
    end;
    return str;
};


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


/*
 * Function to set the told status of infos
 */
func void Ninja_G1CP_SetInfoTold(var string infoName, var int isTold) {
    var int symbPtr; symbPtr = MEM_GetSymbol(infoName);
    if (!symbPtr) {
        return;
    };
    var zCPar_Symbol symb; symb = _^(symbPtr);

    // Verify that it is an instance
    if ((symb.bitfield & zCPar_Symbol_bitfield_type) != zPAR_TYPE_INSTANCE)
    || (!symb.offset)
    || (!symb.parent) {
        return;
    };

    // Verify that it is a C_Info instance
    if (!Hlp_StrCmp(MEM_ReadString(symb.parent), "C_INFO")) {
        return;
    };

    // Assign
    var oCInfo info; info = _^(symb.offset-oCInfo_C_INFO_Offset);
    info.told = !!isTold;
};

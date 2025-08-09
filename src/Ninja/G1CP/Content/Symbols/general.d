/*
 * Get the name of a symbol by its symbol index
 */
func string G1CP_GetSymbolName(var int symbId) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return "";
    };

    // Resolve instances for NPCs, items and infos
    if (G1CP_IsInstI(symbId, "", -1)) {
        var zCPar_Symbol symbClass; symbClass = _PM_ToClass(symbId);
        var string className; className = symbClass.name;

        if (Hlp_StrCmp(className, "C_Npc")) || (Hlp_StrCmp(className, "oCNpc"))
        || (Hlp_StrCmp(className, "C_Item")) || (Hlp_StrCmp(className, "oCItem")) {
            MEM_PushInstParam(symbId);
            MEM_Call(Hlp_GetInstanceId);
            var int origId; origId = MEM_PopIntResult();
            if (origId != -1) {
                symbId = origId;
            };
        } else if (Hlp_StrCmp(className, "oCInfo")) || (Hlp_StrCmp(className, "C_Info")) {
            var int ptr; ptr = MEM_ReadInt(MEM_GetSymbolByIndex(symbId) + zCParSymbol_offset_offset);
            if (ptr) {
                if (Hlp_StrCmp(className, "C_Info")) {
                    ptr -= oCInfo_C_INFO_Offset;
                };
                var oCInfo info; info = _^(ptr);
                if (info._instance > 0) {
                    symbId = info._instance;
                };
            };
        };
    };

    return MEM_ReadString(MEM_GetSymbolByIndex(symbId));
};

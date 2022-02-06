/*
 * Get the name of a symbol by its symbol index
 */
func string G1CP_GetSymbolName(var int symbId) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return "";
    };

    // Resolve instances for NPCs, items and infos
    var oCInfo info; var int ptr;
    if (G1CP_IsInstI(symbId, "", -1)) {
        if (G1CP_IsInstI(symbId, "C_Npc",  -1)) || (G1CP_IsInstI(symbId, "oCNpc",  -1))
        || (G1CP_IsInstI(symbId, "C_Item", -1)) || (G1CP_IsInstI(symbId, "oCItem", -1)) {
            MEM_PushInstParam(symbId);
            MEM_Call(Hlp_GetInstanceId);
            var int origId; origId = MEM_PopIntResult();
            if (origId != -1) {
                symbId = origId;
            };
        } else if (G1CP_IsInstI(symbId, "oCInfo", -1)) {
            ptr = MEM_ReadInt(MEM_GetSymbolByIndex(symbId) + zCParSymbol_offset_offset);
            if (ptr) {
                info = _^(ptr);
                if (info._instance > 0) {
                    symbId = info._instance;
                };
            };
        } else if (G1CP_IsInstI(symbId, "C_Info", -1)) {
            ptr = MEM_ReadInt(MEM_GetSymbolByIndex(symbId) + zCParSymbol_offset_offset);
            if (ptr) {
                info = _^(ptr - oCInfo_C_INFO_Offset);
                if (info._instance > 0) {
                    symbId = info._instance;
                };
            };
        };
    };

    return MEM_ReadString(MEM_GetSymbolByIndex(symbId));
};

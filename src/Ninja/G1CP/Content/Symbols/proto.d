/*
 * Check if prototype symbol exists and return the address of the symbol.
 * The parameter "clss" specifies the excepted class of the prototype. If empty, it will not be checked.
 */
func int G1CP_CheckProtoSymbol(var int symbPtr, var string clss) {
    // Check if symbol exists
    if (!symbPtr) {
        return 0;
    };

    // Check if prototype
    var zCPar_Symbol symb; symb = _^(symbPtr);
    if ((symb.bitfield & zCPar_Symbol_bitfield_type) != zPAR_TYPE_PROTOTYPE) {
        return 0;
    };

    // Check if of correct class
    if (!Hlp_StrCmp(clss, "")) {
        // Get symbol of class (possibly through prototype)
        if (!symb.parent) {
            return 0;
        };
        var zCPar_Symbol classSymb; classSymb = _^(symb.parent);

        // Check the name of the class
        if (!Hlp_StrCmp(classSymb.name, clss)) {
            return 0;
        };
    };

    // Success
    return symbPtr;
};


/*
 * Check if prototype symbol exists. For clss see function above.
 */
func int G1CP_IsProtoI(var int symbId, var string clss) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return 0;
    };
    return (G1CP_CheckProtoSymbol(MEM_GetSymbolByIndex(symbId), clss) != 0);
};
func int G1CP_IsProto(var string name, var string clss) {
    return (G1CP_CheckProtoSymbol(MEM_GetSymbol(name), clss) != 0);
};


/*
 * Check if prototype symbol exists and return its symbol index. For clss see function above.
 */
func int G1CP_GetProtoId(var string name, var string clss) {
    if (G1CP_CheckProtoSymbol(MEM_GetSymbol(name), clss)) {
        return MEM_GetSymbolIndex(name);
    } else {
        return -1;
    };
};


/*
 * Check if NPC prototype exists.
 */
func int G1CP_IsNpcProto(var string name) {
    return G1CP_IsProto(name, "C_Npc");
};
func int G1CP_IsNpcProtoI(var int symbId) {
    return G1CP_IsProtoI(symbId, "C_Npc");
};
func int G1CP_GetNpcProtoId(var string name) {
    return G1CP_GetProtoId(name, "C_Npc");
};


/*
 * Check if item prototype exists.
 */
func int G1CP_IsItemProto(var string name) {
    return G1CP_IsProto(name, "C_Item");
};
func int G1CP_IsItemProtoI(var int symbId) {
    return G1CP_IsProtoI(symbId, "C_Item");
};
func int G1CP_GetItemProtoId(var string name) {
    return G1CP_GetProtoId(name, "C_Item");
};


/*
 * Check if info prototype exists.
 */
func int G1CP_IsInfoProto(var string name) {
    return G1CP_IsProto(name, "C_Info");
};
func int G1CP_IsInfoProtoI(var int symbId) {
    return G1CP_IsProtoI(symbId, "C_Info");
};
func int G1CP_GetInfoProtoId(var string name) {
    return G1CP_GetProtoId(name, "C_Info");
};

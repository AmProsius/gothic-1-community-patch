/*
 * Check if instance symbol exists and return the address of the symbol.
 * The parameter "clss" specifies the excepted class of the instance. If empty, it will not be checked. The parameter
 * "isFunc" specifies if the instance is a instance function (1) or an instance variable (-1). If 0, it will not be
 * checked.
 * An instance function is defined as
 *   instance name(class) {  ....  };
 * An instance variable is defined as
 *   instance name(class);
 *   var class name;
 */
func int G1CP_CheckInstSymbol(var int symbPtr, var string clss, var int isFunc) {
    // Check if symbol exists
    if (!symbPtr) {
        return 0;
    };

    // Check if instance
    var zCPar_Symbol symb; symb = _^(symbPtr);
    if ((symb.bitfield & zCPar_Symbol_bitfield_type) != zPAR_TYPE_INSTANCE) {
        return 0;
    };

    // Check if instance function
    var int isConst; isConst = (symb.bitfield & zPAR_FLAG_CONST);
    if ((isFunc ==  1) && (!isConst))   // Should be an instance function but is NOT
    || ((isFunc == -1) &&  (isConst)) { // Should NOT be an instance function but is
        return 0;
    };

    // Check if of correct class
    if (!Hlp_StrCmp(clss, "")) {
        // Get symbol of class (possibly through prototype)
        if (!symb.parent) {
            return 0;
        };
        var zCPar_Symbol classSymb; classSymb = _^(symb.parent);
        if ((classSymb.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_PROTOTYPE) {
            if (!classSymb.parent) {
                return 0;
            };
            classSymb = _^(classSymb.parent);
        };

        // Check the name of the class
        if (!Hlp_StrCmp(classSymb.name, clss)) {
            return 0;
        };
    };

    // Success
    return symbPtr;
};


/*
 * Check if instance symbol exists. For clss and isFunc see function above.
 */
func int G1CP_IsInstP(var int symbPtr, var string clss, var int isFunc) {
    return (G1CP_CheckInstSymbol(symbPtr, clss, isFunc) != 0);
};
func int G1CP_IsInstI(var int symbId, var string clss, var int isFunc) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return 0;
    };
    return G1CP_IsInstP(MEM_GetSymbolByIndex(symbId), clss, isFunc);
};
func int G1CP_IsInst(var string name, var string clss, var int isFunc) {
    return G1CP_IsInstP(MEM_GetSymbol(name), clss, isFunc);
};


/*
 * Check if NPC instance exists.
 */
func int G1CP_IsNpcInst(var string name) {
    return G1CP_IsInst(name, "C_Npc", 0);
};
func int G1CP_IsNpcInstI(var int symbId) {
    return G1CP_IsInstI(symbId, "C_Npc", 0);
};


/*
 * Check if item instance exists.
 */
func int G1CP_IsItemInst(var string name) {
    return G1CP_IsInst(name, "C_Item", 0);
};
func int G1CP_IsItemInstI(var int symbId) {
    return G1CP_IsInstI(symbId, "C_Item", 0);
};


/*
 * Check if info instance exists.
 */
func int G1CP_IsInfoInst(var string name) {
    return G1CP_IsInst(name, "C_Info", 0);
};
func int G1CP_IsInfoInstI(var int symbId) {
    return G1CP_IsInstI(symbId, "C_Info", 0);
};



/*
 * Get symbol by name from any parser
 * Source: https://forum.worldofplayers.de/forum/threads/?p=25745831
 */
func int G1CP_GetAnySymbol(var int parserAddr, var string symbolName) {
    var int symTab; symTab = parserAddr+16; //0x10 zCParser.symtab

    const int zCPar_SymbolTable__GetSymbol = 7316336; //0x6FA370
    const int namePtr = 0;
    const int call = 0;
    if (CALL_Begin(call)) {
        namePtr = _@s(symbolName);
        CALL_PtrParam(_@(namePtr));
        CALL_PutRetValTo(_@(ret));
        CALL__thiscall(_@(symTab), zCPar_SymbolTable__GetSymbol);
        call = CALL_End();
    };

    var int ret;
    return +ret;
};

/*
 * Get symbol index by name from any parser
 */
func int G1CP_GetAnySymbolIndex(var int parserAddr, var string symbolName) {
    const int zCParser__GetIndex = 7250112; //0x6EA0C0
    const int namePtr = 0;
    const int call = 0;
    if (CALL_Begin(call)) {
        namePtr = _@s(symbolName);
        CALL_PtrParam(_@(namePtr));
        CALL_PutRetValTo(_@(ret));
        CALL__thiscall(_@(parserAddr), zCParser__GetIndex);
        call = CALL_End();
    };

    var int ret;
    return +ret;
};

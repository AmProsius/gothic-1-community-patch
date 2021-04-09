/*
 * Create hash tables for function starts and ends in code stack (as address in memory) indexed by symbol index
 */
const int G1CP_FuncStarts = 0;
const int G1CP_FuncEnds   = 0;
func void G1CP_CollectFuncRanges() {
    if (G1CP_FuncStarts) {
        return;
    };
    G1CP_FuncStarts = _HT_CreatePtr(MEM_Parser.symtab_table_numInArray/2);
    G1CP_FuncEnds   = _HT_CreatePtr(MEM_Parser.symtab_table_numInArray/2);

    var int prevFuncId; prevFuncId = 0;
    repeat(id, MEM_Parser.symtab_table_numInArray); var int id;
        var zCPar_Symbol symb; symb = _^(MEM_ReadIntArray(MEM_Parser.symtab_table_array, id));
        var int type; type = symb.bitfield & zCPar_Symbol_bitfield_type;
        if  (symb.bitfield & zPAR_FLAG_CONST)
        && (!(symb.bitfield & zPAR_FLAG_EXTERNAL))
        && ((type == zPAR_TYPE_FUNC) || (type == zPAR_TYPE_INSTANCE))
        ||  (type == zPAR_TYPE_PROTOTYPE) { // Not constant
            var int addr; addr = symb.content + MEM_Parser.stack_stack;
            _HT_Insert(G1CP_FuncStarts, addr, id);
            if (prevFuncId) {
                _HT_Insert(G1CP_FuncEnds, addr - 1, prevFuncId);
            };
            prevFuncId = id;
        };
    end;
    if (prevFuncId) {
        _HT_Insert(G1CP_FuncEnds, MEM_Parser.stack_stacklast-1, prevFuncId);
    };
};

/*
 * Retrieve function byte code start address. If invalid symbol index, it returns zero.
 */
func int G1CP_GetFuncStart(var int funcId) {
    return _HT_Get(G1CP_FuncStarts, funcId);
};

/*
 * Retrieve function byte code end address (i.e. address of last byte). If invalid symbol index, it returns zero.
 */
func int G1CP_GetFuncEnd(var int funcId) {
    return _HT_Get(G1CP_FuncEnds, funcId);
};

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

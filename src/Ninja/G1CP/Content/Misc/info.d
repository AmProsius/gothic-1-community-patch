/*
 * Get info in a safe way (instance might not be initialized!)
 */
func int G1CP_GetInfo(var string infoName) {
    MEM_InitGlobalInst();

    var int symbId; symbId = MEM_FindParserSymbol(infoName);
    var int infoMan; infoMan = MEM_Game.infoman;

    const int oCInfoManager__GetInformation = 6703616; //0x664A00
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_IntParam(_@(symbId));
        CALL_PutRetValTo(_@(ret));
        CALL__thiscall(_@(infoMan), oCInfoManager__GetInformation);
        call = CALL_End();
    };

    var int ret;
    return +ret;
};


/*
 * Function to set the told status of infos
 */
func void G1CP_SetInfoTold(var string infoName, var int isTold) {
    var int ptr; ptr = G1CP_GetInfo(infoName);
    if (ptr) {
        var oCInfo info; info = _^(ptr);
        info.told = !!isTold;
    };
};

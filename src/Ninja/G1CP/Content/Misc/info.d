/*
 * Get info in a safe way (instance might not be initialized!)
 */
func int G1CP_GetInfoI(var int symbId) {
    MEM_InitGlobalInst();

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
func int G1CP_GetInfo(var string infoName) {
    return G1CP_GetInfoI(MEM_GetSymbolIndex(infoName));
};


/*
 * Function to set the told status of infos
 */
func void G1CP_SetInfoToldI(var int symbId, var int isTold) {
    var int ptr; ptr = G1CP_GetInfoI(symbId);
    if (ptr) {
        var oCInfo info; info = _^(ptr);
        info.told = !!isTold;
    };
};
func void G1CP_SetInfoTold(var string infoName, var int isTold) {
    var int ptr; ptr = G1CP_GetInfo(infoName);
    if (ptr) {
        var oCInfo info; info = _^(ptr);
        info.told = !!isTold;
    };
};

/*
 * Check if an NPC has an info with a specific description
 */
func int G1CP_HasInfoWithDesc(var C_Npc slf, var string infoDesc) {
    MEM_InitGlobalInst();

    var int infoMan; infoMan = MEM_Game.infoman;
    var int npcPtr; npcPtr = _@(slf);
    var int herPtr; herPtr = _@(hero);
    var int count; count = 0;
    var int ret;

    const int oCInfoManager__GetInfo = 6704720; //0x664E50
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_IntParam(_@(count));
        CALL_IntParam(_@(npcPtr));
        CALL_IntParam(_@(herPtr));
        CALL_PutRetValTo(_@(ret));
        CALL__thiscall(_@(infoMan), oCInfoManager__GetInfo);
        call = CALL_End();
    };

    while(ret);
        var oCInfo info; info = _^(ret);
        if (Hlp_StrCmp(info.description, infoDesc)) {
            return TRUE;
        };
        count += 1;
        ASM_Run(call);
    end;

    return FALSE;
};

/*
 * Change the description of an info
 */
func int G1CP_InfoChangeDesc(var string infoName, var string originalStr, var string correctedStr) {
    var int infoId; infoId = G1CP_GetInfoInstId(infoName);

    return (G1CP_ReplaceAssignStr(infoId, 0, "C_Info.description", 0, originalStr, correctedStr) > 0);
};

/*
 * Change the value of an info's integer variable
 */
func int G1CP_ChangeInfoIntVar(var string infoName, var string infoProp, var int originalInt, var int correctedInt) {
    var int infoId; infoId = G1CP_GetInfoInstId(infoName);

    return (G1CP_ReplaceAssignInt(infoId, 0, ConcatStrings("C_Info.", infoProp), 0, originalInt, correctedInt) > 0);
};

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
 * Check if an NPC has an info with a specific description (only available infos, i.e. conditions are met)
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
        if (STR_Compare(info.description, infoDesc) == STR_EQUAL) {
            return TRUE;
        };
        count += 1;
        ASM_Run(call);
    end;

    return FALSE;
};


/*
 * Check if an info has a info-choice with a specific description
 */
func int G1CP_InfoHasChoiceWithDesc(var oCInfo info, var string choiceDesc) {
    var int listPtr; listPtr = info.listChoices_next;
    while(listPtr);
        var zCList list; list = _^(listPtr);
        var oCInfoChoice choice; choice = _^(list.data);
        if (STR_Compare(choice.text, choiceDesc) == STR_EQUAL) {
            return TRUE;
        };
        listPtr = list.next;
    end;

    return FALSE;
};
func int G1CP_InfoHasChoiceWithDescI(var int symbId, var string choiceDesc) {
    var int infoPtr; infoPtr = G1CP_GetInfoI(symbId);
    if (!infoPtr) {
        return FALSE;
    };
    var oCInfo info; info = _^(infoPtr);
    return G1CP_InfoHasChoiceWithDesc(info, choiceDesc);
};

/*
 * More versatile version of Npc_CanSee
 */
func int Ninja_G1CP_Npc_CanSeeVob(var int npcPtr, var int vobPtr, var int withAngles) {
    if (!vobPtr) || (!Hlp_Is_oCNpc(npcPtr)) {
        return FALSE;
    };

    const int oCNpc__CanSee = 6938640; //0x69E010
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_IntParam(_@(withAngles));
        CALL_PtrParam(_@(vobPtr));
        CALL_PutRetValTo(_@(ret));
        CALL__thiscall(_@(npcPtr), oCNpc__CanSee);
        call = CALL_End();
    };

    var int ret;
    return +ret;
};


/*
 * Equivalent function of Npc_CanSeeNpcFreeLOS for Items
 */
func int Ninja_G1CP_Npc_CanSeeItemFreeLOS(var C_Npc slf, var C_Item itm) {
    if (Hlp_IsValidNpc(slf)) && (Hlp_IsValidItem(itm)) {
        return Ninja_G1CP_Npc_CanSeeVob(_@(slf), _@(itm), TRUE);
    } else {
        return FALSE;
    };
};

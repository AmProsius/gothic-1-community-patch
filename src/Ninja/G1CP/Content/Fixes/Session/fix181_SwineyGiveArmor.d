/*
 * #181 Swiney gives his own pants to the player
 */
func int G1CP_181_SwineyGiveArmor() {
    if (G1CP_IsFunc("Info_Swiney_Schuerfer_Ja", "void|none"))
    && (G1CP_IsFunc("Info_Swiney_Schuerfer_Nein", "void|none")) {
        HookDaedalusFuncS("Info_Swiney_Schuerfer_Ja", "G1CP_181_SwineyGiveArmor_Hook1");
        HookDaedalusFuncS("Info_Swiney_Schuerfer_Nein", "G1CP_181_SwineyGiveArmor_Hook2");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog to add actions afterwards
 */
func int G1CP_181_SwineyGiveArmor_Hook1() {
    G1CP_ReportFuncToSpy();

    // Call the original function first
    ContinueCall();

    // Suit-up (AI_EquipBestArmor is too late), only done once, recyclable call not necessary
    const int oCNpc__EquipBestArmor = 6989072; //0x6AA510
    CALL__thiscall(_@(self), oCNpc__EquipBestArmor);
};

/*
 * Exact copy of the function above. Need unique functions for both because of the way Daedalus hooks work
 */
func int G1CP_181_SwineyGiveArmor_Hook2() {
    G1CP_ReportFuncToSpy();

    // Call the original function first
    ContinueCall();

    // Suit-up (AI_EquipBestArmor is too late), only done once, recyclable call not necessary
    const int oCNpc__EquipBestArmor = 6989072; //0x6AA510
    CALL__thiscall(_@(self), oCNpc__EquipBestArmor);
};

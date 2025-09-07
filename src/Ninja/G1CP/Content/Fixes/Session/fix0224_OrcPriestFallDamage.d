/*
 * #224 Undead orc priest can die from fall damage
 */
func int G1CP_0224_OrcPriestFallDamage() {
    if (!G1CP_IsFunc("Info_HighPriest5_Condition", "int|none"))
    || (!G1CP_IsFunc("Info_HighPriest5FAILED_Condition", "int|none")) {
        return FALSE;
    };

    HookDaedalusFuncS("Info_HighPriest5_Condition", "G1CP_0224_OrcPriestFallDamage_Hook1");
    HookDaedalusFuncS("Info_HighPriest5FAILED_Condition", "G1CP_0224_OrcPriestFallDamage_Hook2");
    return TRUE;
};

func void G1CP_0224_OrcPriestFallDamage_HookBase() {
    var oCNpc slf; slf = Hlp_GetNpc(self);
    if (slf.fallDownDamage == 10) {
        slf.fallDownDamage = 0; // Does not need to be reverted: Not written to game save.
    };
};
func int G1CP_0224_OrcPriestFallDamage_Hook1() {
    G1CP_ReportFuncToSpy();
    G1CP_0224_OrcPriestFallDamage_HookBase();
    ContinueCall();
};
func int G1CP_0224_OrcPriestFallDamage_Hook2() {
    G1CP_ReportFuncToSpy();
    G1CP_0224_OrcPriestFallDamage_HookBase();
    ContinueCall();
};

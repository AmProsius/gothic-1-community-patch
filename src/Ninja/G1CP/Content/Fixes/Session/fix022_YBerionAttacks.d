/*
 * #22 Y'Berion doesn't attack the player
 */
func int Ninja_G1CP_022_YBerionAttacks() {
    if (MEM_FindParserSymbol("DIA_YBerion_Wache_Info") != -1)
    && (MEM_FindParserSymbol("ZS_ATTACK")              != -1) {
        HookDaedalusFuncS("DIA_YBerion_Wache_Info", "Ninja_G1CP_022_YBerionAttacks_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog function
 */
func void Ninja_G1CP_022_YBerionAttacks_Hook() {
    Ninja_G1CP_ReportFuncToSpy();

    // Continue with the original function
    ContinueCall();

    // Put Y'Berion into ZS_Attack state
    Npc_SetTarget(self, other);

    // Check if ZS_Attack exists
    var int symbId; symbId = MEM_FindParserSymbol("ZS_ATTACK");
    if (symbId != -1) {
        // AI_StartState(self, ZS_ATTACK, 1, ""); // Does not work, expects func parameter
        MEM_PushInstParam(self);
        MEM_PushIntParam(symbId); // Func parameter as integer
        MEM_PushIntParam(1);
        MEM_PushStringParam("");
        MEM_Call(AI_StartState);
    };
};

/*
 * #22 Y'Berion doesn't attack the player
 */
func void Ninja_G1CP_022_YBerionAttacks() {
    HookDaedalusFuncS("DIA_YBerion_Wache_Info", "Ninja_G1CP_022_YBerionAttacks_Hook");
};

/*
 * This function intercepts the dialog function
 */
func void Ninja_G1CP_022_YBerionAttacks_Hook() {
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

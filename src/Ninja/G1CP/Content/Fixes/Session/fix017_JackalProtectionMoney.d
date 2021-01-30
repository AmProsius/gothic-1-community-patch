/*
 * #17 Jackal doesn't recognize the player's camp membership
 */
func int Ninja_G1CP_017_JackalProtectionMoney() {
    if (MEM_FindParserSymbol("Info_Jackal_Hello_Condition") != -1) {
        HookDaedalusFuncS("Info_Jackal_Hello_Condition", "Ninja_G1CP_017_JackalProtectionMoney_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int Ninja_G1CP_017_JackalProtectionMoney_Hook() {
    Ninja_G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    if (Npc_GetTrueGuild(hero)) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};

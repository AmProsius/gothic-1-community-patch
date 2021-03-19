/*
 * #18 Bloodwyn doesn't recognize the player's camp membership
 */
func int G1CP_018_BloodwynProtectionMoney() {
    if (MEM_GetSymbolIndex("Info_Bloodwyn_Hello_Condition") != -1) {
        HookDaedalusFuncS("Info_Bloodwyn_Hello_Condition", "G1CP_018_BloodwynProtectionMoney_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_018_BloodwynProtectionMoney_Hook() {
    G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    if (Npc_GetTrueGuild(hero)) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};

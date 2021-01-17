/*
 * #17 Jackal doesn't recognize the player's camp membership
 */
func void Ninja_G1CP_017_JackalProtectionMoney() {
    HookDaedalusFuncS("Info_Jackal_Hello_Condition", "Ninja_G1CP_017_JackalProtectionMoney_Hook");
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int Ninja_G1CP_017_JackalProtectionMoney_Hook() {
    // Add the new condition (other conditions remain untouched)
    if (Npc_GetTrueGuild(hero)) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};

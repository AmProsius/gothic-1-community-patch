/*
 * #18 Bloodwyn doesn't recognize the player's camp membership
 */
func void Ninja_G1CP_018_BloodwynProtectionMoney() {
    HookDaedalusFuncS("Info_Bloodwyn_Hello_Condition", "Ninja_G1CP_018_BloodwynProtectionMoney_Hook");
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int Ninja_G1CP_018_BloodwynProtectionMoney_Hook() {
    // Add the new condition (other conditions remain untouched)
    if (Npc_GetTrueGuild(hero)) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};

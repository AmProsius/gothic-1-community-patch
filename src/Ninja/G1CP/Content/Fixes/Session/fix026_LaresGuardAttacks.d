/*
 * #26 Lares's guard doesn't attack the player
 */
func void Ninja_G1CP_026_LaresGuardAttacks() {
    HookDaedalusFuncS("Info_Org_804_FirstWarn_Condition", "Ninja_G1CP_026_LaresGuardAttacks_Hook");
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int Ninja_G1CP_026_LaresGuardAttacks_Hook() {
    // Add the new condition (other conditions remain untouched)
    if (Ninja_G1CP_GetAIVar(hero, "AIV_GUARDPASSAGE_STATUS", 0)) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};

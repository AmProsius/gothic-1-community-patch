/*
 * #17 Jackal doesn't recognize the player's camp membership
 */
func int G1CP_0017_JackalProtectionMoney() {
    const string conditionFuncName = "Info_Jackal_Hello_Condition";
    if (!G1CP_IsFunc(conditionFuncName, "int|none")) {
        return FALSE;
    };

    HookDaedalusFuncS(conditionFuncName, "G1CP_0017_JackalProtectionMoney_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0017_JackalProtectionMoney_Hook() {
    G1CP_ReportFuncToSpy();

    if (Npc_GetTrueGuild(hero)) {
        return FALSE;
    };

    ContinueCall();
};

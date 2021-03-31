/*
 * #13 NPCs draw weapon on dead monsters
 */
func int G1CP_013_NpcIgnoreDeadMonster() {
    if (MEM_GetSymbolIndex("ZS_AssessMonster") != -1)
    && (MEM_GetSymbolIndex("ZS_AssessMonster_Loop") != -1)
    && (MEM_GetSymbolIndex("C_NpcIsDown") != -1) {
        HookDaedalusFuncS("ZS_AssessMonster", "G1CP_013_NpcIgnoreDeadMonster_HookStart");
        HookDaedalusFuncS("ZS_AssessMonster_Loop", "G1CP_013_NpcIgnoreDeadMonster_HookLoop");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the start of the NPC state to introduce more conditions
 */
func void G1CP_013_NpcIgnoreDeadMonster_HookStart() {
    G1CP_ReportFuncToSpy();

    // Check if other is even valid
    if (!Hlp_IsValidNpc(other)) {
        AI_ContinueRoutine(self);
        return;
    };

    // Check if other is down
    MEM_PushInstParam(other);
    MEM_CallByString("C_NpcIsDown"); // This function exists, as established by the function above
    if (MEM_PopIntResult()) {
        AI_ContinueRoutine(self);
        return;
    };

    // Otherwise continue with original function
    ContinueCall();
};

/*
 * This function intercepts the NPC state to introduce more conditions
 */
func int G1CP_013_NpcIgnoreDeadMonster_HookLoop() {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int LOOP_END = 1;

    // Check if other is even valid
    if (!Hlp_IsValidNpc(other)) {
        return LOOP_END;
    };

    // Check if other is down
    MEM_PushInstParam(other);
    MEM_CallByString("C_NpcIsDown"); // This function exists, as established by the function above
    if (MEM_PopIntResult()) {
        return LOOP_END;
    };

    // Otherwise continue with original function
    ContinueCall();
};

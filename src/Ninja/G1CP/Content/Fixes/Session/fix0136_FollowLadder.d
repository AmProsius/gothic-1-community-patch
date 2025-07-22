/*
 * #136 NPCs cannot use ladders when following the player
 */
func int G1CP_0136_FollowLadder() {
    if (G1CP_IsFunc("B_FollowPC_AssessSC", "void|none")) {
        HookDaedalusFuncS("B_FollowPC_AssessSC", "G1CP_0136_FollowLadder_PercHook");
        return TRUE;
    } else {
        return FALSE;
    };
};

func void G1CP_0136_FollowLadder_PercHook() {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int BS_FLAG_INTERRUPTABLE = 32768;
    const int BS_CLIMB              = 9 | BS_FLAG_INTERRUPTABLE;

    // Disable this perception when climbing a ladder
    if (G1CP_BodyStateContains(self, BS_CLIMB)) {
        return;
    };

    // Call original function
    ContinueCall();
};

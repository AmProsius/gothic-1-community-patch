/*
 * #136 NPCs cannot use ladders when following the player
 */
func int Ninja_G1CP_136_FollowLadder() {
    if (MEM_FindParserSymbol("B_FollowPC_AssessSC") != -1) {
        HookDaedalusFuncS("B_FollowPC_AssessSC", "Ninja_G1CP_136_FollowLadder_PercHook");
        return TRUE;
    } else {
        return FALSE;
    };
};

func void Ninja_G1CP_136_FollowLadder_PercHook() {
    Ninja_G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int BS_FLAG_INTERRUPTABLE = 32768;
    const int BS_CLIMB              = 9 | BS_FLAG_INTERRUPTABLE;

    // Disable this perception when climbing a ladder
    if (Ninja_G1CP_BodyStateContains(self, BS_CLIMB)) {
        return;
    };

    // Call original function
    ContinueCall();
};

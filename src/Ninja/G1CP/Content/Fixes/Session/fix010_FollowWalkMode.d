/*
 * #10 Companions don't adjust their walking speed
 */
func void Ninja_G1CP_010_FollowWalkMode() {
    // Only register hooks, if both functions are found
    if (MEM_FindParserSymbol("ZS_FollowPC_Loop")    != -1)
    && (MEM_FindParserSymbol("B_FollowPC_AssessSC") != -1) {
        HookDaedalusFuncS("ZS_FollowPC_Loop", "Ninja_G1CP_010_FollowWalkMode_Hook");
        HookDaedalusFuncS("B_FollowPC_AssessSC", "Ninja_G1CP_010_FollowWalkMode_AssessSCHook");
    };
};

/*
 * This function intercepts the NPC state to introduce more conditions
 */
func int Ninja_G1CP_010_FollowWalkMode_Hook() {
    // Define possibly missing symbols locally
    const int BS_FLAG_INTERRUPTABLE = 32768;
    const int BS_WALK               = 1 | BS_FLAG_INTERRUPTABLE;
    const int BS_RUN                = 3;
    const int NPC_WALK              = 1;

    if (Ninja_G1CP_BodyStateContains(hero, BS_WALK)) && (Ninja_G1CP_BodyStateContains(self, BS_RUN)) {
        AI_SetWalkmode(self, NPC_WALK);
    };

    // Place hook to intercept setting the walk mode
    const int AI_SetWalkMode_popped = 6648584; //0x657308
    HookEngineF(AI_SetWalkMode_popped, 5, Ninja_G1CP_010_FollowWalkMode_SetModeHook);

    // Call the original function (There might be other important changes that we do not want to overwrite!)
    ContinueCall();
    var int ret; ret = MEM_PopIntResult();

    // Remove hook again (only remove function but leave changes in engine for performance)
    RemoveHookF(AI_SetWalkMode_popped, 0, Ninja_G1CP_010_FollowWalkMode_SetModeHook);

    // Return original return value
    return ret;
};

func void Ninja_G1CP_010_FollowWalkMode_SetModeHook() {
    // Define possibly missing symbols locally
    const int BS_FLAG_INTERRUPTABLE = 32768;
    const int BS_WALK               = 1 | BS_FLAG_INTERRUPTABLE;
    const int NPC_RUN               = 0;
    const int NPC_WALK              = 1;

    // Check if NPC is valid
    if (!Hlp_Is_oCNpc(EAX)) {
        return;
    };
    var C_Npc slf; slf = _^(EAX);

    // Get walk mode
    var int modePtr; modePtr = ESP+28;
    var int mode; mode = MEM_ReadInt(modePtr);

    // Adjust walking mode before calling the original function (gives opportunity for other changes there)
    if (mode == NPC_RUN) && (Ninja_G1CP_BodyStateContains(hero, BS_WALK)) {
        MEM_WriteInt(modePtr, NPC_WALK);
    };
};


func void Ninja_G1CP_010_FollowWalkMode_AssessSCHook() {
    // Define possibly missing symbols locally
    const int BS_FLAG_INTERRUPTABLE = 32768;
    const int BS_WALK               = 1 | BS_FLAG_INTERRUPTABLE;
    const int BS_RUN                = 3;
    const int NPC_RUN               = 0;

    if (Ninja_G1CP_BodyStateContains(hero, BS_RUN)) && (Ninja_G1CP_BodyStateContains(self, BS_WALK)) {
        Npc_ClearAIQueue(self);
        AI_StandUpQuick(self);
        AI_SetWalkmode(self, NPC_RUN);
    };

    // Call original function
    ContinueCall();
};

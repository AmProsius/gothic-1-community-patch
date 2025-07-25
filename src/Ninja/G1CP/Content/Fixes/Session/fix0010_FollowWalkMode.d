/*
 * #10 Companions don't adjust their walking speed
 */
func int G1CP_0010_FollowWalkMode() {
    var int funcId; funcId = G1CP_GetFuncId("ZS_FollowPC_Loop", "int|none");
    var int needleId; needleId = MEM_GetFuncId(AI_SetWalkMode);
    var int replacId; replacId = MEM_GetFuncId(G1CP_0010_FollowWalkMode_SetWalkMode);

    if (funcId != -1) && (needleId != -1) && (G1CP_IsFunc("B_FollowPC_AssessSC", "void|none")) {
        HookDaedalusFuncS("ZS_FollowPC_Loop", "G1CP_0010_FollowWalkMode_Hook");
        HookDaedalusFuncS("B_FollowPC_AssessSC", "G1CP_0010_FollowWalkMode_AssessSCHook");
        var int count; count = G1CP_ReplaceCall(funcId, 0, needleId, replacId);
        return (count > 0);
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the NPC state to introduce more conditions
 */
func int G1CP_0010_FollowWalkMode_Hook() {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int BS_FLAG_INTERRUPTABLE = 32768;
    const int BS_WALK               = 1 | BS_FLAG_INTERRUPTABLE;
    const int BS_RUN                = 3;
    const int NPC_WALK              = 1;

    if (G1CP_BodyStateContains(hero, BS_WALK)) && (G1CP_BodyStateContains(self, BS_RUN)) {
        AI_SetWalkmode(self, NPC_WALK);
    };

    // Call the original function (There might be other important changes that we do not want to overwrite!)
    ContinueCall();
};

func void G1CP_0010_FollowWalkMode_SetWalkMode(var C_Npc slf, var int mode) {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int BS_FLAG_INTERRUPTABLE = 32768;
    const int BS_WALK               = 1 | BS_FLAG_INTERRUPTABLE;
    const int NPC_RUN               = 0;
    const int NPC_WALK              = 1;

    // Adjust walking mode before calling the original function (gives opportunity for other changes there)
    if (mode == NPC_RUN) && (G1CP_BodyStateContains(hero, BS_WALK)) {
        mode = NPC_WALK;
    };

    // Proceed
    AI_SetWalkMode(slf, mode);
};


func void G1CP_0010_FollowWalkMode_AssessSCHook() {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int BS_FLAG_INTERRUPTABLE = 32768;
    const int BS_WALK               = 1 | BS_FLAG_INTERRUPTABLE;
    const int BS_RUN                = 3;
    const int NPC_RUN               = 0;

    if (G1CP_BodyStateContains(hero, BS_RUN)) && (G1CP_BodyStateContains(self, BS_WALK)) {
        Npc_ClearAiQueue(self);
        AI_StandUpQuick(self);
        AI_SetWalkmode(self, NPC_RUN);
    };

    // Call original function
    ContinueCall();
};

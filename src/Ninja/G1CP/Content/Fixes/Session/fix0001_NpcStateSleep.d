/*
 * #1 NPCs wake up immediately
 */
func int G1CP_0001_NpcStateSleep() {
    var int funcId; funcId = G1CP_GetFuncId("ZS_SleepBed_Loop", "int|none");
    var int stateId; stateId = G1CP_GetFuncId("ZS_SitAround", "void|none");
    var int needleId; needleId = MEM_GetFuncId(AI_StartState);
    var int replacId; replacId = MEM_GetFuncId(G1CP_0001_NpcStateSleep_StartState);

    if (funcId != -1) && (stateId != -1) {
        var int count; count = G1CP_ReplaceCall(funcId, 0, needleId, replacId);
        return (count > 0);
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the NPC state to introduce more conditions
 */
func void G1CP_0001_NpcStateSleep_StartState(var C_Npc slf, var int funcId, var int stateBehaviour, var string wpName) {
    G1CP_ReportFuncToSpy();

    // Create potentially missing symbols locally
    const int BS_FLAG_INTERRUPTABLE    = 32768;
    const int BS_MOBINTERACT_INTERRUPT = 16 | BS_FLAG_INTERRUPTABLE;

    // Check for valid ZS-function
    if (funcId == MEM_GetSymbolIndex("ZS_SitAround")) {
        // If our conditions are not met, abort AI_StartState
        if (G1CP_BodyStateContains(slf, BS_MOBINTERACT_INTERRUPT)) {
            return;
        };
    };

    // Otherwise proceed
    // AI_StartState(slf, funcId, stateBehaviour, wpName);
    MEM_PushInstParam(slf);
    MEM_PushIntParam(funcId); // Cannot re-push function correctly
    MEM_PushIntParam(stateBehaviour);
    MEM_PushStringParam(wpName);
    MEM_Call(AI_StartState);
};

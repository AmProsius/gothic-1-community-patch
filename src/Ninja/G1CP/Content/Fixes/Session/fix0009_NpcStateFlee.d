/*
 * #9 NPCs freeze when fleeing
 */
func int G1CP_0009_NpcStateFlee() {
    var int funcId; funcId = G1CP_GetFuncId("ZS_Flee_Loop", "int|none");
    var int needleId; needleId = MEM_GetFuncId(AI_Wait);
    var int replacId; replacId = MEM_GetFuncId(G1CP_0009_NpcStateFlee_Wait);

    if (funcId != -1) && (needleId != -1) {
        var int count; count = G1CP_ReplaceCall(funcId, 0, needleId, replacId);
        return (count > 0);
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the NPC state to introduce more conditions
 */
func void G1CP_0009_NpcStateFlee_Wait(var C_Npc slf, var float sec) {
    G1CP_ReportFuncToSpy();

    // Just disable it
};

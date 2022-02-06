/*
 * #124 Gate guard doesn't close castle gate in chapter 4
 */
func int G1CP_124_GateGuardId() {
    var int npcId; npcId = G1CP_GetNpcInstId("GRD_280_Gardist");
    return (G1CP_ReplaceAssignInt(npcId, 0, "C_Npc.id", 0, 230, 280) > 0);
};

/*
 * #261 Spelling - Orc Hunter (DE)
 */
func int G1CP_0261_DE_OrcHunterName() {
    var int npcId; npcId = G1CP_GetNpcProtoId("Mst_Default_OrcScout");
    return (G1CP_ReplaceAssignStr(npcId, 0, "C_Npc.name", "Orc Jäger", "Ork-Jäger") > 0);
};

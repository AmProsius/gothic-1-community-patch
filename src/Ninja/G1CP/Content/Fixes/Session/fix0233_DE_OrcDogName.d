/*
 * #233 Spelling - Orc Dog (DE)
 */
func int G1CP_0233_DE_OrcDogName() {
    var int npcId; npcId = G1CP_GetNpcProtoId("Mst_Default_OrcDog");
    return (G1CP_ReplaceAssignStr(npcId, 0, "C_Npc.name", "Orc-Hund", "Orkhund") > 0);
};

/*
 * #233 Spelling - Orc Dog (DE)
 */
func int G1CP_233_DE_OrcDogName() {
    var int npcId; npcId = G1CP_GetNpcProtoId("Mst_Default_OrcDog");
    return (G1CP_ReplaceAssignStr(npcId, 0, "C_NPC.NAME", 0, "Orc-Hund", "Orkhund") > 0);
};

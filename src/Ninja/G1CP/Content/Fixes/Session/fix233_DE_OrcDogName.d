/*
 * #233 Spelling - Orc Dog (DE)
 */
func int G1CP_233_DE_OrcDogName() {
    const string npcName = "Mst_Default_OrcDog";
    const string originalStr = "Orc-Hund";
    const string correctedStr = "Orkhund";

    return (G1CP_NpcRename(npcName, originalStr, correctedStr) > 0);
};

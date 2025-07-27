/*
 * Rename an NPC instance
 */
func int G1CP_Tpl_RenameNpc(var string npcName, var string originalStr, var string correctedStr) {
    var int npcId; npcId = G1CP_GetNpcInstId(npcName);

    return (G1CP_ReplaceAssignStr(npcId, 0, "C_Npc.name", 0, originalStr, correctedStr) > 0);
};

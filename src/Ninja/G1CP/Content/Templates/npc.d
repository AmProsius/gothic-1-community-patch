/*
 * Change the focus name of an NPC.
 */
func int G1CP_Tpl_RenameNpc(var string npcInst, var string originalName, var string correctName) {
    var int npcId; npcId = G1CP_GetNpcInstId(npcInst);
    return (G1CP_ReplaceAssignStr(npcId, 0, "C_Npc.name", originalName, correctName) > 0);
};

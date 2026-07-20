/*
 * Change the value of an C_Npc instance integer variable. Returns true on success.
 */
func int G1CP_Tpl_ChangeNpcIntVar(var string npcInst, var string prop, var int originalVal, var int correctVal) {
    var int npcId; npcId = G1CP_GetNpcInstId(npcInst);
    return (G1CP_ReplaceAssignInt(npcId, 0, ConcatStrings("C_Npc.", prop), originalVal, correctVal) > 0);
};

/*
 * Change the value of an C_Npc instance string variable. Returns true on success.
 */
func int G1CP_Tpl_ChangeNpcStrVar(var string npcInst, var string prop, var string originalVal, var string correctVal) {
    var int npcId; npcId = G1CP_GetNpcInstId(npcInst);
    return (G1CP_ReplaceAssignStr(npcId, 0, ConcatStrings("C_Npc.", prop), originalVal, correctVal) > 0);
};

/*
 * Change the waypoint name in an NPC routine function. Returns true on success.
 */
func int G1CP_Tpl_ChangeNpcRtnWP(var string rtnFunc, var string originalWp, var string correctWp) {
    var int funcId; funcId = G1CP_GetFuncId(rtnFunc, "void|none");
    return (G1CP_ReplacePushStr(funcId, 0, originalWp, correctWp) > 0);
};

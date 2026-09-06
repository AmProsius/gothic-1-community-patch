/*
 * Forward the call to "B_GiveInvItems"
 */
func void G1CP_GiveInvItems(var int sender, var int receiver, var int itemId, var int amount) {
    var C_Npc src; src = Hlp_GetNpc(sender);
    var C_Npc dst; dst = Hlp_GetNpc(receiver);
    if (!Hlp_IsValidNpc(src)) || (!Hlp_IsValidNpc(dst)) {
        return;
    };

    var int funcId; funcId = G1CP_GetFuncId("B_GiveInvItems", "void|inst|inst|int|int");
    if (funcId == -1) {
        Npc_RemoveInvItems(src, itemId, amount);
        CreateInvItems(dst, itemId, amount);
        return;
    };

    MEM_PushInstParam(src);
    MEM_PushInstParam(dst);
    MEM_PushIntParam(itemId);
    MEM_PushIntParam(amount);
    MEM_CallById(funcId);
};

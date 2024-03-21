/*
 * Forward the call to "B_GiveInvItems"
 */
func void G1CP_GiveInvItems(var C_Npc sender, var C_Npc receiver, var int itemId, var int amount) {
    var int funcId; funcId = G1CP_GetFuncId("B_GiveInvItems", "void|inst|inst|int|int");

    if (funcId == -1) {
        Npc_RemoveInvItems(sender, itemId, amount);
        CreateInvItems(receiver, itemId, amount);
        return;
    };

    MEM_PushInstParam(sender);
    MEM_PushInstParam(receiver);
    MEM_PushIntParam(itemId);
    MEM_PushIntParam(amount);
    MEM_CallById(funcId);
};

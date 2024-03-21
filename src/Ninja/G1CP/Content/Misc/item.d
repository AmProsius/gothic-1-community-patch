/*
 * Forward the call to "B_GiveInvItems"
 */
func void G1CP_GiveInvItems(var int senderId, var int receiverId, var int itemId, var int amount) {
    var int funcId; funcId = G1CP_GetFuncId("B_GiveInvItems", "void|inst|inst|int|int");

    if (funcId == -1) {
        Npc_RemoveInvItems(senderId, itemId, amount);
        CreateInvItems(receiverId, itemId, amount);
        return;
    }

    MEM_PushInstParam(senderId);
    MEM_PushInstParam(receiverId);
    MEM_PushIntParam(itemId);
    MEM_PushIntParam(amount);
    MEM_CallById(funcId);
};

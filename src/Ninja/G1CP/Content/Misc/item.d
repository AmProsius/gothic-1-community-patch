/*
 * Change the value of an item's int variable. Returns true on success.
 */
func void G1CP_GiveInvItems(var int senderId, var int receiverId, var int itemId, var int amount) {
    var int funcId; funcId = MEM_GetSymbolIndex("B_GiveInvItems");
    if (funcId != -1) {
        MEM_PushInstParam(senderId);
        MEM_PushInstParam(receiverId);
        MEM_PushIntParam(itemId);
        MEM_PushIntParam(amount);
        MEM_CallById(funcId);
    } else {
        // In case "B_GiveInvItems" does not exist
        Npc_RemoveInvItems(senderId, itemId, amount);
        CreateInvItems(receiverId, itemId, amount);
    };
}

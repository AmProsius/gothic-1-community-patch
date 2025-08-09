/*
 * Change the value of an item instance integer variable. Returns true on success.
 */
func int G1CP_ItemChangeIntVar(var string instName, var string prop, var int originalInt, var int correctedInt) {
    var int itemId; itemId = G1CP_GetItemInstId(instName);
    return (G1CP_ReplaceAssignInt(itemId, 0, ConcatStrings("C_Item.", prop), originalInt, correctedInt) > 0);
};

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

/*
 * Change the value of an item's int variable. Returns true on success.
 */
func int G1CP_ItemChangeIntVar(var string name, var string prop, var int originalInt, var int correctedInt) {
    var int itemId; itemId = G1CP_GetItemInstId(name);

    return (G1CP_ReplaceAssignInt(itemId, 0, ConcatStrings("C_Item.", prop), 0, originalInt, correctedInt) > 0);
}

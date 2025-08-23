/*
 * Change the value of an item instance integer variable. Returns true on success.
 */
func int G1CP_Tpl_ChangeItemIntVar(var string itemInst, var string prop, var int originalVal, var int correctVal) {
    var int itemId; itemId = G1CP_GetItemInstId(itemInst);
    return (G1CP_ReplaceAssignInt(itemId, 0, ConcatStrings("C_Item.", prop), originalVal, correctVal) > 0);
};

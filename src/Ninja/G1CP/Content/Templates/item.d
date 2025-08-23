/*
 * Change the value of a C_Item instance integer variable. Returns true on success.
 */
func int G1CP_Tpl_ChangeItemIntVar(var string itemInst, var string prop, var int originalVal, var int correctVal) {
    var int itemId; itemId = G1CP_GetItemInstId(itemInst);
    return (G1CP_ReplaceAssignInt(itemId, 0, ConcatStrings("C_Item.", prop), originalVal, correctVal) > 0);
};

/*
 * Change the value of a C_Item instance string variable. Returns true on success.
 */
func int G1CP_Tpl_ChangeItemStrVar(var string itemInst, var string prop, var string originalVal, var string correctVal)
{
    var int itemId; itemId = G1CP_GetItemInstId(itemInst);
    return (G1CP_ReplaceAssignStr(itemId, 0, ConcatStrings("C_Item.", prop), originalVal, correctVal) > 0);
};

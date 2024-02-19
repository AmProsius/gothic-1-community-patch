/*
 * Change the value of an item's string variable
 */
func int G1CP_ItemChangeStrVar(var string name, var string prop, var string originalStr, var string correctedStr) {
    var int itemId; itemId = G1CP_GetItemInstId(name);

    return (G1CP_ReplaceAssignStr(itemId, 0, ConcatStrings("C_Item.", prop), 0, originalStr, correctedStr) > 0);
}

/*
 * Change the name of an item
 */
func int G1CP_ItemChangeName(var string name, var string originalStr, var string correctedStr) {
    return G1CP_ItemChangeStrVar(name, "name", originalStr, correctedStr);
}

/*
 * Change the text of an item
 */
func int G1CP_ItemChangeText(var string name, var string originalStr, var string correctedStr) {
    return G1CP_ItemChangeStrVar(name, "text", originalStr, correctedStr);
}

/*
 * Change the description of an item
 */
func int G1CP_ItemChangeDesc(var string name, var string originalStr, var string correctedStr) {
    return G1CP_ItemChangeStrVar(name, "description", originalStr, correctedStr);
}

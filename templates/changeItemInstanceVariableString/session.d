/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}() {
    const string itemName = "### TODO: Item name ###";
    const string itemProperty = "### TODO: Item property ###";
    const int arrIdx = 0; // ### TODO: Change array index ###
    var int correctedSymbId; correctedSymbId = G1CP_GetStringConstId("### TODO: Corrected symbol ID ###", 0);
    var string originalString;
    originalString = G1CP_GetStringConst("### TODO: Original string ###", 0, "G1CP_invalid_string");
    var int itemId; itemId = G1CP_GetItemInstId(itemName);

    return (G1CP_ReplaceAssignStrId(itemId, 0, ConcatStrings("C_Item.", itemProperty), arrIdx, originalString,
        correctedSymbId) > 0);
};

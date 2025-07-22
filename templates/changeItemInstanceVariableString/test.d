/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    {LANGCHECK}
    const string itemName = "### TODO: Item name ###";
    const string itemProperty = "### TODO: Item property ###";
    const string correctedSymbol = "### TODO: Corrected symbol name ###";
    const int arrIdx = 0; // ### TODO: Optional: Change array index ###
    var C_Item itm; itm = G1CP_Testsuite_CreateItem(itemName);
    G1CP_Testsuite_CheckPassed();

    var string itmText; itmText = MEM_ReadStatStringArr(itm.text, arrIdx);

    if (!Hlp_StrCmp(itmText, correctedSymbol)) {
        G1CP_TestsuiteErrorDetailSSSISSS("Text incorrect: ", itemProperty, "[", arrIdx, "] = '", itmText, "'");
        return FALSE;
    };

    return TRUE;
};

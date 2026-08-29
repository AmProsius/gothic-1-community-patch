/*
 * #@ISSUE_NUM@ @LONGNAME@
 */
func int G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@() {
    const string dialogFuncName = "### TODO Dialog function name ###";
    if (!G1CP_IsFunc(dialogFuncName, "void|none"))
    || (!G1CP_IsItemInst("### TODO Item instance name ###")) {
        return FALSE;
    };

    HookDaedalusFuncS(dialogFuncName, "G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog to introduce more actions
 */
func void G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@_Hook() {
    G1CP_ReportFuncToSpy();

    var int itemId; itemId = MEM_GetSymbolIndex("### TODO Item instance name ###");
    var int itemAmountBefore; itemAmountBefore = Npc_HasItems(hero, itemId);

    ContinueCall();

    if (Npc_HasItems(hero, itemId) == itemAmountBefore) {
        G1CP_GiveInvItems(hero, self, itemId, /*### TODO Replace '0' with the desired amount ###*/0);
    };
};

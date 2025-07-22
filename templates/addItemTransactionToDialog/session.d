/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}() {
    const string dialogName = "### TODO: Dialog function name ###";
    if (!G1CP_IsFunc(dialogName, "void|none"))
    || (!G1CP_IsItemInst("### TODO: Item name ###")) {
        return FALSE;
    };

    HookDaedalusFuncS(dialogName, "G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog to introduce more actions
 */
func void G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_Hook() {
    G1CP_ReportFuncToSpy();

    // Symbol indices (existence confirmed by function above)
    const int itemId = -1; itemId = MEM_GetSymbolIndex("### TODO: Item name ###");

    // Remember how many items the player has before the dialog
    const int itemAmountBefore = -1; itemAmountBefore = Npc_HasItems(hero, itemId);

    // Continue with the original function
    ContinueCall();

    // Check if no items were deduced
    if (Npc_HasItems(hero, itemId) == itemAmountBefore) {
        G1CP_GiveInvItems(hero, self, itemId, /* ### TODO: Replace '0' with the desired integer amount ### */ 0);
    };
};

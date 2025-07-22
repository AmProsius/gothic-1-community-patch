/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}() {
    const string dialogName = "### TODO: Dialog function name ###";
    // ### TODO: Optional: Add conditions for the fix to be applied ###
    if (!G1CP_IsFunc(dialogName, "void|none")) {
        return FALSE
    }

    HookDaedalusFuncS(dialogName, "G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog to introduce more actions
 */
func void G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_Hook() {
    G1CP_ReportFuncToSpy();

    // ### TODO: Replace desired amount int value of 0 ###
    const int itemAmountDesired = 0;
    // Status before
    var int itemAmountBefore;

    // Remember how much items the player has before the dialog
    // ### TODO: Replace item name of "ItName" ###
    var int itemId; itemId = G1CP_GetItemInstId("ItName");
    if (itemId != -1) {
        itemAmountBefore = Npc_HasItems(hero, itemId);
    };

    // Continue with the original function
    ContinueCall();

    // Check if no items were deduced
    if (itemId == -1) {
        return;
    };
    if (Npc_HasItems(hero, itemId) != itemAmountBefore) {
        return;
    };

    G1CP_GiveInvItems(hero, self, itemId, itemAmountDesired);
};

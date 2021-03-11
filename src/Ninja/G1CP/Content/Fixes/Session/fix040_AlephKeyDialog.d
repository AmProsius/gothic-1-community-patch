/*
 * #40 Aleph's key dialog doesn't disappear
 */
func int G1CP_040_AlephKeyDialog() {
    if (MEM_FindParserSymbol("VLK_585_Aleph_DIRTY_Condition") != -1)
    && (MEM_FindParserSymbol("VLK_585_Aleph_SCHUPPEN") != -1) {
        HookDaedalusFuncS("VLK_585_Aleph_DIRTY_Condition", "G1CP_040_AlephKeyDialog_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_040_AlephKeyDialog_Hook() {
    G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    if (Npc_KnowsInfo(hero, MEM_FindParserSymbol("VLK_585_Aleph_SCHUPPEN"))) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};

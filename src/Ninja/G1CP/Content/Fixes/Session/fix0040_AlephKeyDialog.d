/*
 * #40 Aleph's key dialog doesn't disappear
 */
func int G1CP_0040_AlephKeyDialog() {
    if (G1CP_IsFunc("VLK_585_Aleph_DIRTY_Condition", "int|none"))
    && (G1CP_IsInfoInst("VLK_585_Aleph_SCHUPPEN")) {
        HookDaedalusFuncS("VLK_585_Aleph_DIRTY_Condition", "G1CP_0040_AlephKeyDialog_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0040_AlephKeyDialog_Hook() {
    G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    if (Npc_KnowsInfo(hero, MEM_GetSymbolIndex("VLK_585_Aleph_SCHUPPEN"))) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};

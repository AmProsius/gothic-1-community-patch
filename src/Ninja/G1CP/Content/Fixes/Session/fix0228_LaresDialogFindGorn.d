/*
 * #228 Gorn can't be asked about after talking to Lares
 */
func int G1CP_0228_LaresDialogFindGorn() {
    if (G1CP_IsFunc("ORG_801_Lares_BringListAnteil_Info", "void|none"))
    && (G1CP_IsIntConst("AIV_FINDABLE"))
    && (G1CP_IsNpcInst("PC_Fighter")) {
        HookDaedalusFuncS("ORG_801_Lares_BringListAnteil_Info", "G1CP_0228_LaresDialogFindGorn_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog to add actions afterwards
 */
func void G1CP_0228_LaresDialogFindGorn_Hook() {
    G1CP_ReportFuncToSpy();

    // Call the original function first
    ContinueCall();

    // Set Gorn to be "findable"
    G1CP_NpcIDSetAIVar(MEM_GetSymbolIndex("PC_Fighter"), "AIV_FINDABLE", TRUE);
};

/*
 * Test the updated speaker assignment of an output unit or SVM.
 * The parameter speakerIsSelf should be TRUE for self, other and FALSE for testing other, self.
 */
func void G1CP_Tpl_TestOuSpeaker(var string infoFuncName, var string ouName, var int speakerIsSelf) {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc(infoFuncName);
    G1CP_Testsuite_CheckOu(ouName);
    GetItemHelper();

    G1CP_Testsuite_Call(funcId, hero, Item_Helper, FALSE);
    G1CP_Testsuite_Assert(G1CP_NpcHasQueuedOu(hero, ouName), speakerIsSelf);

    G1CP_Testsuite_Call(funcId, Item_Helper, hero, FALSE);
    G1CP_Testsuite_Assert(G1CP_NpcHasQueuedOu(hero, ouName), !speakerIsSelf);
};

/*
 * Test the updated subtitles of an output unit or SVM.
 */
func void G1CP_Tpl_TestOuText(var string ouName, var string correctSubtitles) {
    var int ouPtr; ouPtr = G1CP_Testsuite_CheckOu(ouName);
    G1CP_Testsuite_AssertS(G1CP_GetOuTextP(ouPtr), correctSubtitles);
};

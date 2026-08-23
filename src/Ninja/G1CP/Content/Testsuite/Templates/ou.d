/*
 * Test the updated speaker assignment of an output unit or SVM.
 * Note: The parameter ouName is the name of the OU (see AI_Output), not the filename (no suffix).
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

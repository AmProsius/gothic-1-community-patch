/*
 * Test the updated choice test in a dialog.
 * A necessary call to 'G1CP_Testsuite_CheckWorld' is not part of this function to allow additional world-dependent
 * checks. Calling 'G1CP_Testsuite_CheckWorld' is required before calling this function!
 */
func void G1CP_Tpl_TestInfoChoiceText(var string infoInstName, var string npcInstName, var string correctStr) {
    var oCInfo info; info = G1CP_Testsuite_FindInfo(infoInstName);
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc(npcInstName);

    G1CP_Testsuite_BackupInfoChoices(info._instance);

    Info_ClearChoices(info._instance);
    G1CP_Testsuite_Call(info.information, npc, hero, TRUE);
    G1CP_Testsuite_Assert(G1CP_InfoHasChoiceWithDesc(info, correctStr), TRUE);
};

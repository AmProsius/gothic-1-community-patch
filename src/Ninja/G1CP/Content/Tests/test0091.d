/*
 * #91 Spelling - Horatio: "Ricelord" (DE)
 */
func void G1CP_Test_0091() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);
    var int requiredInfoId; requiredInfoId = G1CP_Testsuite_CheckInfo("DIA_Jeremiah_Horatio");

    G1CP_Testsuite_BackupTold(requiredInfoId);

    G1CP_SetInfoToldI(requiredInfoId, TRUE);
    G1CP_Tpl_TestInfoChoiceText(
        "DIA_Horatio_ThoughtSTR",
        "Bau_901_Horatio",
        "Ja. Ich will es mit dem Reislord und seinen Schlägern aufnehmen können!"
    );
};

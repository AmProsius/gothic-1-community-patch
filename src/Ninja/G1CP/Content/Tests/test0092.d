/*
 * #92 Spelling - Horatio: "den Reislord" (DE)
 */
func void G1CP_Test_0092() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);
    var int requiredInfoId; requiredInfoId = G1CP_Testsuite_CheckInfo("DIA_Jeremiah_Horatio");
    var string topic; topic = G1CP_Testsuite_GetStringConst("CH1_HoratiosTeachings");

    G1CP_Testsuite_BackupTold(requiredInfoId);
    G1CP_Testsuite_BackupTopic(topic);

    G1CP_SetInfoToldI(requiredInfoId, TRUE);
    G1CP_Tpl_TestInfoChoiceText(
        "DIA_Horatio_PleaseTeachSTR",
        "Bau_901_Horatio",
        "Damit ich den Reislord und seine Schläger fertigmachen kann!"
    );
};

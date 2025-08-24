/*
 * #27 Drax requires no beer for teaching hunting skills
 *
 * The dialog function is twice. Once called without the hero having a beer and once with.
 *
 * Expected behavior: The variable "drax_Lehrer_frei" is set/not set and log entry is created/not created accordingly.
 */
func int G1CP_Test_0027() {
    const string TEMP_TOPIC_NAME = "G1CP Test 27"; // Has to be a unique name with absolute certainty
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Org_819_Drax_Scavenger_Info");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ItFoBeer");
    var int var1Id; var1Id = G1CP_Testsuite_CheckIntVar("drax_bierbekommen");
    var int var2Id; var2Id = G1CP_Testsuite_CheckIntVar("drax_Lehrer_frei");
    var int topicId; topicId = G1CP_Testsuite_CheckStringConst("GE_TeacherOW");
    G1CP_Testsuite_CheckPassed();

    // Rename the log topic if it already exists
    const string TOPIC = ""; TOPIC = G1CP_GetStringConstI(topicId, 0, TOPIC);
    G1CP_LogRenameTopic(TOPIC, TEMP_TOPIC_NAME);

    var int beersBefore; beersBefore = Npc_HasItems(hero, itemId);
    var int beerGivenBak; beerGivenBak = G1CP_GetIntVarI(var1Id, 0, 0);
    var int teachingBak; teachingBak = G1CP_GetIntVarI(var2Id, 0, 0);
    if (final()) {
        G1CP_LogRemoveTopic(TOPIC);
        G1CP_LogRenameTopic(TEMP_TOPIC_NAME, TOPIC);
        G1CP_SetIntVarI(var1Id, 0, beerGivenBak);
        G1CP_SetIntVarI(var2Id, 0, teachingBak);
        G1CP_Testsuite_NpcSetInvItemAmount(hero, itemId, beersBefore);
    };

    // No beer, variable should remain false and log entry not created
    G1CP_Testsuite_NpcSetInvItemAmount(hero, itemId, 0);
    G1CP_SetIntVarI(var1Id, 0, FALSE);
    G1CP_SetIntVarI(var2Id, 0, FALSE);
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);
    G1CP_Testsuite_Assert(G1CP_LogGetTopic(TOPIC), 0);
    G1CP_Testsuite_Assert(G1CP_GetIntVarI(var2Id, 0, 0), FALSE);

    // Has beer, variable should be set to true and log entry should be created
    G1CP_LogRemoveTopic(TOPIC);
    G1CP_Testsuite_NpcSetInvItemAmount(hero, itemId, 1);
    G1CP_SetIntVarI(var1Id, 0, FALSE);
    G1CP_SetIntVarI(var2Id, 0, FALSE);
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);
    G1CP_Testsuite_AssertNe(G1CP_LogGetTopic(TOPIC), 0);
    G1CP_Testsuite_AssertNe(G1CP_GetIntVarI(var2Id, 0, 0), FALSE);

    return TRUE;
};

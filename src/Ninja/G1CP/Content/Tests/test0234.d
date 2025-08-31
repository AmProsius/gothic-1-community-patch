/*
 * #234 Spelling - Drax: "Orkhund" (DE)
 *
 * The faulty log topic entry will be temporarily created and the fix is called, then the dialog function will be
 * called to check if the entry was correctly created there, too.
 *
 * Expected behavior: The wording of the log topic entry will be correct in both cases.
 */
func void G1CP_Test_0234() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var string topic; topic = G1CP_Testsuite_GetStringConst("GE_AnimalTrophies");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Org_819_Drax_Creatures_Zahn");
    var int skillId; skillId = G1CP_Testsuite_CheckIntVar("Knows_GetTeeth");
    var int oreId; oreId = G1CP_Testsuite_CheckItem("ItMinugget");
    const string logEntryIncorrect = "Wissen über Zähne entfernen - Wolf, Orchund, Snapper, Beisser, Bluthund, Schattenläufer.";
    const string logEntryCorrect = "Wissen über Zähne entfernen - Wolf, Orkhund, Snapper, Beißer, Bluthund, Schattenläufer.";
    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;

    G1CP_Testsuite_BackupTopic(topic);
    G1CP_Testsuite_BackupInt(skillId, 0);
    G1CP_Testsuite_BackupInvAmount(hero, oreId);
    G1CP_Testsuite_BackupIntAddr(_@(hero.lp));
    G1CP_Testsuite_BackupFixStatus();

    // Call the dialog function and observe if it creates the corrected entry
    G1CP_Testsuite_NpcSetInvItemAmount(hero, oreId, 50); // Add 50 ore for the condition within the dialog
    hero.lp = hero.lp + 1;
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);
    G1CP_Testsuite_Assert(G1CP_LogHasEntry(topic, logEntryIncorrect), FALSE);
    G1CP_Testsuite_Assert(G1CP_LogHasEntry(topic, logEntryCorrect), TRUE);
    G1CP_LogRemoveTopic(topic);

    // Create the log topic with the faulty entry and see if the fix will update it
    Log_CreateTopic(topic, LOG_MISSION);
    Log_SetTopicStatus(topic, LOG_RUNNING);
    Log_AddEntry(topic, logEntryIncorrect);
    G1CP_Testsuite_ReapplyFix();
    G1CP_Testsuite_Assert(G1CP_LogHasEntry(topic, logEntryIncorrect), FALSE);
    G1CP_Testsuite_Assert(G1CP_LogHasEntry(topic, logEntryCorrect), TRUE);
};

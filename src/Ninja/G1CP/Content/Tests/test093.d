/*
 * #93 Spelling - Horatio: "zuzuschlagen" (DE)
 *
 * The faulty log topic entry will be temporarily created and the fix is called, then the dialog function will be
 * called to check if the entry was correctly created there, too.
 *
 * Expected behavior: The wording of the log topic entry will be correct in both cases.
 */
func int G1CP_Test_093() {
    var int passed; passed = TRUE;

    // Define possibly missing symbols locally
    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;

    // I'm sorry for not breaking the line at 120 characters
    const string wrong = "Horatio, ein Bauer auf den Reisfeldern des Neuen Lagers will mir beibringen, stärker zuzuschalgen. Doch irgendwie habe ich noch nicht die richtige Antwort auf seine Frage WOZU gefunden.";
    const string right = "Horatio, ein Bauer auf den Reisfeldern des Neuen Lagers will mir beibringen, stärker zuzuschlagen. Doch irgendwie habe ich noch nicht die richtige Antwort auf seine Frage WOZU gefunden.";

    // Check language first
    if (G1CP_Lang != G1CP_Lang_DE) {
        G1CP_TestsuiteErrorDetail("Test only applicable for the German localization");
        return TRUE; // True?
    };

    // Check if the constant exists
    if (MEM_GetSymbolIndex("CH1_HoratiosTeachings") == -1) {
        G1CP_TestsuiteErrorDetail("Variable 'CH1_HoratiosTeachings' not found");
        passed = FALSE;
    };

    // Check if the dialog function exists
    var int funcId; funcId = MEM_GetSymbolIndex("DIA_Horatio_PleaseTeachSTR_Info");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Dialog function 'DIA_Horatio_PleaseTeachSTR_Info' not found");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Retrieve the content of the log topic string constant
    var string topic; topic = G1CP_GetStringVar("CH1_HoratiosTeachings", 0, "G1CP invalid string");

    // Backup the status of the log topic if it exists already
    G1CP_RenameTopic(topic, "G1CP test 93 temporary");

    // First pass: Create the log topic with the faulty entry and see if the fix will update it

    // Create the topic
    Log_CreateTopic(topic, LOG_MISSION);
    Log_SetTopicStatus(topic, LOG_RUNNING);
    Log_AddEntry(topic, wrong);

    // Trigger the fix (careful now, don't overwrite the fix status!)
    var int r; r = G1CP_093_DE_LogEntryHoratio();

    // Check if it was updated
    if (G1CP_TopicHasEntry(topic, wrong)) {
        G1CP_TestsuiteErrorDetail("Log topic entry (incorrect) remained unchanged");
        passed = FALSE;
    };
    if (!G1CP_TopicHasEntry(topic, right)) {
        G1CP_TestsuiteErrorDetail("Log topic entry (correct) does not exist");
        passed = FALSE;
    };
    G1CP_RemoveTopic(topic);

    // Second pass: Call the dialog function and observe if it creates the corrected entry

    // Backup self and other
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set self and other
    self  = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    MEM_CallByID(funcId);

    // Restore self and other
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Check if it was updated
    if (G1CP_TopicHasEntry(topic, wrong)) {
        G1CP_TestsuiteErrorDetail("Log topic entry was created with incorrect wording");
        passed = FALSE;
    };
    if (!G1CP_TopicHasEntry(topic, right)) {
        G1CP_TestsuiteErrorDetail("Log topic entry was not added by the dialog function");
        passed = FALSE;
    };
    G1CP_RemoveTopic(topic);

    // Restore the topic to how it was before
    G1CP_RenameTopic("G1CP test 93 temporary", topic);

    // Return success
    return passed;
};

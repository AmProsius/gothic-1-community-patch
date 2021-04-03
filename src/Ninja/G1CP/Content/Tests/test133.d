/*
 * #133 Spelling - Scatty: "Meine" (DE)
 *
 * The faulty log topic entry will be temporarily created and the fix is called, then the dialog function will be
 * called to check if the entry was correctly created there, too.
 *
 * Expected behavior: The wording of the log topic entry will be correct in both cases.
 */
func int G1CP_Test_133() {
    var int passed; passed = TRUE;

    // Define possibly missing symbols locally
    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;

    const string wrong = "Meinem Niederlage gegen Kirgo hat Scatty nicht sehr beeindruckt.";
    const string right = "Meine Niederlage gegen Kirgo hat Scatty nicht sehr beeindruckt.";

    // Check language first
    if (G1CP_Lang != G1CP_Lang_DE) {
        G1CP_TestsuiteErrorDetail("Test applicable for German localization only");
        return TRUE; // True?
    };

    // Check if the constant exists
    if (MEM_GetSymbolIndex("CH1_JoinOC") == -1) {
        G1CP_TestsuiteErrorDetail("Variable 'CH1_JoinOC' not found");
        passed = FALSE;
    };

    // Check if the dialog function exists
    var int funcId; funcId = MEM_GetSymbolIndex("DIA_Scatty_KirgoSuccess_Info");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Dialog function 'DIA_Scatty_KirgoSuccess_Info' not found");
        passed = FALSE;
    };

    // Find Kirgo
    var int symbId; symbId = MEM_GetSymbolIndex("GRD_251_KIRGO");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("NPC 'GRD_251_KIRGO' not found");
        passed = FALSE;
    };

    // Check if Kirgo exists in the world
    var C_Npc kirgo; kirgo = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(kirgo)) {
        G1CP_TestsuiteErrorDetail("NPC 'GRD_251_KIRGO' not valid");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Retrieve the content of the log topic string constant
    var string topic; topic = G1CP_GetStringVar("CH1_JoinOC", 0, "G1CP invalid string");

    // Backup the status of the log topic if it exists already
    G1CP_LogRenameTopic(topic, "G1CP test 133 temporary");

    // First pass: Create the log topic with the faulty entry and see if the fix will update it

    // Create the topic
    Log_CreateTopic(topic, LOG_MISSION);
    Log_SetTopicStatus(topic, LOG_RUNNING);
    Log_AddEntry(topic, wrong);

    // Trigger the fix (careful now, don't overwrite the fix status!)
    var int r; r = G1CP_133_DE_LogEntryScatty();

    // Check if it was updated
    if (G1CP_LogHasEntry(topic, wrong)) {
        G1CP_TestsuiteErrorDetail("Log topic entry (incorrect) remained unchanged");
        passed = FALSE;
    };
    if (!G1CP_LogHasEntry(topic, right)) {
        G1CP_TestsuiteErrorDetail("Log topic entry (correct) does not exist");
        passed = FALSE;
    };
    G1CP_LogRemoveTopic(topic);

    // Second pass: Call the dialog function and observe if it creates the corrected entry

    // Backup values
    var int aivarBak; aivarBak = G1CP_GetAIVar(kirgo, "AIV_HASDEFEATEDSC", FALSE);
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set new values
    G1CP_SetAIVar(kirgo, "AIV_HASDEFEATEDSC", TRUE);
    self  = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Call dialog condition function
    MEM_CallByID(funcId);

    // Restore values
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);
    G1CP_SetAIVar(kirgo, "AIV_HASDEFEATEDSC", aivarBak);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Check if it was updated
    if (G1CP_LogHasEntry(topic, wrong)) {
        G1CP_TestsuiteErrorDetail("Log topic entry was created with incorrect wording");
        passed = FALSE;
    };
    if (!G1CP_LogHasEntry(topic, right)) {
        G1CP_TestsuiteErrorDetail("Log topic entry was not added by the dialog function");
        passed = FALSE;
    };
    G1CP_LogRemoveTopic(topic);

    // Restore the topic to how it was before
    G1CP_LogRenameTopic("G1CP test 133 temporary", topic);

    // Return success
    return passed;
};

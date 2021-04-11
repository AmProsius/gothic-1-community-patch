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

    // Define variables for specific test
    const string wrongLogEntry = "Meinem Niederlage gegen Kirgo hat Scatty nicht sehr beeindruckt.";
    const string rightLogEntry = "Meine Niederlage gegen Kirgo hat Scatty nicht sehr beeindruckt.";
    const string logTopicName = "CH1_JoinOC";
    const string dialogFunctionName = "DIA_Scatty_KirgoSuccess_Info";
    const string npcName = "GRD_251_KIRGO";
    const int fixNumber = 133;

    // Define variables for concatenated strings
    var string msg;
    var string newName;

    // Check language first
    if (G1CP_Lang != G1CP_Lang_DE) {
        G1CP_TestsuiteErrorDetail("Test applicable for German localization only");
        return TRUE; // True?
    };

    // Check if the constant exists
    if (MEM_GetSymbolIndex(logTopicName) == -1) {
        msg = ConcatStrings("Variable '", logTopicName);
        msg = ConcatStrings(msg, "' not found");
        G1CP_TestsuiteErrorDetail(msg);
        passed = FALSE;
    };

    // Check if the dialog function exists
    var int funcId; funcId = MEM_GetSymbolIndex(dialogFunctionName);
    if (funcId == -1) {
        msg = ConcatStrings("Dialog function '", dialogFunctionName);
        msg = ConcatStrings(msg, "' not found");
        G1CP_TestsuiteErrorDetail(msg);
        passed = FALSE;
    };

    // Find NPC
    var int symbId; symbId = MEM_GetSymbolIndex(npcName);
    if (symbId == -1) {
        msg = ConcatStrings("NPC '", npcName);
        msg = ConcatStrings(msg, "' not found");
        G1CP_TestsuiteErrorDetail(msg);
        passed = FALSE;
    };

    // Check if NPC exists in the world
    var C_Npc npc; npc = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(npc)) {
        msg = ConcatStrings("NPC '", npcName);
        msg = ConcatStrings(msg, "' not valid");
        G1CP_TestsuiteErrorDetail(msg);
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Retrieve the content of the log topic string constant
    var string topic; topic = G1CP_GetStringConst(logTopicName, 0, "G1CP invalid string");

    // Backup the status of the log topic if it exists already
    newName = ConcatStrings("G1CP test ", IntToString(fixNumber));
    newName = ConcatStrings(newName, " temporary");
    G1CP_LogRenameTopic(topic, newName);

    // First pass: Create the log topic with the faulty entry and see if the fix will update it

    // Create the topic
    Log_CreateTopic(topic, LOG_MISSION);
    Log_SetTopicStatus(topic, LOG_RUNNING);
    Log_AddEntry(topic, wrongLogEntry);

    // Trigger the fix (careful now, don't overwrite the fix status!)
    var int r; r = G1CP_133_DE_LogEntryScatty();

    // Check if it was updated
    if (G1CP_LogHasEntry(topic, wrongLogEntry)) {
        G1CP_TestsuiteErrorDetail("Log topic entry (incorrect) remained unchanged");
        passed = FALSE;
    };
    if (!G1CP_LogHasEntry(topic, rightLogEntry)) {
        G1CP_TestsuiteErrorDetail("Log topic entry (correct) does not exist");
        passed = FALSE;
    };
    G1CP_LogRemoveTopic(topic);

    // Second pass: Call the dialog function and observe if it creates the corrected entry

    // Backup values
    var int aivarBak; aivarBak = G1CP_NpcGetAIVar(npc, "AIV_HASDEFEATEDSC", FALSE);
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set new values
    G1CP_NpcSetAIVar(npc, "AIV_HASDEFEATEDSC", TRUE);
    self  = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Create the topic
    Log_CreateTopic(topic, LOG_MISSION);
    Log_SetTopicStatus(topic, LOG_RUNNING);

    // Call dialog condition function
    MEM_CallByID(funcId);

    // Restore values
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);
    G1CP_NpcSetAIVar(npc, "AIV_HASDEFEATEDSC", aivarBak);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Check if it was updated
    if (G1CP_LogHasEntry(topic, wrongLogEntry)) {
        G1CP_TestsuiteErrorDetail("Log topic entry was created with incorrect wording");
        passed = FALSE;
    };
    if (!G1CP_LogHasEntry(topic, rightLogEntry)) {
        G1CP_TestsuiteErrorDetail("Log topic entry was not added by the dialog function");
        passed = FALSE;
    };
    G1CP_LogRemoveTopic(topic);

    // Restore the topic to how it was before
    G1CP_LogRenameTopic(newName, topic);

    // Return success
    return passed;
};

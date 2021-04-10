/*
 * #37 Gravo not listed as merchant
 *
 * Check if the dialog creates the topic if it did not exist and if the log entry appears when applying the fix.
 *
 * Expected behavior: The log topic is correctly created in both cases.
 */
func int G1CP_Test_037() {
    var int passed; passed = TRUE;

    // Parameters of this fix
    const string topicSymbName = "GE_TraderOC";
    const string infoSymbName  = "DIA_Gravo_HelpHow";
    const string funcSymbName  = "DIA_Gravo_HelpHow_Info";
    const string tempTopicName = "G1CP Test 37";

    // Check if dialog exists
    var int infoId; infoId = MEM_GetSymbolIndex(infoSymbName);
    if (infoId == -1) {
        G1CP_TestsuiteErrorDetail(ConcatStrings(ConcatStrings("Dialog '", infoSymbName), "' not found"));
        passed = FALSE;
    };

    // Check if dialog function exists
    var int funcId; funcId = MEM_GetSymbolIndex(funcSymbName);
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail(ConcatStrings(ConcatStrings("Dialog function '", funcSymbName), "' not found"));
        passed = FALSE;
    };

    // Check if the constant exists
    if (MEM_GetSymbolIndex(topicSymbName) == -1) {
        G1CP_TestsuiteErrorDetail(ConcatStrings(ConcatStrings("Variable '", topicSymbName), "' not found"));
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Retrieve the content of the log topic string constant
    var string topic; topic = G1CP_GetStringConst(topicSymbName, "G1CP invalid string");

    // First test: Check if the dialog function creates the topic if it did not exist beforehand

    // Rename the log topic if it already exists
    G1CP_LogRenameTopic(topic, tempTopicName);

    // Backup and set self and other
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);
    self  = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Just run the dialog and see what happens
    MEM_CallByID(funcId);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Restore self and other
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Check if the log entry was created
    if (!G1CP_LogGetTopic(topic)) {
        G1CP_TestsuiteErrorDetail("Log topic was not created by the dialog function");
        passed = FALSE;
    };

    // Clean up
    G1CP_LogRemoveTopic(topic);

    // Second test: Check if the log entry is created on applying the fix
    // This second test is specific to how the G1CP fixes the bug and will fail if a mod fixed the issue in another way
    var int r;

    // Backup the told status of the dialog
    var int toldBak; toldBak = Npc_KnowsInfo(hero, infoId);

    // Revert the fix
    r = G1CP_037_LogEntryGravoMerchantRevert();

    // Set the dialog to told
    G1CP_SetInfoTold(infoSymbName, TRUE);

    // Re-apply the fix
    r = G1CP_037_LogEntryGravoMerchant();

    // Check if the topic was created
    if (!G1CP_LogGetTopic(topic)) {
        G1CP_TestsuiteErrorDetail("Log topic was not auto-created on applying the fix");
        passed = FALSE;
    };

    // Revert everything
    r = G1CP_037_LogEntryGravoMerchantRevert();
    G1CP_SetInfoTold(infoSymbName, toldBak);
    r = G1CP_037_LogEntryGravoMerchant();
    G1CP_LogRemoveTopic(topic);
    G1CP_LogRenameTopic(tempTopicName, topic);

    // Return success
    return passed;
};

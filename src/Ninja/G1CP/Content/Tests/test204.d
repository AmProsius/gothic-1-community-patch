/*
 * #204 Cavalorn not listed as tutor
 *
 * Check if the dialog creates the topic if it did not exist.
 *
 * Expected behavior: The log topic is correctly created.
 */
func int G1CP_Test_204() {
    var int passed; passed = TRUE;

    // Parameters of this fix
    const string topicSymbName = "GE_TeacherOW";
    const string funcSymbName  = "DIA_Fingers_WhereCavalorn_Info";
    const string tempTopicName = "G1CP Test 204";

    // Check if dialog function exists
    var int funcId; funcId = G1CP_GetFuncID(funcSymbName, "void|none");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail(ConcatStrings(ConcatStrings("Dialog function '", funcSymbName), "' not found"));
        passed = FALSE;
    };

    // Check if the constant exists
    if (!G1CP_IsStringConst(topicSymbName, 0)) {
        G1CP_TestsuiteErrorDetail(ConcatStrings(ConcatStrings("String constant '", topicSymbName), "' not found"));
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Retrieve the content of the log topic string constant
    var string topic; topic = G1CP_GetStringConst(topicSymbName, 0, "G1CP invalid string");

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

    // Revert everything
    G1CP_LogRemoveTopic(topic);
    G1CP_LogRenameTopic(tempTopicName, topic);

    // Return success
    return passed;
};

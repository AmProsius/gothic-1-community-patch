/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    {LANGCHECK}
    const string symbolName = "### TODO: Symbol name ###";
    const string correctedString = "### TODO: Corrected string ###";
    var int symbId; symbId = G1CP_Testsuite_GetStringConst(symbolName, 0);

    const int LOG_MISSION = 0;

    var int passed; passed = TRUE;

    if (!Hlp_StrCmp(symbId, correctedString)) {
        G1CP_TestsuiteErrorDetailSSS("Topic name string constant has incorrect content: '", symbId, "'");
        passed = FALSE;
    };

    var int topicBakPtr; topicBakPtr = G1CP_LogGetTopic(symbId);
    var int r; r = G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}Revert();
    Log_CreateTopic(symbId, LOG_MISSION);
    var int topicTempPtr; topicTempPtr = G1CP_LogGetTopic(symbId);
    r = G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}();

    if (!topicTempPtr) {
        G1CP_TestsuiteErrorDetail("Log topic could not be created");
        return FALSE;
    };

    var oCLogTopic topicTemp; topicTemp = _^(topicTempPtr);
    if (!Hlp_StrCmp(topicTemp.m_strDescription, correctedString)) {
        G1CP_TestsuiteErrorDetailSSS("Log topic name was not updated: '", topicTemp.m_strDescription, "'");
        passed = FALSE;
    };

    if (topicTempPtr != topicBakPtr) {
        G1CP_LogRemoveTopic(topicTemp.m_strDescription);
    };

    return passed;
};

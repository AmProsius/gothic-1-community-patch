/*
 * #21 Fletcher reopens closed quest
 */
func int G1CP_021_FletcherClosedQuest() {
    var int applied1; var int applied2;

    // Check if necessary symbols exist
    var int funcId; funcId = MEM_FindParserSymbol("DIA_Fletcher_WoNek_Info");
    if (funcId == -1) {
        return FALSE;
    };

    // Get the symbol indices of all functions
    var int createOrgId; createOrgId = MEM_GetFuncId(Log_CreateTopic);
    var int statusOrgId; statusOrgId = MEM_GetFuncId(Log_SetTopicStatus);
    var int createNewId; createNewId = MEM_GetFuncId(G1CP_021_CreateTopic);
    var int statusNewId; statusNewId = MEM_GetFuncId(G1CP_021_SetTopicStatus);

    // Replace any function calls to Log_CreateTopic and Log_SetTopicStatus
    applied1 = G1CP_ReplaceCallInFunc(funcId, createOrgId, createNewId);
    applied2 = G1CP_ReplaceCallInFunc(funcId, statusOrgId, statusNewId);

    // Revert any changes if not BOTH were replaced
    if (!applied1) || (!applied2) {
        var int r;
        r = G1CP_ReplaceCallInFunc(funcId, createNewId, createOrgId);
        r = G1CP_ReplaceCallInFunc(funcId, statusNewId, statusOrgId);
        return FALSE;
    };

    // Return true only if both were replaced
    return TRUE;
};

/*
 * Determine if changing the status of the topic is allowed
 */
func int G1CP_021_AllowTopicCall(var string topic) {
    // Define possibly missing symbols locally
    const int GIL_NONE    = 0;
    const int LOG_SUCCESS = 2;

    // Allow to open topic if ...
    return (G1CP_GetTopicStatus(topic) != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NONE);
};

/*
 * Wrapper function for Log_CreateTopic
 */
func void G1CP_021_CreateTopic(var string topic, var int section) {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int LOG_MISSION = 0;

    if (G1CP_021_AllowTopicCall(topic)) || (section != LOG_MISSION) {
        Log_CreateTopic(topic, section);
    };
};

/*
 * Wrapper function for G1CP_021_SetTopicStatus
 */
func void G1CP_021_SetTopicStatus(var string topic, var int newStatus) {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int LOG_RUNNING = 1;

    if (G1CP_021_AllowTopicCall(topic)) || (newStatus != LOG_RUNNING) {
        Log_SetTopicStatus(topic, newStatus);
    };
};


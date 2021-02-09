/*
 * #21 Fletcher reopens closed quest
 */
func int Ninja_G1CP_021_FletcherClosedQuest() {
    var int applied1; applied1 = FALSE;
    var int applied2; applied2 = FALSE;

    // Check if necessary symbols exist
    var int funcId; funcId = MEM_FindParserSymbol("DIA_Fletcher_WoNek_Info");
    if (funcId == -1) || (MEM_FindParserSymbol("Sly_LostNek") == -1) {
        return FALSE;
    };

    var int matches;
    var int s;
    var int funcOffset;

    // Find "Log_CreateTopic(xxxx, xxxx)" in the function
    s = SB_New();
    SBc(zPAR_TOK_CALLEXTERN); SBw(MEM_FindParserSymbol("Log_CreateTopic"));
    matches = Ninja_G1CP_FindInFunc(funcId, SB_GetStream(), SB_Length());
    SB_Destroy();

    funcOffset = MEM_GetFuncOffset(Ninja_G1CP_021_CreateTopic);

    // Iterate over all matches
    repeat(i, MEM_ArraySize(matches)); var int i;

        // Overwrite "Log_CreateTopic(xxxx, xxxx)" with "Ninja_G1CP_021_CreateTopic(xxxx, xxxx)"
        var int pos; pos = MEM_ArrayRead(matches, i);
        MEM_WriteByte(pos, zPAR_TOK_CALL);
        MEM_WriteInt(pos+1, funcOffset);

        applied1 += 1;
    end;

    // Find "Log_SetTopicStatus(xxxx, xxxx)" in the function
    s = SB_New();
    SBc(zPAR_TOK_CALLEXTERN); SBw(MEM_FindParserSymbol("Log_SetTopicStatus"));
    matches = Ninja_G1CP_FindInFunc(funcId, SB_GetStream(), SB_Length());
    SB_Destroy();

    funcOffset = MEM_GetFuncOffset(Ninja_G1CP_021_SetTopicStatus);

    // Iterate over all matches
    repeat(i, MEM_ArraySize(matches)); var int i;

        // Overwrite "Log_SetTopicStatus(xxxx, xxxx)" with "Ninja_G1CP_021_SetTopicStatus(xxxx, xxxx)"
        var int pos; pos = MEM_ArrayRead(matches, i);
        MEM_WriteByte(pos, zPAR_TOK_CALL);
        MEM_WriteInt(pos+1, funcOffset);

        applied2 += 1;
    end;

    return (applied1) && (applied2);
};

/*
 * Give the desired log status, check if changing it is allowed
 */
func int Ninja_G1CP_021_AllowTopicCall(var int status) {
    const int GIL_NONE    = 0;
    const int LOG_RUNNING = 1;
    const int LOG_SUCCESS = 2;

    // Find "Sly_LostNek"
    var int Sly_LostNek; Sly_LostNek = 0;
    var int symbPtr; symbPtr = MEM_GetSymbol("Sly_LostNek");
    if (symbPtr) {
        Sly_LostNek = MEM_ReadInt(symbPtr + zCParSymbol_content_offset);
    };

    // Allow to create topic if ...
    return (status != LOG_RUNNING) || ((Sly_LostNek != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NONE));
};

/*
 * Wrapper function for Log_CreateTopic
 */
func void Ninja_G1CP_021_CreateTopic(var string topic, var int section) {
    Ninja_G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;

    if (Ninja_G1CP_021_AllowTopicCall(LOG_RUNNING)) // There is no status for Log_CreateTopic
    || (section != LOG_MISSION) {
        Log_CreateTopic(topic, section);
    };
};

/*
 * Wrapper function for Ninja_G1CP_021_SetTopicStatus
 */
func void Ninja_G1CP_021_SetTopicStatus(var string topic, var int status) {
    Ninja_G1CP_ReportFuncToSpy();

    if (Ninja_G1CP_021_AllowTopicCall(status)) {
        Log_SetTopicStatus(topic, status);
    };
};


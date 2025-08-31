/* Byte code stream rebuilt for each test to restore backups */
const int G1CP_TestsuiteBackupStream = 0;

/*
 * Initialize the byte code stream for restoring backups.
 */
func void G1CP_Testsuite_BackupInit() {
    if (G1CP_TestsuiteBackupStream) {
        return;
    };
    var int s; s = SB_Get();
    G1CP_TestsuiteBackupStream = SB_New();
    SB_InitBuffer(128);
    SB_Use(s);
};

/*
 * Execute the byte code that restores the backup values to their origin.
 */
func void G1CP_Testsuite_Restore() {
    SB_Use(G1CP_TestsuiteBackupStream);
    if (SB_Length()) {
        SBc(zPAR_TOK_RET);
        MEM_CallByPtr(SB_GetStream());
        SB_SetLength(0); // Keep the memory allocated and just clear the length written
    };
};

/*
 * Backup an integer value at a certain address.
 */
func void G1CP_Testsuite_BackupIntAddr(var int addr) {
    SB_Use(G1CP_TestsuiteBackupStream);
    SBc(zPAR_TOK_PUSHINT);     SBw(addr);
    SBc(zPAR_TOK_PUSHINT);     SBw(MEM_ReadInt(addr));
    SBc(zPAR_TOK_CALL);        SBw(MEM_GetFuncOffset(MEM_WriteInt));
};

/*
 * Backup a string at a certain address.
 */
func void G1CP_Testsuite_BackupStrAddr(var int addr) {
    // Backup the string to a unique address (freed below)
    var int strCopyAddr; strCopyAddr = MEM_Alloc(sizeof_zString);
    MEM_WriteString(strCopyAddr, MEM_ReadString(addr));

    SB_Use(G1CP_TestsuiteBackupStream);
    SBc(zPAR_TOK_PUSHINT);     SBw(addr);
    SBc(zPAR_TOK_PUSHINT);     SBw(strCopyAddr);
    SBc(zPAR_TOK_CALL);        SBw(MEM_GetFuncOffset(MEM_WriteString));
    SBc(zPAR_TOK_PUSHINT);     SBw(strCopyAddr);
    SBc(zPAR_TOK_CALL);        SBw(MEM_GetFuncOffset(MEM_Free));
};

/*
 * Backup an integer symbol.
 */
func void G1CP_Testsuite_BackupInt(var int symbId, var int arrIdx) {
    SB_Use(G1CP_TestsuiteBackupStream);
    SBc(zPAR_TOK_PUSHINT);     SBw(G1CP_GetIntI(symbId, arrIdx, 0));
    if (arrIdx > 1) {
        SBc(zPAR_TOK_PUSH_ARRAYVAR); SBw(symbId); SBw(arrIdx);
    } else {
        SBc(zPAR_TOK_PUSHVAR); SBw(symbId);
    };
    SBc(zPAR_OP_IS);
};

/*
 * Backup a string symbol.
 */
func void G1CP_Testsuite_BackupStr(var int symbId, var int arrIdx) {
    G1CP_Testsuite_BackupStrAddr(G1CP_GetStringAddr(MEM_GetSymbolByIndex(symbId), arrIdx, 0));
};

/*
 * Backup the "true" guild of an NPC.
 */
func void G1CP_Testsuite_BackupTrueGuild(var C_Npc slf) {
    SB_Use(G1CP_TestsuiteBackupStream);
    SBc(zPAR_TOK_PUSHINST);    SBw(Hlp_GetInstanceId(slf));
    SBc(zPAR_TOK_PUSHINT);     SBw(Npc_GetTrueGuild(hero));
    SBc(zPAR_TOK_CALLEXTERN);  SBw(MEM_GetFuncId(Npc_SetTrueGuild));
};

/*
 * Backup the told-status of a C_Info (used with Npc_KnowsInfo).
 */
func void G1CP_Testsuite_BackupTold(var int infoId) {
    SB_Use(G1CP_TestsuiteBackupStream);
    SBc(zPAR_TOK_PUSHINT);     SBw(infoId);
    SBc(zPAR_TOK_PUSHINT);     SBw(Npc_KnowsInfo(hero, infoId)); // NPC instance does not matter
    SBc(zPAR_TOK_CALL);        SBw(MEM_GetFuncOffset(G1CP_SetInfoToldI));
};

/*
 * Backup an AI-variable of an NPC.
 */
func void G1CP_Testsuite_BackupAiVar(var C_Npc slf, var int aiVarId) {
    SB_Use(G1CP_TestsuiteBackupStream);
    SBc(zPAR_TOK_PUSHINST);    SBw(Hlp_GetInstanceId(slf));
    SBc(zPAR_TOK_PUSHINT);     SBw(aiVarId);
    SBc(zPAR_TOK_PUSHINT);     SBw(G1CP_NpcGetAiVarI(slf, aiVarId, 0));
    SBc(zPAR_TOK_CALL);        SBw(MEM_GetFuncOffset(G1CP_NpcSetAiVarI));
};

/*
 * Backup the (temporary) attitude of an NPC towards another NPC.
 */
func void G1CP_Testsuite_BackupAttitude(var C_Npc slf, var C_Npc oth) {
    SB_Use(G1CP_TestsuiteBackupStream);
    SBc(zPAR_TOK_PUSHINST);    SBw(Hlp_GetInstanceId(slf));
    SBc(zPAR_TOK_PUSHINST);    SBw(Npc_GetAttitude(slf, oth));
    SBc(zPAR_TOK_CALLEXTERN);  SBw(MEM_GetFuncId(Npc_SetTempAttitude));
};

/*
 * Backup the exact number of an item in an NPC's inventory.
 */
func void G1CP_Testsuite_BackupInvAmount(var C_Npc slf, var int itemId) {
    SB_Use(G1CP_TestsuiteBackupStream);
    SBc(zPAR_TOK_PUSHINST);    SBw(Hlp_GetInstanceId(slf));
    SBc(zPAR_TOK_PUSHINT);     SBw(itemId);
    SBc(zPAR_TOK_PUSHINT);     SBw(Npc_HasItems(slf, itemId));
    SBc(zPAR_TOK_CALL);        SBw(MEM_GetFuncOffset(G1CP_Testsuite_NpcSetInvItemAmount));
};

/*
 * Backup the talent skill of an NPC.
 */
func void G1CP_Testsuite_BackupTalentSkill(var C_Npc slf, var int skill) {
    SB_Use(G1CP_TestsuiteBackupStream);
    SBc(zPAR_TOK_PUSHINST);    SBw(Hlp_GetInstanceId(slf));
    SBc(zPAR_TOK_PUSHINT);     SBw(skill);
    SBc(zPAR_TOK_PUSHINT);     SBw(Npc_GetTalentSkill(slf, skill));
    SBc(zPAR_TOK_CALLEXTERN);  SBw(MEM_GetFuncId(Npc_SetTalentSkill));
};

/*
 * Backup the active routine of an NPC.
 */
func void G1CP_Testsuite_BackupRoutine(var C_Npc slf) {
    SB_Use(G1CP_TestsuiteBackupStream);
    SBc(zPAR_TOK_PUSHINST);    SBw(Hlp_GetInstanceId(slf));
    SBc(zPAR_TOK_PUSHINT);     SBw(G1CP_NpcGetRoutine(slf));
    SBc(zPAR_TOK_CALL);        SBw(MEM_GetFuncOffset(G1CP_NpcExchangeRoutineI));
};

/*
 * Backup the status of a log topic. It's better to completely back up the topic instead (below).
 */
func void G1CP_Testsuite_BackupTopicStatus(var string topic) {
    // Backup the string to a unique address (freed below)
    var int topicAddr; topicAddr = MEM_Alloc(sizeof_zString);
    MEM_WriteString(topicAddr, topic);

    var int status; status = G1CP_LogGetTopicStatus(topic);

    SB_Use(G1CP_TestsuiteBackupStream);
    SBc(zPAR_TOK_PUSHINT);     SBw(topicAddr);
    if (status == -1) {
        // Remove if it did not exist
        SBc(zPAR_TOK_CALL);    SBw(MEM_GetFuncOffset(G1CP_LogRemoveTopic));
    } else {
        // Otherwise reinstate its status
        SBc(zPAR_TOK_PUSHINT); SBw(status);
        SBc(zPAR_TOK_CALLEXTERN); SBw(MEM_GetFuncId(Log_SetTopicStatus));
    };
    SBc(zPAR_TOK_PUSHINT);     SBw(topicAddr);
    SBc(zPAR_TOK_CALL);        SBw(MEM_GetFuncOffset(MEM_Free));
};

/*
 * Backup the a log topic by renaming it to a unique topic name.
 */
func void G1CP_Testsuite_BackupTopic(var string topic) {
    // Temporary, unique topic name
    const int cycle = 0; cycle += 1;
    const string s0 = "G1CP_TESTING_TOPIC_";
    var string tmpTopic; tmpTopic = ConcatStrings(s0, IntToString(cycle));

    // Backup the strings to unique addresses (freed below)
    var int tmpTopicAddr; tmpTopicAddr = MEM_Alloc(sizeof_zString);
    var int topicAddr; topicAddr = MEM_Alloc(sizeof_zString);
    MEM_WriteString(tmpTopicAddr, tmpTopic);
    MEM_WriteString(topicAddr, topic);

    // Rename potentially existing topic to back it up
    G1CP_LogRemoveTopic(tmpTopic); // Remove any left-overs
    G1CP_LogRenameTopic(topic, tmpTopic);

    SB_Use(G1CP_TestsuiteBackupStream);
    SBc(zPAR_TOK_PUSHINT);     SBw(topicAddr);
    SBc(zPAR_TOK_CALL);        SBw(MEM_GetFuncOffset(G1CP_LogRemoveTopic));
    SBc(zPAR_TOK_PUSHINT);     SBw(tmpTopicAddr);
    SBc(zPAR_TOK_PUSHINT);     SBw(topicAddr);
    SBc(zPAR_TOK_CALL);        SBw(MEM_GetFuncOffset(G1CP_LogRenameTopic));
    SBc(zPAR_TOK_PUSHINT);     SBw(tmpTopicAddr);
    SBc(zPAR_TOK_CALL);        SBw(MEM_GetFuncOffset(MEM_Free));
    SBc(zPAR_TOK_PUSHINT);     SBw(topicAddr);
    SBc(zPAR_TOK_CALL);        SBw(MEM_GetFuncOffset(MEM_Free));
};

/*
 * Backup the world time.
 */
func void G1CP_Testsuite_BackupWldTime() {
    var int timeBak; timeBak = G1CP_GetWorldTime();
    SB_Use(G1CP_TestsuiteBackupStream);
    SBc(zPAR_TOK_PUSHINT);     SBw(timeBak / 100);
    SBc(zPAR_TOK_PUSHINT);     SBw(timeBak % 100);
    SBc(zPAR_TOK_CALLEXTERN);  SBw(MEM_GetFuncId(Wld_SetTime));
};

/*
 * Backup fix status to later freshly revert and apply the fix. If used, this must always be the LAST backup of a test.
 */
func void G1CP_Testsuite_BackupFixStatus() {
    var int fixId; fixId = G1CP_Testsuite_FindCallerTestId();
    SB_Use(G1CP_TestsuiteBackupStream);
    SBc(zPAR_TOK_PUSHINT);     SBw(fixId);
    SBc(zPAR_TOK_CALL);        SBw(MEM_GetFuncOffset(G1CP_Testsuite_RevertFix));
    SBc(zPAR_TOK_PUSHINT);     SBw(fixId);
    SBc(zPAR_TOK_CALL);        SBw(MEM_GetFuncOffset(G1CP_Testsuite_ApplyFix));
};

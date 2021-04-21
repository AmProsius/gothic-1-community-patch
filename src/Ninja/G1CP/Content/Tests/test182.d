/*
 * #182 The gate guard can be bribed multiple times with Dusty as a follower
 *
 * The bribe function is executed and the dialog condition is called.
 *
 * Expected behavior: The dialog condition function returns false.
 */
func int G1CP_Test_182() {
    const string TEMP_TOPIC_NAME = "G1CP invalid topic 182";
    const string CH1_RecruitDusty = ""; CH1_RecruitDusty = G1CP_Testsuite_GetStringConst("CH1_RecruitDusty", 0);
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_Grd_216_DustyZoll_LittleWalk");
    var int condId; condId = G1CP_Testsuite_CheckDialogConditionFunc("DIA_Grd_216_DustyZoll_Condition");
    var int oreId; oreId = G1CP_Testsuite_CheckItem("ItMiNugget");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("Vlk_524_Dusty");
    var int aiVarId; aiVarId = G1CP_Testsuite_CheckIntConst("AIV_PARTYMEMBER", 0);
    G1CP_Testsuite_CheckPassed();

    // Define possibly missing symbols locally
    const int LOG_MISSION = 0;

    // Backup values
    var int amountBefore; amountBefore = Npc_HasItems(hero, oreId);
    var int expBefore; expBefore = hero.exp;
    var int expNxtBefore; expNxtBefore = hero.exp_next;
    var int expLpBefore; expLpBefore = hero.lp;
    var int lvlBefore; lvlBefore = hero.level;
    var int aivBak; aivBak = G1CP_NpcGetAiVarI(npc, aiVarId, 0);
    var string npcWp; npcWp = Npc_GetNearestWp(npc);
    G1CP_LogRenameTopic(CH1_RecruitDusty, TEMP_TOPIC_NAME);

    // Remove all ore
    if (amountBefore > 0) {
        Npc_RemoveInvItems(hero, oreId, amountBefore);
    };
    CreateInvItems(hero, oreId, 5000); // Should be enough

    // Create log topic
    Log_CreateTopic(CH1_RecruitDusty, LOG_MISSION);

    // Execute the bribe dialog function
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);

    // Satisfy dialog conditions
    G1CP_NpcSetAiVarI(npc, aiVarId, TRUE);
    G1CP_NpcBeamTo(npc, Npc_GetNearestWp(hero));

    // Call the condition function
    G1CP_Testsuite_Call(condId, 0, 0, TRUE);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    hero.exp = expBefore;
    hero.exp_next = expNxtBefore;
    hero.lp = expLpBefore;
    hero.level = lvlBefore;
    var int amountAfter; amountAfter = Npc_HasItems(hero, oreId);
    if (amountAfter > 0) {
        Npc_RemoveInvItems(hero, oreId, amountAfter);
    };
    if (amountBefore > 0) {
        CreateInvItems(hero, oreId, amountBefore);
    };
    G1CP_NpcSetAiVarI(npc, aiVarId, aivBak);
    G1CP_NpcBeamTo(npc, npcWp);
    G1CP_LogRemoveTopic(CH1_RecruitDusty);
    G1CP_LogRenameTopic(TEMP_TOPIC_NAME, CH1_RecruitDusty);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};

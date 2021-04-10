/*
 * #182 The gate guard can be bribed multiple times with Dusty as a follower
 *
 * The bribe function is executed and the dialog condition is called.
 *
 * Expected behavior: The dialog condition function returns false.
 */
func int G1CP_Test_182() {
    // Check status of the test
    var int passed; passed = TRUE;

    // Define possibly missing symbols locally
    const int LOG_MISSION = 0;

    // Check if the dialog function exists
    var int funcId; funcId = MEM_GetSymbolIndex("DIA_Grd_216_DustyZoll_LittleWalk");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Dialog function 'DIA_Grd_216_DustyZoll_LittleWalk' not found");
        passed = FALSE;
    };

    // Check if the dialog condition function exists
    var int condId; condId = MEM_GetSymbolIndex("DIA_Grd_216_DustyZoll_Condition");
    if (condId == -1) {
        G1CP_TestsuiteErrorDetail("Dialog condition 'DIA_Grd_216_DustyZoll_Condition' not found");
        passed = FALSE;
    };

    // Check if the log topic exists
    var string topic; topic = G1CP_GetStringVar("CH1_RecruitDusty", 0, "G1CP invalid string");
    if (Hlp_StrCmp(topic, "G1CP invalid string")) {
        G1CP_TestsuiteErrorDetail("Log topic constant 'CH1_RecruitDusty' not found");
        passed = FALSE;
    };

    // Check if the ore item exists
    var int oreId; oreId = MEM_GetSymbolIndex("ItMiNugget");
    if (oreId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'ItMiNugget' not found");
        passed = FALSE;
    };

    // Find NPC
    var int symbId; symbId = MEM_GetSymbolIndex("Vlk_524_Dusty");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("NPC 'Vlk_524_Dusty' not found");
        return FALSE; // Return immediately, because the last condition below would fail anyway
    };

    // Check if NPC exists in the world
    var C_Npc npc; npc = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(npc)) {
        G1CP_TestsuiteErrorDetail("NPC 'Vlk_524_Dusty' not valid");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Backup values
    var int amountBefore; amountBefore = Npc_HasItems(hero, oreId);
    var int expBefore; expBefore = hero.exp;
    var int expNxtBefore; expNxtBefore = hero.exp_next;
    var int expLpBefore; expLpBefore = hero.lp;
    var int lvlBefore; lvlBefore = hero.level;
    var int aivBak; aivBak = G1CP_NpcGetAIVar(npc, "AIV_PARTYMEMBER", 0);
    var string npcWp; npcWp = Npc_GetNearestWP(npc);
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);
    G1CP_LogRenameTopic(topic, "G1CP invalid topic 182");

    // Remove all ore
    if (amountBefore > 0) {
        Npc_RemoveInvItems(hero, oreId, amountBefore);
    };
    CreateInvItems(hero, oreId, 5000); // Should be enough

    // Create log topic
    Log_CreateTopic(topic, LOG_MISSION);

    // Set self and other
    self  = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Execute the bribe dialog function
    MEM_CallByID(funcId);

    // Satisfy dialog conditions
    G1CP_NpcSetAIVar(npc, "AIV_PARTYMEMBER", TRUE);
    G1CP_NpcBeamTo(npc, Npc_GetNearestWP(hero));


    // Call the condition function
    MEM_CallByID(condId);
    var int ret; ret = MEM_PopIntResult();

    // Restore self and other
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

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
    G1CP_NpcSetAIVar(npc, "AIV_PARTYMEMBER", aivBak);
    G1CP_NpcBeamTo(npc, npcWp);
    G1CP_LogRemoveTopic(topic);
    G1CP_LogRenameTopic("G1CP invalid topic 182", topic);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};

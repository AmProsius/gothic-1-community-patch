/*
 * #166 Ambient dialogs of rogue not available
 */
func void G1CP_Test_0166() {
    var int func1Id; func1Id = G1CP_Testsuite_CheckDialogConditionFunc("Info_ORG_829_SpecialInfo_Condition");
    var int func2Id; func2Id = G1CP_Testsuite_CheckDialogConditionFunc("Info_ORG_829_PERM_Condition");
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("Info_ORG_829_OfferJoint");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("ORG_829_Organisator");
    var int varId; varId = G1CP_Testsuite_CheckIntVar("Org_829_GotJoint");
    var int joint1Id; joint1Id = G1CP_Testsuite_CheckItem("ItMiJoint_1");
    var int joint2Id; joint2Id = G1CP_Testsuite_CheckItem("ItMiJoint_2");
    var int joint3Id; joint3Id = G1CP_Testsuite_CheckItem("ItMiJoint_3");

    G1CP_Testsuite_BackupInt(varId, 0);
    G1CP_Testsuite_BackupTold(infoId);
    G1CP_Testsuite_BackupInvAmount(npc, joint1Id);
    G1CP_Testsuite_BackupInvAmount(npc, joint2Id);
    G1CP_Testsuite_BackupInvAmount(npc, joint3Id);

    // Reset context to minimum
    G1CP_SetInfoToldI(infoId, FALSE);
    G1CP_Testsuite_NpcSetInvItemAmount(npc, joint1Id, 0);
    G1CP_Testsuite_NpcSetInvItemAmount(npc, joint2Id, 0);
    G1CP_Testsuite_NpcSetInvItemAmount(npc, joint3Id, 0);

    // Dialog conditions still return false if only the original variable is false
    G1CP_SetIntVarI(varId, 0, FALSE);
    G1CP_Testsuite_Call(func1Id, npc, hero, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
    G1CP_Testsuite_Call(func2Id, npc, hero, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);

    // Dialog conditions still return true if only the original variable is true
    G1CP_SetIntVarI(varId, 0, TRUE);
    G1CP_Testsuite_Call(func1Id, npc, hero, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), TRUE);
    G1CP_Testsuite_Call(func2Id, npc, hero, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), TRUE);

    // Set context for new conditions
    G1CP_SetInfoToldI(infoId, TRUE);
    G1CP_Testsuite_NpcSetInvItemAmount(npc, joint1Id, 1);
    G1CP_Testsuite_NpcSetInvItemAmount(npc, joint2Id, 0);
    G1CP_Testsuite_NpcSetInvItemAmount(npc, joint3Id, 0);

    // Dialog conditions now work based on told status and items
    G1CP_SetIntVarI(varId, 0, FALSE);
    G1CP_Testsuite_Call(func1Id, npc, hero, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), TRUE);
    G1CP_Testsuite_Call(func2Id, npc, hero, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), TRUE);

    // Dialog conditions are not impacted by new conditions
    G1CP_SetIntVarI(varId, 0, TRUE);
    G1CP_Testsuite_Call(func1Id, npc, hero, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), TRUE);
    G1CP_Testsuite_Call(func2Id, npc, hero, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), TRUE);
};

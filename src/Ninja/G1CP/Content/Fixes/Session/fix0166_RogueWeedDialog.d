/*
 * #166 Ambient dialogs of rogue not available
 */
func int G1CP_0166_RogueWeedDialog() {
    if (!G1CP_IsFunc("Info_ORG_829_SpecialInfo_Condition", "int|none"))
    || (!G1CP_IsIntVar("Org_829_GotJoint"))
    || (!G1CP_IsInfoInst("Info_ORG_829_OfferJoint"))
    || (!G1CP_IsItemInst("ItMiJoint_1"))
    || (!G1CP_IsItemInst("ItMiJoint_2"))
    || (!G1CP_IsItemInst("ItMiJoint_3")) {
        return FALSE;
    };

    HookDaedalusFuncS("Info_ORG_829_SpecialInfo_Condition", "G1CP_0166_RogueWeedDialog_Hook1");
    HookDaedalusFuncS("Info_ORG_829_PERM_Condition", "G1CP_0166_RogueWeedDialog_Hook2");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0166_RogueWeedDialog_Hook1() {
    G1CP_ReportFuncToSpy();

    // Symbol indices (existence confirmed by function above)
    var int joint1Id; joint1Id = MEM_GetSymbolIndex("ItMiJoint_1");
    var int joint2Id; joint2Id = MEM_GetSymbolIndex("ItMiJoint_2");
    var int joint3Id; joint3Id = MEM_GetSymbolIndex("ItMiJoint_3");
    var int gotJointId; gotJointId = MEM_GetSymbolIndex("Org_829_GotJoint");

    // Add the new conditions (other conditions remain untouched)
    var int cond1;
    var int cond2;
    var int cond3;
    var int cond4;

    // Check if dialog was told (check if symbol exists first!)
    cond1 = !Npc_KnowsInfo(hero, MEM_GetSymbolIndex("Info_ORG_829_OfferJoint"));

    // Check if NPC has a joint
    cond2 = !Npc_HasItems(self, joint1Id);
    cond3 = !Npc_HasItems(self, joint2Id);
    cond4 = !Npc_HasItems(self, joint3Id);

    // Return false if either of the conditions is true
    if (cond1) || (cond2 && cond3 && cond4) {
        return FALSE;
    };

    // Set the variable
    G1CP_SetIntVarI(gotJointId, 0, TRUE);

    // Continue with the original function
    ContinueCall();
};

/*
 * Exact copy of the function above. Need unique functions for both because of the way Daedalus hooks work
 */

func int G1CP_0166_RogueWeedDialog_Hook2() {
    G1CP_ReportFuncToSpy();

    // Symbol indices (existence confirmed by function above)
    var int joint1Id; joint1Id = MEM_GetSymbolIndex("ItMiJoint_1");
    var int joint2Id; joint2Id = MEM_GetSymbolIndex("ItMiJoint_2");
    var int joint3Id; joint3Id = MEM_GetSymbolIndex("ItMiJoint_3");
    var int gotJointId; gotJointId = MEM_GetSymbolIndex("Org_829_GotJoint");

    // Add the new conditions (other conditions remain untouched)
    var int cond1;
    var int cond2;
    var int cond3;
    var int cond4;

    // Check if dialog was told (check if symbol exists first!)
    cond1 = !Npc_KnowsInfo(hero, MEM_GetSymbolIndex("Info_ORG_829_OfferJoint"));

    // Check if NPC has a joint
    cond2 = !Npc_HasItems(self, joint1Id);
    cond3 = !Npc_HasItems(self, joint2Id);
    cond4 = !Npc_HasItems(self, joint3Id);

    // Return false if either of the conditions is true
    if (cond1) || (cond2 && cond3 && cond4) {
        return FALSE;
    };

    // Set the variable
    G1CP_SetIntVarI(gotJointId, 0, TRUE);

    // Continue with the original function
    ContinueCall();
};

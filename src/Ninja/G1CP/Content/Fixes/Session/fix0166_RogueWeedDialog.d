/*
 * #166 Ambient dialogs of rogue not available
 */
func int G1CP_0166_RogueWeedDialog() {
    var int condFunc1Id; condFunc1Id = G1CP_GetFuncId("Info_ORG_829_SpecialInfo_Condition", "int|none");
    var int condFunc2Id; condFunc2Id = G1CP_GetFuncId("Info_ORG_829_PERM_Condition", "int|none");
    if ((condFunc1Id == -1) && (condFunc2Id == -1)) // Either one exists
    || (!G1CP_IsIntVar("Org_829_GotJoint"))
    || (!G1CP_IsInfoInst("Info_ORG_829_OfferJoint"))
    || (!G1CP_IsItemInst("ItMiJoint_1"))
    || (!G1CP_IsItemInst("ItMiJoint_2"))
    || (!G1CP_IsItemInst("ItMiJoint_3")) {
        return FALSE;
    };

    // Replace all reads of 'Org_829_GotJoint' with the return value of 'G1CP_0166_RogueWeedDialog_VarContent'
    var int contentFuncId; contentFuncId = MEM_GetFuncID(G1CP_0166_RogueWeedDialog_VarContent);
    var int count; count = 0;
    if (condFunc1Id != -1) {
        count += G1CP_ReplaceIntRef(condFunc1Id, 0, "Org_829_GotJoint", contentFuncId);
    };
    if (condFunc2Id != -1) {
        count += G1CP_ReplaceIntRef(condFunc2Id, 0, "Org_829_GotJoint", contentFuncId);
    };

    return (count > 0);
};

/*
 * Return a manipulated content of 'Org_829_GotJoint' during all reads within the dialog condition functions
 */
func int G1CP_0166_RogueWeedDialog_VarContent() {
    // All symbols exist as established above
    var int Org_829_GotJoint; Org_829_GotJoint = G1CP_GetIntVar("Org_829_GotJoint", 0);
    var int Info_ORG_829_OfferJoint; Info_ORG_829_OfferJoint = MEM_GetSymbolIndex("Info_ORG_829_OfferJoint");
    var int ItMiJoint_1; ItMiJoint_1 = MEM_GetSymbolIndex("ItMiJoint_1");
    var int ItMiJoint_2; ItMiJoint_2 = MEM_GetSymbolIndex("ItMiJoint_2");
    var int ItMiJoint_3; ItMiJoint_3 = MEM_GetSymbolIndex("ItMiJoint_3");

    // Additional conditions
    var int offeredJoint; var int hasJoint;
    offeredJoint = Npc_KnowsInfo(hero, Info_ORG_829_OfferJoint);
    hasJoint = Npc_HasItems(self, ItMiJoint_1) || Npc_HasItems(self, ItMiJoint_2) || Npc_HasItems(self, ItMiJoint_3);

    // Return updated truth value instead of original
    return Org_829_GotJoint || (offeredJoint && hasJoint);
};

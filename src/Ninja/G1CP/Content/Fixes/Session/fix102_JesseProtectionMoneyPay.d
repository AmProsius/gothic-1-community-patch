/*
 * #102 The player doesn't lose ore when paying for Jesse
 */
func int Ninja_G1CP_102_JesseProtectionMoneyPay() {
    if (MEM_FindParserSymbol("Info_Bloodwyn_PayForJesse_Info") != -1)
    && (MEM_FindParserSymbol("Jesse_PayForMe")                 != -1)
    && (MEM_FindParserSymbol("ItMiNugget")                     != -1) {
        HookDaedalusFuncS("Info_Bloodwyn_PayForJesse_Info", "Ninja_G1CP_102_JesseProtectionMoneyPay_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog to introduce more actions
 */
func void Ninja_G1CP_102_JesseProtectionMoneyPay_Hook() {
    Ninja_G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int LOG_SUCCESS = 2;

    // Status before
    var int amountOreBefore;
    var int topicStatusBefore;

    // Remember how much ore the player has before the dialog
    var int oreId; oreId = MEM_FindParserSymbol("ItMiNugget");
    if (oreId != -1) {
        amountOreBefore = Npc_HasItems(hero, oreId);
    };

    // Remember the log topic status before the dialog
    var int topicPtr; topicPtr = MEM_GetSymbol("Jesse_PayForMe");
    if (topicPtr) {
        topicPtr += zCParSymbol_content_offset;
        topicStatusBefore = MEM_ReadInt(topicPtr);
    };

    // Continue with the original function
    ContinueCall();

    // Check if the topic was changed to successful, but no ore was deduced
    if (topicPtr) && (oreId != -1) {
        var int topicStatusAfter; topicStatusAfter = MEM_ReadInt(topicPtr);
        if (topicStatusAfter == LOG_SUCCESS) && (topicStatusAfter != topicStatusBefore)
        && (Npc_HasItems(hero, oreId) == amountOreBefore) {
            var int funcId; funcId = MEM_FindParserSymbol("B_GiveInvItems");
            if (funcId != -1) {
                // B_GiveInvItems(hero, self, ItMiNugget, 10)
                PassArgumentN(hero);
                PassArgumentN(self);
                MEM_PushIntParam(oreId);
                MEM_PushIntParam(10); // This is a guess!
                MEM_CallById(funcId);
            } else {
                // In case "B_GiveInvItems" does not exist
                Npc_RemoveInvItems(hero, oreId, 10);
                CreateInvItems(self, oreId, 10);
            };
        };
    };
};

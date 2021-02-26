/*
 * #109 The player doesn't lose ore when paying protection money to Bloodwyn again
 */
func int Ninja_G1CP_109_BloodwynProtectionMoneyPayLater() {
    if (MEM_FindParserSymbol("Info_Bloodwyn_PayDay_PayAgain") != -1)
    && (MEM_FindParserSymbol("ItMiNugget")                    != -1) {
        HookDaedalusFuncS("Info_Bloodwyn_PayDay_PayAgain", "Ninja_G1CP_109_BloodwynProtectionMoneyPayLater_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog to introduce more actions
 */
func void Ninja_G1CP_109_BloodwynProtectionMoneyPayLater_Hook() {
    Ninja_G1CP_ReportFuncToSpy();

    // Remember how much ore the player has before the dialog
    var int amountOreBefore;
    var int oreId; oreId = MEM_FindParserSymbol("ItMiNugget");
    if (oreId != -1) {
        amountOreBefore = Npc_HasItems(hero, oreId);
    };

    // Continue with the original function
    ContinueCall();

    // Check if no ore was deduced
    if (oreId != -1) {
        if (Npc_HasItems(hero, oreId) == amountOreBefore) {
            var int funcId; funcId = MEM_FindParserSymbol("B_GiveInvItems");
            if (funcId != -1) {
                // B_GiveInvItems(hero, self, ItMiNugget, 10)
                MEM_PushInstParam(hero);
                MEM_PushInstParam(self);
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

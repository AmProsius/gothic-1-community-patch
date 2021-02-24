/*
 * #111 The player doesn't lose ore when paying protection money to Jackal
 */
func int Ninja_G1CP_111_JackalProtectionMoneyPay() {
    if (MEM_FindParserSymbol("Info_Jackal_Hello_Pay") != -1)
    && (MEM_FindParserSymbol("Jackal_ProtectionPaid") != -1)
    && (MEM_FindParserSymbol("ItMiNugget")            != -1) {
        HookDaedalusFuncS("Info_Jackal_Hello_Pay", "Ninja_G1CP_111_JackalProtectionMoneyPay_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog to introduce more actions
 */
func void Ninja_G1CP_111_JackalProtectionMoneyPay_Hook() {
    Ninja_G1CP_ReportFuncToSpy();

    // Status before
    var int amountOreBefore;
    var int paidStatusBefore;

    // Remember how much ore the player has before the dialog
    var int oreId; oreId = MEM_FindParserSymbol("ItMiNugget");
    if (oreId != -1) {
        amountOreBefore = Npc_HasItems(hero, oreId);
    };

    // Remember the variable status before the dialog
    var int paidPtr; paidPtr = MEM_GetSymbol("Jackal_ProtectionPaid");
    if (paidPtr) {
        paidPtr += zCParSymbol_content_offset;
        paidStatusBefore = MEM_ReadInt(paidPtr);
    };

    // Continue with the original function
    ContinueCall();

    // Check if the variable was changed to successful, but no ore was deduced
    if (paidPtr) && (oreId != -1) {
        var int paidStatusAfter; paidStatusAfter = MEM_ReadInt(paidPtr);
        if (paidStatusAfter) && (paidStatusAfter != paidStatusBefore)
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

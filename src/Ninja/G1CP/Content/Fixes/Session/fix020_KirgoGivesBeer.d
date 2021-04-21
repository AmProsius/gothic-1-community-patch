/*
 * #20 Kirgo doesn't give a beer to the player
 */
func int G1CP_020_KirgoGivesBeer() {
    if (G1CP_IsFunc("Info_Kirgo_Charge_Beer", "void|none"))
    && (G1CP_IsFunc("B_GiveInvItems", "void|inst|inst|int|int"))
    && (G1CP_IsItemInst("ItFoBeer")) {
        HookDaedalusFuncS("Info_Kirgo_Charge_Beer", "G1CP_020_KirgoGivesBeer_Hook1");
        HookDaedalusFuncS("B_GiveInvItems", "G1CP_020_KirgoGivesBeer_Hook2");
        return TRUE;
    } else {
        return FALSE;
    };
};

/* Indicator if fix is running at the moment */
const int G1CP_020_KirgoGivesBeer_Active = FALSE;

/*
 * This function intercepts the dialog to introduce more conditions
 */
func void G1CP_020_KirgoGivesBeer_Hook1() {
    G1CP_ReportFuncToSpy();

    var int numBeers;

    // Set fix to running
    G1CP_020_KirgoGivesBeer_Active = TRUE;

    // Just create a beer for Kirgo regardless if he will be given one and remember how many beers the hero has
    var int symbId; symbId = MEM_GetSymbolIndex("ItFoBeer");
    if (symbId != -1) {
        CreateInvItem(self, symbId);
        numBeers = Npc_HasItems(hero, symbId);
    } else {
        numBeers = 0;
    };

    // Continue with the original function
    ContinueCall();

    // Check if hero now received two beers instead of one
    if (symbId != -1) {
        if (Npc_HasItems(hero, symbId) == numBeers+2) {
            Npc_RemoveInvItems(hero, symbId, 1);
        };
    };

    // Set fix to done
    G1CP_020_KirgoGivesBeer_Active = FALSE;
};

/*
 * Intercept B_GiveInvItems - make sure to only perform actions if the fix is in progress
 */
func void G1CP_020_KirgoGivesBeer_Hook2(var C_Npc giver, var C_Npc taker, var int itemInstance, var int amount) {
    G1CP_ReportFuncToSpy();

    // Only add actions if fix is currently in progress
    if (G1CP_020_KirgoGivesBeer_Active) {
        // Double check who is giving to who (don't check Kirgo, in case his instance name changed)
        if (Hlp_GetInstanceId(giver) == Hlp_GetInstanceId(hero)) {
            // Switch giver and taker
            giver = MEM_CpyInst(taker);
            taker = MEM_CpyInst(hero);
        };
    };

    // Continue with the original function
    PassArgumentN(giver);
    PassArgumentN(taker);
    PassArgumentI(itemInstance);
    PassArgumentI(amount);
    ContinueCall();
};

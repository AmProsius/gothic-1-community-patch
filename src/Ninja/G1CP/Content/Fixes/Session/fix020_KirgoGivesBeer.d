/*
 * #20 Kirgo doesn't give a beer to the player
 */
func void Ninja_G1CP_020_KirgoGivesBeer() {
    HookDaedalusFuncS("Info_Kirgo_Charge_Beer", "Ninja_G1CP_020_KirgoGivesBeer_Hook1");
    HookDaedalusFuncS("B_GiveInvItems", "Ninja_G1CP_020_KirgoGivesBeer_Hook2");
};

/* Indicator if fix is running at the moment */
const int Ninja_G1CP_020_KirgoGivesBeer_Active = FALSE;

/*
 * This function intercepts the dialog to introduce more conditions
 */
func void Ninja_G1CP_020_KirgoGivesBeer_Hook1() {
    var int numBeers;

    // Set fix to running
    Ninja_G1CP_020_KirgoGivesBeer_Active = TRUE;

    // Just create a beer for Kirgo regardless if he will be given one and remember how many beers the hero has
    var int symbId; symbId = MEM_FindParserSymbol("ItFoBeer");
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
    Ninja_G1CP_020_KirgoGivesBeer_Active = FALSE;
};

/*
 * Intercept B_GiveInvItems - make sure to only perform actions if the fix is in progress
 */
func void Ninja_G1CP_020_KirgoGivesBeer_Hook2(var C_Npc giver, var C_Npc taker, var int itemInstance, var int amount) {
    // Only add actions if fix is currently in progress
    if (Ninja_G1CP_020_KirgoGivesBeer_Active) {
        // Double check who is giving to who (don't check Kirgo, in case his instance name changed)
        if (Hlp_GetInstanceID(giver) == Hlp_GetInstanceID(hero)) {
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

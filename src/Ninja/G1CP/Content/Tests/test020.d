/*
 * #20 Kirgo doesn't give a beer to the player
 *
 * The dialog function is called (the dialog lines are aborted) and the number of beers in the hero inventory are
 * counted
 *
 * Expected behavior: The hero will receive one beer from Kirgo (automatically removed after the test is complete)
 */
func int G1CP_Test_020() {
    // Check status of the test
    var int passed; passed = TRUE;

    // Find Kirgo first
    var int symbId; symbId = MEM_GetSymbolIndex("Grd_251_Kirgo");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("NPC 'Grd_251_Kirgo' not found");
        passed = FALSE;
    };

    // Check if Kirgo exists in the world
    var C_Npc kirgo; kirgo = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(kirgo)) {
        G1CP_TestsuiteErrorDetail("NPC 'Grd_251_Kirgo' not valid");
        passed = FALSE;
    };

    // Check if the dialog function exists
    var int funcId; funcId = MEM_GetSymbolIndex("Info_Kirgo_Charge_Beer");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Dialog function 'Info_Kirgo_Charge_Beer' not found");
        passed = FALSE;
    };

    // Check if the beer item exists
    var int beerId; beerId = MEM_GetSymbolIndex("ItFoBeer");
    if (beerId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'ItFoBeer' not found");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Remember the number of beers the player has before
    CreateInvItem(hero, beerId); // Have at least one (to see if the number decreases)
    var int beersBefore; beersBefore = Npc_HasItems(hero, beerId);

    // Backup self and other
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set self and other
    self  = MEM_CpyInst(kirgo);
    other = MEM_CpyInst(hero);

    // Just run the dialog and see what happens
    MEM_CallByID(funcId);

    // Restore self and other
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Check how many beers the player has now
    var int beersAfter; beersAfter = Npc_HasItems(hero, beerId);

    // Revert to the previous number
    if (beersAfter < beersBefore-1) {
        CreateInvItems(hero, beerId, (beersBefore-1) - beersAfter);
    } else if (beersAfter > beersBefore-1) {
        Npc_RemoveInvItems(hero, beerId, beersAfter - (beersBefore-1));
    };

    // Confirm that the fix worked
    var string msg;
    if (beersAfter == beersBefore) {
        G1CP_TestsuiteErrorDetail("The hero did not receive a beer");
        return FALSE;
    } else if (beersAfter > beersBefore+1) {
        msg = ConcatStrings("The hero received ", IntToString(beersAfter-(beersBefore+1)));
        msg = ConcatStrings(msg, " beers too many");
        G1CP_TestsuiteErrorDetail(msg);
        return FALSE;
    } else if (beersAfter < beersBefore) {
        msg = ConcatStrings("The hero lost ", IntToString(beersBefore-beersAfter));
        msg = ConcatStrings(msg, " beers");
        G1CP_TestsuiteErrorDetail(msg);
        return FALSE;
    } else { // (beersAfter == beersBefore+1)
        return TRUE;
    };
};

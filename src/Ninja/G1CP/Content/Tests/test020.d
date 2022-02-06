/*
 * #20 Kirgo doesn't give a beer to the player
 *
 * The dialog function is called (the dialog lines are aborted) and the number of beers in the hero inventory are
 * counted
 *
 * Expected behavior: The hero will receive one beer from Kirgo (automatically removed after the test is complete)
 */
func int G1CP_Test_020() {
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("Grd_251_Kirgo");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Info_Kirgo_Charge_Beer");
    var int beerId; beerId = G1CP_Testsuite_CheckItem("ItFoBeer");
    G1CP_Testsuite_CheckPassed();

    // Remember the number of beers the player has before
    CreateInvItem(hero, beerId); // Have at least one (to see if the number decreases)
    var int beersBefore; beersBefore = Npc_HasItems(hero, beerId);

    // Just run the dialog and see what happens
    G1CP_Testsuite_Call(funcId, npc, hero, TRUE);

    // Check how many beers the player has now
    var int beersAfter; beersAfter = Npc_HasItems(hero, beerId);

    // Revert to the previous number
    if (beersAfter < beersBefore-1) {
        CreateInvItems(hero, beerId, (beersBefore-1) - beersAfter);
    } else if (beersAfter > beersBefore-1) {
        Npc_RemoveInvItems(hero, beerId, beersAfter - (beersBefore-1));
    };

    // Confirm that the fix worked
    if (beersAfter == beersBefore) {
        G1CP_TestsuiteErrorDetail("The hero did not receive a beer");
        return FALSE;
    } else if (beersAfter > beersBefore+1) {
        G1CP_TestsuiteErrorDetailSIS("The hero received ", beersAfter - (beersBefore+1), " beers too many");
        return FALSE;
    } else if (beersAfter < beersBefore) {
        G1CP_TestsuiteErrorDetailSIS("The hero lost ", beersBefore - beersAfter, " beers");
        return FALSE;
    } else { // (beersAfter == beersBefore+1)
        return TRUE;
    };
};

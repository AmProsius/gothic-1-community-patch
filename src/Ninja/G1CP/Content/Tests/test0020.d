/*
 * #20 Kirgo doesn't give a beer to the player
 *
 * The dialog function is called (the dialog lines are aborted) and the number of beers in the hero inventory are
 * counted
 *
 * Expected behavior: The hero will receive one beer from Kirgo (automatically removed after the test is complete)
 */
func int G1CP_Test_0020() {
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("Grd_251_Kirgo");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Info_Kirgo_Charge_Beer");
    var int beerId; beerId = G1CP_Testsuite_CheckItem("ItFoBeer");
    G1CP_Testsuite_CheckPassed();

    var int r;
    CreateInvItem(hero, beerId); // Have at least one (to see if the number decreases)
    var int beersBefore; beersBefore = Npc_HasItems(hero, beerId);
    if (final()) {
        G1CP_Testsuite_NpcSetInvItemAmount(hero, beerId, beersBefore-1);
    };

    G1CP_Testsuite_Call(funcId, npc, hero, TRUE);
    G1CP_Testsuite_Assert(Npc_HasItems(hero, beerId), beersBefore+1);

    return TRUE;
};

/*
 * #116 Lens flares in the swampweed cave
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: There are no lens flares in the cave.
 */
func void G1CP_Test_0116() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("LOCATION_23_CAVE_1_02");

    // Optional: Make sure Jacko is not attacking (if he is present)
    const int LOG_SUCCESS = 2;
    G1CP_SetIntVar("Kalom_DrugMonopol", LOG_SUCCESS);

    // Teleport the player
    AI_Teleport(hero, wp.name);
};

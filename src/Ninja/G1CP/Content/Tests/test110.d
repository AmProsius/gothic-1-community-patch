/*
 * #110 Weird camera distance when sitting on a bench
 *
 * This test relies on manual confirmation. The PC is teleported to a bench to verify the camera distance.
 *
 * Expected behavior: The camera definition is suitable.
 */
func void G1CP_Test_110() {
    if (G1CP_TestsuiteAllowManual) {
        Wld_SetTime(4, 0); // Get all the NPCs out of the way
        AI_Teleport(hero, "OCR_OUTSIDE_MCAMP_01");
    };
};

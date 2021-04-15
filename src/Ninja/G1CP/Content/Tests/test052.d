/*
 * #52 MOBs in New Camp can be used without corresponding items
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The grindstone is not usable anymore (without a sword blade).
 */
func void G1CP_Test_052() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };
    
    Wld_SetTime(3, 0); // Get that mercenary out of the way
    AI_Teleport(hero, "NC_HUT03_OUT_MOVEMENT");
};

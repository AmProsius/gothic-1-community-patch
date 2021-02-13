/*
 * #42 Guards have duplicated END dialog
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: Both guards at the door to the ore barons house should only have one END dialog.
 */
func void Ninja_G1CP_Test_042() {
    if (Ninja_G1CP_TestsuiteAllowManual) {
        AI_Teleport(hero, "OCC_BARONS_LEFT_GUARD_CHANGE");
    };
};

/*
 * #224 Exploit: Undead orc priest can die from fall damage
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: Grash-Varrag-Arushat doesn't die from fall damage.
 */
func void G1CP_Test_224() {
    G1CP_Testsuite_CheckManual();
    G1CP_TeleportToWorld("ORCTEMPEL.ZEN", "TPL_289");
};

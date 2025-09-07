/*
 * #224 Exploit: Undead orc priest can die from fall damage
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Run the test function three times:
 *  1. Change world to orc temple.
 *  2. Teleport to the exact position. This is a separate step, because there is no waypoint to teleport to directly.
 *  3. Teleport out of range to despawn the NPC and immediately back to inspect, whether alive or not.
 * Sometimes running the test several times may be required to successfully trigger the dialog.
 *
 * Expected behavior: Grash-Varrag-Arushat doesn't die from fall damage and spawns at is waypoint when returning.
 */
func void G1CP_Test_0224() {
    G1CP_Testsuite_CheckManual();

    G1CP_Testsuite_NpcTeleportToWorld(hero, "ORCTEMPEL.ZEN", "TPL_291"); // Out of spawn range
    G1CP_Testsuite_NpcBeamToPosF(hero, 12968, -600, 22000); // Cannot teleport here through level change

    if (!Hlp_StrCmp(MEM_World.worldFilename, "ORCTEMPEL.ZEN")) {
        Print(""); // Clear some space
        Print("Run the test again to get into position. Try multiple times until dialog triggers.");
    } else {
        Print("Re-run test until dialog triggers, wait until the orc priest falls, run test again, and confirm that the orc priest spawned alive.");
    };
};

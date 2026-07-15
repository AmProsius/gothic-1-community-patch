/*
 * #224 Exploit: Undead orc priest can die from fall damage
 */
func void G1CP_Test_0224() {
    const string instr[8] = {
        "Run this undead-orc test three times:",
        "1. Change world to orc temple.",
        "2. Teleport to the exact position. This is a separate step, because there is no waypoint nearby.",
        "Re-run the test, until the dialogs triggers and the orc priest falls off the cliff.",
        "3. Teleport out of range to despawn the NPC and immediately back to inspect, whether alive or not.",
        "Sometimes running the test several times may be required to successfully trigger the dialog.",
        "Expected behavior: Grash-Varrag-Arushat doesn't die from fall damage and re-spawns alive when returning.",
        "Because of the world change, it's best to leave the world when continuing with more tests."
    };
    G1CP_Testsuite_CheckManual(instr);

    G1CP_Testsuite_NpcTeleportToWorld(hero, "ORCTEMPEL.ZEN", "TPL_291"); // Out of spawn range
    G1CP_Testsuite_NpcBeamToPosF(hero, 12968, -600, 22000); // Cannot teleport here through level change
};

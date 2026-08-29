/*
 * #11 Player can pass guards in combat mode
 */
func void G1CP_Test_0011() {
    const string instr[2] = {
        "Draw your equipped weapon and try to pass the gate guards to the castle.",
        "Expected behavior: Guards will now no longer react to drawing a weapon if the player has no access to enter."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);
    var int weapId; weapId = G1CP_Testsuite_CheckItem("ItMw_1H_Sword_Old_01");
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCR_BEHIND_HUT_1");

    // Supply a weapon
    if (!Npc_HasEquippedWeapon(hero))
    && (!Npc_HasReadiedWeapon(hero)) {
        CreateInvItem(hero, weapId);
        EquipWeapon(hero, weapId);
    };

    // Teleport the player in front of the gate guards
    G1CP_Testsuite_NpcBeamTo(hero, wp.name);
};

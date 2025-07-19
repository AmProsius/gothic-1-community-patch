/*
 * #11 Player can pass guards in combat mode
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: Guards will now no longer react to drawing a weapon if the player has no access to enter.
 */
func void G1CP_Test_0011() {
    G1CP_Testsuite_CheckManual();
    var int weapId; weapId = G1CP_Testsuite_CheckItem("ItMw_1H_Sword_Old_01");
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCR_BEHIND_HUT_1");
    G1CP_Testsuite_CheckPassed();

    // Supply a weapon
    if (!Npc_HasEquippedWeapon(hero))
    && (!Npc_HasReadiedWeapon(hero)) {
        CreateInvItem(hero, weapId);
        EquipWeapon(hero, weapId);
    };

    // Teleport the player in front of the gate guards
    AI_Teleport(hero, wp.name);
};

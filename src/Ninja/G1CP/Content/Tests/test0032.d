/*
 * #32 Gorn attacks the player in the Free Mine
 *
  * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
  *
  * Expected behavior: Gorn no longer attacks the player or comments on a death during the raid of the Free Mine.
  */
func void G1CP_Test_0032() {
    G1CP_Testsuite_CheckManual();
    var int chptrId; chptrId = G1CP_Testsuite_CheckIntVar("Kapitel");
    var int weapId; weapId = G1CP_Testsuite_CheckItem("ItMw_1H_Sword_Old_01");
    G1CP_Testsuite_CheckPassed();

    // Define possibly missing symbols locally
    const int NPC_FLAG_IMMORTAL = 1 << 1;
    const int ATR_STRENGTH = 4;

    // Setting the variable suffices to trigger the attitude change
    G1CP_SetIntVarI(chptrId, 0, 4);

    // Set PC to invincible to observe the action
    hero.flags = hero.flags | NPC_FLAG_IMMORTAL;

    // Give the PC enough strength to insta-kill
    hero.attribute[ATR_STRENGTH] = 1000;

    // But needs a weapon to finish them off
    EquipWeapon(hero, weapId);

    // Teleport the player to the entrance of the Free Mine
    G1CP_Testsuite_NpcTeleportToWorld(hero, "FREEMINE.ZEN", "FM_02");
};

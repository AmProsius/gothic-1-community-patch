/*
 * #32 Gorn attacks the player in the Free Mine
 *
  * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
  *
  * Expected behavior: Gorn no longer attacks the player or comments on a death during the raid of the Free Mine.
  */
func void G1CP_Test_032() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };
    
    // Define possibly missing symbols locally
    const int NPC_FLAG_IMMORTAL = 1 << 1;
    const int ATR_STRENGTH = 4;

    // Define constants for specific test
    const string CHAPTER_NAME = "Kapitel";

    // Prior checks
    G1CP_Testsuite_CheckIntVar(CHAPTER_NAME, 0);
    G1CP_Testsuite_CheckPassed();

    // Setting the variable suffices to trigger the attitude change
    G1CP_SetIntVar(CHAPTER_NAME, 0, 4);

    // Set PC to invincible to observe the action
    hero.flags = hero.flags | NPC_FLAG_IMMORTAL;

    // Give the PC enough strength to insta-kill
    hero.attribute[ATR_STRENGTH] = 1000;

    // But needs a weapon to finish them off
    EquipWeapon(hero, MEM_GetSymbolIndex("ItMw_1H_Sword_Old_01"));

    // Teleport the player to the entrance of the Free Mine
    if (!Hlp_StrCmp(MEM_World.worldFilename, "FREEMINE.ZEN")) {
        const int oCGame__TriggerChangeLevel = 6542464; //0x63D480
        CALL_zStringPtrParam("FM_02");
        CALL_zStringPtrParam("FREEMINE.ZEN");
        CALL__thiscall(_@(MEM_Game), oCGame__TriggerChangeLevel);
    } else {
        AI_Teleport(hero, "FM_02");
    };
};

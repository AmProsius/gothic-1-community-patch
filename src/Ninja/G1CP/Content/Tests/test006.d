/*
 * #6 Humanoid monsters don't unequip their weapons after dying
 *
 * This test spawns a goblin and a skeleton and kills them
 *
 * Expected behavior: Both NPCs should have their weapons unequipped
 */
const int Ninja_G1CP_Test_006_Pass = 0;

func void Ninja_G1CP_Test_006() {
    if (!Ninja_G1CP_TestsuiteAllowManual) {
        return;
    };

    // Find NPC instances
    var int skelId; skelId = MEM_FindParserSymbol("Skeleton");
    if (skelId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail(6, "'Skeleton' does not exist");
        return;
    };
    var int gobboId; gobboId = MEM_FindParserSymbol("GreenGobboSword");
    if (gobboId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail(6, "'GreenGobboSword' does not exist");
        return;
    };

    // Insert the NPCs
    var string wp; wp = Npc_GetNearestWP(hero);
    Wld_InsertNpc(skelId, wp);
    var C_Npc skel; skel = Hlp_GetNpc(skelId);
    if (!Hlp_IsValidNpc(skel)) {
        Ninja_G1CP_TestsuiteErrorDetail(6, "Failed to insert 'Skeleton'");
        return;
    };
    Wld_InsertNpc(gobboId, wp);
    var C_Npc gobbo; gobbo = Hlp_GetNpc(gobboId);
    if (!Hlp_IsValidNpc(gobbo)) {
        Ninja_G1CP_TestsuiteErrorDetail(6, "Failed to insert 'Skeleton'");
        return;
    };

    // Kill them (next frame!)
    AI_Wait(hero, 1); // Give the spawn manager one second to insert them
    AI_Function_N(hero, Ninja_G1CP_Test_006_Kill, skel);
    AI_Function_N(hero, Ninja_G1CP_Test_006_Kill, gobbo);

    Ninja_G1CP_Test_006_Pass = 0;
};
func void Ninja_G1CP_Test_006_Kill(var C_Npc slf) {
    Npc_ChangeAttribute(slf,  0, -slf.attribute[1]);
    AI_WaitMS(hero, 250);
    AI_Function_N(hero, Ninja_G1CP_Test_006_Check, slf);
};
func void Ninja_G1CP_Test_006_Check(var C_Npc slf) {
    Ninja_G1CP_Test_006_Pass += 1;
    if (!Npc_HasEquippedMeleeWeapon(slf)) {
        Print(ConcatStrings(ConcatStrings("Test 6 passed (PART ", IntToString(Ninja_G1CP_Test_006_Pass-1)), " of 2)"));
    } else {
        Print(ConcatStrings(ConcatStrings("Test 6 failed (PART ", IntToString(Ninja_G1CP_Test_006_Pass-1)), " of 2)"));
    };
};

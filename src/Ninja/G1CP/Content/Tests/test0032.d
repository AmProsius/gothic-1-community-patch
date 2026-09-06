/*
 * #32 Gorn attacks the player in the Free Mine
 */
func void G1CP_Test_0032() {
    const string instr[3] = {
        "The hero is set to immortal, given a lot of strength, and teleported into the free mine in chapter four.",
        "Kill some guards of the Old Camp and observe Gorn's reaction. A bounding box helps to spot Gorn.",
        "Expected behavior: Gorn no longer attacks the player or comments on a death during the raid of the Free Mine."
    };
    G1CP_Testsuite_CheckManual(instr);
    var int chptrId; chptrId = G1CP_Testsuite_CheckIntVar("Kapitel");
    var int weapId; weapId = G1CP_Testsuite_CheckItem("ItMw_1H_Sword_Old_01");
    G1CP_SetIntVarI(chptrId, 0, 4); // Setting the variable suffices to trigger the attitude change
    G1CP_Testsuite_CheckWorld(G1CP_WLD_FREEMINE); // Do this AFTER adjusting the chapter for world startup
    var zCVob npc; npc = G1CP_Testsuite_FindNpc("PC_FighterFM");

    // Set PC to invincible to observe the action
    const int NPC_FLAG_IMMORTAL = 1 << 1;
    hero.flags = hero.flags | NPC_FLAG_IMMORTAL;

    // Give the PC enough strength to insta-kill
    const int ATR_STRENGTH = 4;
    hero.attribute[ATR_STRENGTH] = 1000;

    // But needs a weapon to finish them off
    EquipWeapon(hero, weapId);

    // Draw bounding box around Gorn for visual aid
    npc.bitfield[0] = npc.bitfield[0] | zCVob_bitfield0_drawBBox3D;

    // Teleport the player to the entrance of the Free Mine
    G1CP_Testsuite_NpcBeamTo(hero, "");
};

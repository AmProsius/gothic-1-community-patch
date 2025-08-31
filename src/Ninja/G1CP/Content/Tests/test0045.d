/*
 * #45 Snappers don't spawn outside the Monastery ruins
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test will break the game. Save the game beforehand.
 *
 * Expected behavior: The snappers appear at the waypoint, identifiable by bounding boxes.
 */
func void G1CP_Test_0045() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OW_MONSTER_NAVIGATE_02");
    const int NPC_FLAG_IMMORTAL = 1 << 1;

    // Set PC to invincible to observe the action
    hero.flags = hero.flags | NPC_FLAG_IMMORTAL;

    // For this test: mark them
    var zCVob vob;
    if (Hlp_IsValidNpc(G1CP_0045_SpawnSnappersMonastery_Snapper1)) {
        vob = Hlp_GetNpc(G1CP_0045_SpawnSnappersMonastery_Snapper1);
        vob.bitfield[0] = vob.bitfield[0] | zCVob_bitfield0_drawBBox3D;
    };
    if (Hlp_IsValidNpc(G1CP_0045_SpawnSnappersMonastery_Snapper2)) {
        vob = Hlp_GetNpc(G1CP_0045_SpawnSnappersMonastery_Snapper2);
        vob.bitfield[0] = vob.bitfield[0] | zCVob_bitfield0_drawBBox3D;
    };

    // Teleport the player right to them
    AI_Teleport(hero, wp.name);
};

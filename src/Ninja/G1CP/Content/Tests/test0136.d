/*
 * #136 NPCs cannot use ladders when following the player
 */
func void G1CP_Test_0136() {
    const string instr[3] = {
        "The hero is teleported into the Free Mine at the top of a ladder.",
        "Wait for Gorn to catch up and climb the ladder reaching the top. A bounding box helps to spot Gorn.",
        "Expected behavior: Gorn should be able to climb up the ladder to reach the PC without interruptions."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_FREEMINE);
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("PC_FighterFM");
    var zCWaypoint wpBottom; wpBottom = G1CP_Testsuite_FindWaypoint("FM_20");
    var zCWaypoint wpTop; wpTop = G1CP_Testsuite_FindWaypoint("FM_19");

    // Draw bounding box around Gorn for visual aid
    var zCVob vob; vob = Hlp_GetNpc(npc);
    vob.bitfield[0] = vob.bitfield[0] | zCVob_bitfield0_drawBBox3D;

    G1CP_Testsuite_NpcBeamTo(hero, wpTop.name);
    G1CP_Testsuite_NpcBeamTo(npc, wpBottom.name);
};

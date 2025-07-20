/*
 * #50 Column in monastery ruin falls in wrong direction
 *
 * The hero is teleported in front of the pillar and its bounding box is visualized. (To remove it, run test again.)
 *
 * Expected behavior: The pillar falls in the correct direction and has collision to be able to walk over the cliff.
 */
func void G1CP_Test_0050() {
    G1CP_Testsuite_CheckManual();
    var zCVob pillar; pillar = G1CP_Testsuite_FindVob("MOBSISEULE");
    G1CP_Testsuite_CheckPassed();

    // Visualize or remove bounding box
    if (pillar.bitfield[0] & zCVob_bitfield0_drawBBox3D) {
        pillar.bitfield[0] = pillar.bitfield[0] & ~zCVob_bitfield0_drawBBox3D;
        return;
    };
    pillar.bitfield[0] = pillar.bitfield[0] | zCVob_bitfield0_drawBBox3D;

    // Teleport PC to the pillar (AI_Teleport not applicable because there is no waypoint nearby)
    G1CP_Testsuite_NpcBeamTo(hero, pillar._zCObject_objectname);
};

/*
 * #50 Column in monastery ruin falls in wrong direction
 */
func void G1CP_Test_0050() {
    const string instr[5] = {
        "The hero is teleported in front of the pillar and its bounding box is visualized.",
        "Push the pillar and walk across it. Save and load on either side of the cliff to check if the pillar resets.",
        "When on the other side the pillar should spawn tipped over after loading.",
        "Expected behavior: The pillar falls in the correct direction and has collision to be able to walk over it.",
        "(To remove the bounding box, run test again.)"
    };
    G1CP_Testsuite_CheckManual(instr);
    var zCVob pillar; pillar = G1CP_Testsuite_FindVob("MOBSISEULE");

    // Visualize or remove bounding box
    if (pillar.bitfield[0] & zCVob_bitfield0_drawBBox3D) {
        pillar.bitfield[0] = pillar.bitfield[0] & ~zCVob_bitfield0_drawBBox3D;
        return;
    };
    pillar.bitfield[0] = pillar.bitfield[0] | zCVob_bitfield0_drawBBox3D;

    // Teleport PC to the pillar (AI_Teleport not applicable because there is no waypoint nearby)
    G1CP_Testsuite_NpcBeamTo(hero, pillar._zCObject_objectname);
};

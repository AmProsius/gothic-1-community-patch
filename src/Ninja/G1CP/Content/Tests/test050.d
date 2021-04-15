/*
 * #50 Column in monastery ruin falls in wrong direction
 *
 * The hero is teleported in front of the pillar and its bounding box is visualized. (To remove it, run test again.)
 *
 * Expected behavior: The pillar falls in the correct direction and has collision to be able to walk over the cliff.
 */
func void G1CP_Test_050() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };
    
    // Check if pillar is found
    var int vobPtr; vobPtr = MEM_SearchVobByName("MOBSISEULE");
    if (vobPtr) {
        // Visualize or remove bounding box
        var zCVob vob; vob = _^(vobPtr);
        if (vob.bitfield[0] & zCVob_bitfield0_drawBBox3D) {
            vob.bitfield[0] = vob.bitfield[0] & ~zCVob_bitfield0_drawBBox3D;
            return;
        };
        vob.bitfield[0] = vob.bitfield[0] | zCVob_bitfield0_drawBBox3D;

        // Teleport PC to the pillar (AI_Teleport not applicable because there is no waypoint nearby)
        G1CP_NpcBeamTo(hero, "MOBSISEULE");
    } else {
        G1CP_TestsuiteErrorDetail("VOB 'MOBSISEULE' not found");
    };
};

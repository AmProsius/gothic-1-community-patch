/*
 * #50 Column in monastery ruin falls in wrong direction
 *
 * The hero is teleported in front of the pillar
 *
 * Expected behavior: The pillar fall in the correct direction and has collision to be able to walk over the cliff
 */
func void Ninja_G1CP_Test_050() {
    if (Ninja_G1CP_TestsuiteAllowManual) {
        if (MEM_SearchVobByName("NINJA_G1CP_050_PILLAR")) {
            const int oCNpc__BeamTo = 6896400; //0x693B10
            CALL_PtrParam(_@s("NINJA_G1CP_050_PILLAR"));
            CALL__thiscall(_@(hero), oCNpc__BeamTo);
        } else {
            Ninja_G1CP_TestsuiteErrorDetail("Vob named 'NINJA_G1CP_050_PILLAR' not found");
        };
    };
};

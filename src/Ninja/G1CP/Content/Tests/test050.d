/*
 * #50 Column in monastery ruin falls in wrong direction
 *
 * The hero is teleported in front of the pillar
 *
 * Expected behavior: The pillar fall in the correct direction and has collision to be able to walk over the cliff
 */
func void Ninja_G1CP_Test_050() {
    // Create the engine call
    const string target = "";
    const int oCNpc__BeamTo = 6896400; //0x693B10
    const int BeamTo = 0;
    const int strPtr = 0;
    var int herPtr;
    if (!BeamTo) {
        strPtr = _@s(target);
        CALL_Open();
        CALL_PtrParam(_@(strPtr));
        CALL__thiscall(_@(herPtr), oCNpc__BeamTo);
        BeamTo = CALL_Close();
    };

    // Run the actual test
    if (Ninja_G1CP_TestsuiteAllowManual) {
        herPtr = _@(hero);
        target = "NINJA_G1CP_050_PILLAR";

        if (MEM_SearchVobByName(target)) {
            // Fix worked
            ASM_Run(BeamTo);
        } else {
            // Fix failed or was already applied
            target = "MOBSISEULE";
            if (MEM_SearchVobByName(target)) {
                ASM_Run(BeamTo);
            } else {
                var string msg; msg = ConcatStrings(ConcatStrings("Vob named '", target), "' not found");
                Ninja_G1CP_TestsuiteErrorDetail(msg);
            };
            Print("Fix for #50 was not applied. The fix has either failed or the issue has already been addressed.");
        };
    };
};

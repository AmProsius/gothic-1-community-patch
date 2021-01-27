/*
 * #53 Ladder in Old Mine too short
 *
 * The hero is moved to the old mine and teleported to the bottom of the ladders
 *
 * Expected behavior: The ladders are repositioned vertically and a small platform connects them to the cliff
 */
func void Ninja_G1CP_Test_053() {
    if (Ninja_G1CP_TestsuiteAllowManual) {
        if (!Hlp_StrCmp(MEM_World.worldFilename, "OLDMINE.ZEN")) {
            const int oCGame__TriggerChangeLevel = 6542464; //0x63D480
            CALL_zStringPtrParam("OM_185");
            CALL_zStringPtrParam("OLDMINE.ZEN");
            CALL__thiscall(_@(MEM_Game), oCGame__TriggerChangeLevel);
        } else {
            AI_Teleport(hero, "OM_185");
        };
    };
};

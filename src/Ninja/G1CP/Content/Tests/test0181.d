/*
 * #181 Swiney gives his own pants to the player
 */
func void G1CP_Test_0181() {
    const string instr[2] = {
        "The hero is teleported to Swiney. Start the dialog to get digger's pants.",
        "Expected behavior: Swiney keeps his own pants when giving armor to the hero."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);
    var int helloId; helloId = G1CP_Testsuite_CheckInfo("Info_Swiney_Hello");
    var int diggerId; diggerId = G1CP_Testsuite_CheckInfo("Info_Swiney_Schuerfer");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("SFB_1037_Swiney");

    // Make sure swiney is alive (depending on chapter)
    npc.attribute[ATR_HITPOINTS] = npc.attribute[ATR_HITPOINTS_MAX];

    // Set unlock the dialog
    G1CP_SetInfoToldI(helloId, TRUE);
    G1CP_SetInfoToldI(diggerId, FALSE);
    G1CP_Testsuite_NpcBeamTo(hero, npc.wp);
};

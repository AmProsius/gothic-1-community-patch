/*
 * #215 Guy doesn't sit at arena
 */
func void G1CP_Test_0215() {
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);
    G1CP_Tpl_TestNpcRtnWP("OCR_OUTSIDE_ARENA_BENCH2", "VLK_530_Guy", "start", 1730);
};

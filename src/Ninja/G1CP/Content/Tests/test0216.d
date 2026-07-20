/*
 * #216 Digger doesn't repair hut
 */
func void G1CP_Test_0216() {
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);
    G1CP_Tpl_TestNpcRtnWP("OCR_HUT_15", "VLK_506_Buddler", "start", 1130);
};

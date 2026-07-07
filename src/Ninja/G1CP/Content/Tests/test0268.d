/*
 * #268 Spelling - Text of key of the laboratory chest (DE)
 */
func int G1CP_Test_0268() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ITKE_PSI_KALOM_01");
    var string itm_text_1; itm_text_1 = MEM_ReadStatStringArr(itm.text, 1); // itm.text[1]

    G1CP_Testsuite_AssertS(itm.text, "Öffnet die Truhe im Alchemielabor");
    G1CP_Testsuite_AssertS(itm_text_1, "des Sumpflagers.");
};

/*
 * #268 Spelling - Text of key of the laboratory chest (DE)
 */
func int G1CP_Test_0268() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("### TODO Item instance name ###");

    G1CP_Testsuite_AssertS(itm.text, "### TODO Expected string ###");
};

/*
 * #266 Spelling - Old Mine storage chest key (DE/EN)
 */
func void G1CP_Test_0266() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN | G1CP_Lang_DE);
    if (G1CP_Lang & G1CP_Lang_EN) {
        G1CP_Tpl_TestItemStringVar("ItKe_OM_03", "text", "Opens the chests in the");
    } else if (G1CP_Lang & G1CP_Lang_DE) {
        G1CP_Tpl_TestItemStringVar("ItKe_OM_03", "text", "Öffnet die Truhen");
    };
};

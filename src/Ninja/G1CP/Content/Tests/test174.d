/*
 * #174 Spelling - Gomez' Key (EN)
 *
 * The name of the item "ItKe_Gomez_01" is inspected programmatically.
 *
 * Expected behavior: The key will have the correct name (checked for English localization only).
 */
func int G1CP_Test_174() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItKe_Gomez_01");
    G1CP_Testsuite_CheckPassed();

    if (Hlp_StrCmp(itm.name, "Gomez' Key")) { // EN
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetailSSS("Name incorrect: name = '", itm.name, "'");
        return FALSE;
    };
};

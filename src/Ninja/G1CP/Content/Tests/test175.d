/*
 * #175 Spelling - Rice Lord's Key (EN)
 *
 * The name of the item "ItKey_RB_01" is inspected programmatically.
 *
 * Expected behavior: The key will have the correct name (checked for English localization only).
 */
func int G1CP_Test_175() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItKey_RB_01");
    G1CP_Testsuite_CheckPassed();

    if (Hlp_StrCmp(itm.name, "Rice Lord's Key")) {
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetailSSS("Name incorrect: name = '", itm.name, "'");
        return FALSE;
    };
};

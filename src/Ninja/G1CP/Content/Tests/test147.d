/*
 * #147 Spelling - Crawler Plate Armor (DE)
 *
 * The name of the item "CRW_ARMOR_H" is inspected programmatically.
 *
 * Expected behavior: The armor will have the correct name (checked for German localization only).
 */
func int G1CP_Test_147() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("CRW_ARMOR_H");
    G1CP_Testsuite_CheckPassed();

    if (Hlp_StrCmp(itm.name, "Crawlerplatten-Rüstung")) {
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetailSSS("Name incorrect: name = '", itm.name, "'");
        return FALSE;
    };
};

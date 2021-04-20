/*
 * #201 Text of Ancient Ore Armor too long (DE)
 *
 * The text of the item "ORE_ARMOR_M" is inspected programmatically.
 *
 * Expected behavior: The armor will have the correct text (checked for German localization only).
 */
func int G1CP_Test_201() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ORE_ARMOR_M");
    G1CP_Testsuite_CheckPassed();

    if (Hlp_StrCmp(itm.text, "Diese alte R�stung wurde aus magischem Erz gefertigt.")) {
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetailSSS("Text incorrect: text[0] = '", itm.text, "'");
        return FALSE;
    };
};

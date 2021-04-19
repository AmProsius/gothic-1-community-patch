/*
 * #200 Text of Improved Ore Armor too long (DE)
 *
 * The text of the item "ORE_ARMOR_H" is inspected programmatically.
 *
 * Expected behavior: The armor will have the correct text (checked for German localization only).
 */
func int G1CP_Test_200() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ORE_ARMOR_H");
    G1CP_Testsuite_CheckPassed();

    if (Hlp_StrCmp(itm.text, "Stone der Schmied hat sie noch verbessern können!")) {
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetailSSS("Text incorrect: text[0] = '", itm.text, "'");
        return FALSE;
    };
};

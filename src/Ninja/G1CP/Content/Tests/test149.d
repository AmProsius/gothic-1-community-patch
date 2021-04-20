/*
 * #149 Spelling - Improved Ore Armor (DE/EN)
 *
 * The name of the item "ORE_ARMOR_H" is inspected programmatically.
 *
 * Expected behavior: The armor will have the correct name (checked for English and German localization only).
 */
func int G1CP_Test_149() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN | G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ORE_ARMOR_H");
    G1CP_Testsuite_CheckPassed();

    // Case-sensitive comparison!
    if (STR_Compare(itm.name, "Improved Ore Armor") == STR_EQUAL) // EN
    || (STR_Compare(itm.name, "Verbesserte Erzrüstung") == STR_EQUAL) { // DE
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetailSSS("Name incorrect: name = '", itm.name, "'");
        return FALSE;
    };
};

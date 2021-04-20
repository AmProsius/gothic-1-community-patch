/*
 * #145 Spelling - Light Mercenary's Armor (DE)
 *
 * The name of the item "SLD_ARMOR_L" is inspected programmatically.
 *
 * Expected behavior: The armor will have the correct name (checked for German localization only).
 */
func int G1CP_Test_145() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("SLD_ARMOR_L");
    G1CP_Testsuite_CheckPassed();

    if (STR_Compare(itm.name, "Leichte Söldnerrüstung") == STR_EQUAL) { // Case-sensitive
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetailSSS("Name incorrect: name = '", itm.name, "'");
    };
};

/*
 * #146 Spelling - Novice's Loincloth (DE)
 *
 * The name of the item "NOV_ARMOR_L" is inspected programmatically.
 *
 * Expected behavior: The armor will have the correct name (checked for German localization only).
 */
func int G1CP_Test_146() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("NOV_ARMOR_L");
    G1CP_Testsuite_CheckPassed();

    if (Hlp_StrCmp(itm.name, "Novizenrock")) {
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetailSSS("Name incorrect: name = '", itm.name, "'");
        return FALSE;
    };
};

/*
 * #172 Spelling - Kalom's Recipe (DE)
 *
 * The name of the item "KalomsRecipe" is inspected programmatically.
 *
 * Expected behavior: The scroll will have the correct name (checked for German localization only).
 */
func int G1CP_Test_172() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("KalomsRecipe");
    G1CP_Testsuite_CheckPassed();

    if (Hlp_StrCmp(itm.name, "Kaloms Rezept")) {
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetailSSS("Name incorrect: name = '", itm.name, "'");
        return FALSE;
    };
};

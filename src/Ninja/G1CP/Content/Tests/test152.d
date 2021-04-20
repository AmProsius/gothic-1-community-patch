/*
 * #152 Spelling - Ring of Fire Protection (EN)
 *
 * The description of the item "Schutzring_Feuer2" is inspected programmatically.
 *
 * Expected behavior: The ring will have the correct description (checked for English localization only).
 */
func int G1CP_Test_152() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("Schutzring_Feuer2");
    G1CP_Testsuite_CheckPassed();

    if (Hlp_StrCmp(itm.description, "Ring of Fire Protection")) {
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetailSSS("Description incorrect: description = '", itm.description, "'");
        return FALSE;
    };
};

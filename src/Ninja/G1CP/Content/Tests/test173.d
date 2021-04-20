/*
 * #173 Spelling - Gomez' Key: "Gomez' Truhen" (DE)
 *
 * The text of the item "ItKe_Gomez_01" is inspected programmatically.
 *
 * Expected behavior: The key will have the correct text (checked for German localization only).
 */
func int G1CP_Test_173() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItKe_Gomez_01");
    G1CP_Testsuite_CheckPassed();

    if (Hlp_StrCmp(itm.text, "Öffnet Gomez' Truhen")) {
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetailSSS("Text incorrect: text[0] = '", itm.text, "'");
        return FALSE;
    };
};

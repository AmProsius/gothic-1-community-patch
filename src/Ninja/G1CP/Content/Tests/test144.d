/*
 * #144 Spelling - Gomez' Armor (DE)
 *
 * The name of the item "EBR_ARMOR_H" is inspected programmatically.
 *
 * Expected behavior: The armor will have the correct name (checked for German localization only).
 */
func int G1CP_Test_144() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("EBR_ARMOR_H");
    G1CP_Testsuite_CheckPassed();

    if (Hlp_StrCmp(itm.name, "Gomez' Rüstung")) {
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetailSSS("Name incorrect: name = '", itm.name, "'");
    };
};

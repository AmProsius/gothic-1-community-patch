/*
 * #125 The Butcher is described as two-handed sword
 *
 * The text of the item "ItMw_1H_Sword_Bastard_02" is inspected programmatically.
 *
 * Expected behavior: The sword will have the correct text (checked for English and German localization only).
 */
func int G1CP_Test_125() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN | G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItMw_1H_Sword_Bastard_02");
    G1CP_Testsuite_CheckPassed();

    // Static string arrays cannot be read directly
    var string itmText; itmText = MEM_ReadStatStringArr(itm.text, 4);

    if (!Hlp_StrCmp(itmText, "One-handed Weapon")) // EN
    && (!Hlp_StrCmp(itmText, "Einhandwaffe")) {    // DE
        G1CP_TestsuiteErrorDetailSSS("Text incorrect: text[4] = '", itmText, "'");
        return FALSE;
    };

    return TRUE;
};

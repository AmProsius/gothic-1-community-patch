/*
 * #148 Spelling - Ancient Ore Armor (DE)
 *
 * The name of the item "ORE_ARMOR_M" is inspected programmatically.
 *
 * Expected behavior: The armor will have the correct name (checked for German localization only).
 */
func int G1CP_Test_148() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ORE_ARMOR_M");
    G1CP_Testsuite_CheckPassed();

    if (STR_Compare(itm.name, "Antike Erzrüstung") == STR_EQUAL) { // Case-sensitive
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetailSSS("Name incorrect: name = '", itm.name, "'");
    };
};

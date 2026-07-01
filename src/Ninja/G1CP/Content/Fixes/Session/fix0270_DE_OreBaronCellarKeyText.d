/*
 * #270 Spelling - Key to the main door of the storage rooms in the cellar of the ore barons (DE)
 */
func int G1CP_0270_DE_OreBaronCellarKeyText() {
    const int count = 0;

    var int itemId; itemId = G1CP_GetItemInstId("ItKe_Storage_01");
    if (
        STR_Compare(
            G1CP_GetStringI(itemId, 0, "G1CP invalid string"),
            "Öffnet Haupttür der Lagerräume "
        ) == STR_EQUAL
    ) {
        count += 1;
    };

    if (
        STR_Compare(
            G1CP_GetStringI(itemId, 1, "G1CP invalid string"),
            "im Keller der Erzbarone"
        ) == STR_EQUAL
    ) {
        count += 1;
    };

    if (count <= 2) {
        return FALSE;
    };

    G1CP_Tpl_ChangeItemStrVar(
        "ItKe_Storage_01",
        "text[0]",
        "Öffnet Haupttür der Lagerräume ",
        "Öffnet die Haupttür der Lager-"
    );
    G1CP_Tpl_ChangeItemStrVar(
        "ItKe_Storage_01",
        "text[1]",
        "im Keller der Erzbarone",
        "räume im Keller der Erzbarone."
    );

    return TRUE;
};

/*
 * #270 Spelling - Key to the main door of the storage rooms in the cellar of the ore barons (DE)
 */
func int G1CP_0270_DE_OreBaronCellarKeyText() {
    const int count = 0;
    var int itemId; itemId = G1CP_GetItemInstId("ItKe_Storage_01");

    count += G1CP_FindAssignStr(itemId, 0, "C_Item.text", "Öffnet Haupttür der Lagerräume ");
    count += G1CP_FindAssignStr(itemId, 0, "C_Item.text[1]", "im Keller der Erzbarone");

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

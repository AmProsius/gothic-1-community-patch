/*
 * #270 Spelling - Key to the main door of the storage rooms in the cellar of the ore barons (DE)
 */
func int G1CP_0270_DE_OreBaronCellarKeyText() {
    const int count = -1;

    count = G1CP_Tpl_ChangeItemStrVar(
        "ItKe_Storage_01",
        "text[0]",
        "Öffnet Haupttür der Lagerräume ",
        "Öffnet die Haupttür der Lager-"
    );
    count += G1CP_Tpl_ChangeItemStrVar(
        "ItKe_Storage_01",
        "text[1]",
        "im Keller der Erzbarone",
        "räume im Keller der Erzbarone."
    );

    return (count > -1);
};

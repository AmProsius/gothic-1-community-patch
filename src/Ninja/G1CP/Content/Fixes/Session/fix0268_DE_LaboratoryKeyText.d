/*
 * #268 Spelling - Text of key of the laboratory chest (DE)
 */
func int G1CP_0268_DE_LaboratoryKeyText() {
    var int applied1;
    var int applied2;

    applied1 = G1CP_Tpl_ChangeItemStrVar(
        "ITKE_PSI_KALOM_01",
        "text[0]",
        "öffnet die Truhe im Alchemielabor",
        "Öffnet die Truhe im Alchemielabor"
    );
    applied2 = G1CP_Tpl_ChangeItemStrVar(
        "ITKE_PSI_KALOM_01",
        "text[1]",
        "des Sumpflagers",
        "des Sumpflagers."
    );

    return (applied1 || applied2);
};

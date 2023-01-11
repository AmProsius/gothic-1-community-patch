/*
 * #91 Spelling - Horatio: "Ricelord" (DE)
 */
func int G1CP_091_DE_HoratioAddChoiceAvenge() {
    const string originalStr = "Ja. Ich will es mit Ricelord und seinen Schl�gern aufnehmen k�nnen!";
    const string correctedStr = "Ja. Ich will es mit dem Reislord und seinen Schl�gern aufnehmen k�nnen!";

    return G1CP_InfoChangeChoiceText("DIA_Horatio_ThoughtSTR_Info", originalStr, correctedStr);
};

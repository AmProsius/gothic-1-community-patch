/*
 * #91 Spelling - Horatio: "Ricelord" (DE)
 */
func int G1CP_091_DE_HoratioAddChoiceAvenge() {
    var int symbId; symbId = MEM_GetSymbolIndex("DIA_Horatio_ThoughtSTR_Info");
    const string needle  = "Ja. Ich will es mit Ricelord und seinen Schl�gern aufnehmen k�nnen!";
    const string replace = "Ja. Ich will es mit dem Reislord und seinen Schl�gern aufnehmen k�nnen!";
    return(G1CP_ReplacePushStr(symbId, needle, replace) > 0);
};

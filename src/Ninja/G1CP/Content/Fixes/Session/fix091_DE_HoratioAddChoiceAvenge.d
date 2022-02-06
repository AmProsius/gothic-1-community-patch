/*
 * #91 Spelling - Horatio: "Ricelord" (DE)
 */
func int G1CP_091_DE_HoratioAddChoiceAvenge() {
    var int funcId; funcId = G1CP_GetFuncId("DIA_Horatio_ThoughtSTR_Info", "void|none");
    const string needle  = "Ja. Ich will es mit Ricelord und seinen Schlägern aufnehmen können!";
    const string replace = "Ja. Ich will es mit dem Reislord und seinen Schlägern aufnehmen können!";
    return(G1CP_ReplacePushStr(funcId, 0, needle, replace) > 0);
};

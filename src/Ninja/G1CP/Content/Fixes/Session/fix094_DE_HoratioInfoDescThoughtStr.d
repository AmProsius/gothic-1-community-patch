/*
 * #94 Spelling - Horatio: "noch einmal" (DE)
 */
func int G1CP_094_DE_HoratioInfoDescThoughtStr() {
    var int symbId; symbId = MEM_GetSymbolIndex("DIA_Horatio_ThoughtSTR");
    const string needle  = "Ich hab' nochmal über die Sache nachgedacht...";
    const string replace = "Ich hab' noch einmal über die Sache nachgedacht..."; // Must be a constant
    return (G1CP_ReplaceAssignStr(symbId, "C_INFO.DESCRIPTION", 0, needle, replace) > 0);
};

/*
 * #92 Spelling - Horatio: "den Reislord" (DE)
 */
func int G1CP_092_DE_HoratioAddChoiceWipeOut() {
    var int symbId; symbId = MEM_GetSymbolIndex("DIA_Horatio_PleaseTeachSTR_Info");
    const string needle  = "Damit ich Reislord und seine Schläger fertigmachen kann!";
    const string replace = "Damit ich den Reislord und seine Schläger fertigmachen kann!";
    return (G1CP_ReplacePushStr(symbId, 0, needle, replace) > 0);
};

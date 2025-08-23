/*
 * #92 Spelling - Horatio: "den Reislord" (DE)
 */
func int G1CP_0092_DE_HoratioAddChoiceWipeOut() {
    var int funcId; funcId = G1CP_GetFuncId("DIA_Horatio_PleaseTeachSTR_Info", "void|none");
    const string needle  = "Damit ich Reislord und seine Schläger fertigmachen kann!";
    const string replace = "Damit ich den Reislord und seine Schläger fertigmachen kann!";
    return (G1CP_ReplacePushStr(funcId, 0, needle, replace) > 0);
};

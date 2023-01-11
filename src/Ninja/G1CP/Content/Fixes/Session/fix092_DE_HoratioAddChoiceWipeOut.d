/*
 * #92 Spelling - Horatio: "den Reislord" (DE)
 */
func int G1CP_092_DE_HoratioAddChoiceWipeOut() {
    const string originalStr = "Damit ich Reislord und seine Schläger fertigmachen kann!";
    const string correctedStr = "Damit ich den Reislord und seine Schläger fertigmachen kann!";

    return G1CP_InfoChangeChoiceText("DIA_Horatio_PleaseTeachSTR_Info", originalStr, correctedStr);
};

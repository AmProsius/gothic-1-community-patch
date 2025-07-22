/*
 * #94 Spelling - Horatio: "noch einmal" (DE)
 */
func int G1CP_0094_DE_HoratioInfoDescThoughtStr() {
    const string originalStr = "Ich hab' nochmal über die Sache nachgedacht...";
    const string correctedStr = "Ich hab' noch einmal über die Sache nachgedacht...";

    return G1CP_InfoChangeDesc("DIA_Horatio_ThoughtSTR", originalStr, correctedStr);
};

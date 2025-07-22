/*
 * #94 Spelling - Horatio: "noch einmal" (DE)
 */
func int G1CP_0094_DE_HoratioInfoDescThoughtStr() {
    const string originalStr = "Ich hab' nochmal �ber die Sache nachgedacht...";
    const string correctedStr = "Ich hab' noch einmal �ber die Sache nachgedacht...";

    return G1CP_InfoChangeDesc("DIA_Horatio_ThoughtSTR", originalStr, correctedStr);
};

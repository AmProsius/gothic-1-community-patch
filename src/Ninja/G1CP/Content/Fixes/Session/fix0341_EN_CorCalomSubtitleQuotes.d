/*
 * #341 Spelling - There are quotation marks in the subtitles of the welcome dialog with Cor Calom (EN)
 */
func int G1CP_0341_EN_CorCalomSubtitleQuotes() {
    const int DOUBLE_QUOTE = 34;
    const string original = "";
    const string cleaned = "That was it? No welcome, no nothing?";
    if (SB_New()) {
        SBc(DOUBLE_QUOTE);
        SB("That was it? No ");
        SBc(DOUBLE_QUOTE); SBc(DOUBLE_QUOTE);
        SB("welcome");
        SBc(DOUBLE_QUOTE); SBc(DOUBLE_QUOTE);
        SB(", no nothing?");
        SBc(DOUBLE_QUOTE);
        original = SB_ToString();
        SB_Destroy();
    };

    return G1CP_ReplaceOuText("GUR_1201_CorKalom_JoinPSI_15_10", original, cleaned);
};

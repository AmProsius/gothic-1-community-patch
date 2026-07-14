/*
 * #344 Spelling - There are quotation marks in Ian's subtitles (EN)
 */
func int G1CP_0344_EN_IanSubtitleQuotes() {
    const int DOUBLE_QUOTE = 34;
    const string cleaned = "";
    if (SB_New()) {
        SB("Just tell him ");
        SBc(DOUBLE_QUOTE);
        SB("Everything's gonna be fine");
        SBc(DOUBLE_QUOTE);
        SB(". Then he'll know that I've given you permission.");
        cleaned = SB_ToString();
        SB_Destroy();
    };
    return G1CP_ReplaceOuText(
        "STT_301_IAN_GEAR_SUC_Info_13_04",
        ConcatStrings(ConcatStrings(quote, cleaned), quote),
        cleaned
    );
};

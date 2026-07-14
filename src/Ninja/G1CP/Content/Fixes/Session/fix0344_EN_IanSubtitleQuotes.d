/*
 * #344 Spelling - There are quotation marks in Ian's subtitles (EN)
 */
func int G1CP_0344_EN_IanSubtitleQuotes() {
    // Create one character string with containing one double quote
    const int DOUBLE_QUOTE = 34;
    const string quote = " "; MEM_WriteByte(STR_toChar(quote), DOUBLE_QUOTE);
    const string cleaned = ConcatStrings(
        ConcatStrings(
            ConcatStrings(
                ConcatStrings("Just tell him ", quote),
                "Everything's gonna be fine"
            ),
            quote
        ),
        ". Then he'll know that I've given you permission."
    );
    return G1CP_ReplaceOuText(
        "STT_301_IAN_GEAR_SUC_Info_13_04",
        ConcatStrings(ConcatStrings(quote, cleaned), quote),
        cleaned
    );
};

/*
 * #382 Spelling - There are quotation marks in Lester's subtitles (EN)
 */
func int G1CP_0382_EN_LesterSubtitleQuotes() {
    // Create one character string with containing one double quote
    const int DOUBLE_QUOTE = 34;
    const string quote = " "; MEM_WriteByte(STR_toChar(quote), DOUBLE_QUOTE);
    const string cleaned = "That's the smithy! Have a look around; I'll wait here for about an hour, then I'll leave.";
    return G1CP_ReplaceOuText(
        "PC_Psionic_SMITH_Info_05_01",
        ConcatStrings(ConcatStrings(quote, cleaned), quote),
        cleaned
    );
};

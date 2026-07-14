/*
 * #344 Spelling - There are quotation marks in Ian's subtitles (EN)
 */
func int G1CP_Test_0344() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var int ouPtr; ouPtr = G1CP_Testsuite_CheckOu("STT_301_IAN_GEAR_SUC_Info_13_04");
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
    G1CP_Testsuite_AssertS(G1CP_GetOuTextP(ouPtr), cleaned);
};

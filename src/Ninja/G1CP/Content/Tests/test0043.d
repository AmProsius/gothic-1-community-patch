/*
 * #43 Missing whitespace for skill point(s)
 *
 * The skill learn print function is called.
 *
 * Expected behavior: The whitespace will be correctly added to the string.
 */
func int G1CP_Test_0043() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var int funcId; funcId = G1CP_Testsuite_CheckFunc("B_BuildLearnString", "string|string|int|int", "");
    G1CP_Testsuite_CheckPassed();

    // Call the function
    MEM_PushStringParam("Test 43"); // text
    MEM_PushIntParam(20);           // lp
    MEM_PushIntParam(10);           // ore
    MEM_CallById(funcId);
    var string output; output = MEM_PopStringResult();

    // Test the output
    if (!Hlp_StrCmp(output, "Test 43 (10 ore, 20 skill points)")) {
        G1CP_TestsuiteErrorDetail(ConcatStrings("Output incorrect: ", output));
        return FALSE;
    };

    return TRUE;
};

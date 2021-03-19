/*
 * #43 Missing whitespace for skill point(s)
 *
 * The skill learn print function is called.
 *
 * Expected behavior: The whitespace will be correctly added to the string.
 */
func int G1CP_Test_043() {
    // Check language first
    if (G1CP_Lang != G1CP_Lang_EN) {
        G1CP_TestsuiteErrorDetail("Test only applicable for the English localization");
        return TRUE; // True?
    };

    // Check if function exists
    var int funcId; funcId = MEM_GetSymbolIndex("B_BuildLearnString");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Function 'B_BuildLearnString' not found");
        return FALSE;
    };

    // Call the function
    MEM_PushStringParam("Test 43"); // text
    MEM_PushIntParam(20);           // lp
    MEM_PushIntParam(10);           // ore
    MEM_CallByID(funcId);
    var string output; output = MEM_PopStringResult();

    // Test the output
    if (Hlp_StrCmp(output, "Test 43 (10 ore, 20 skill points)")) {
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetail(ConcatStrings("Output incorrect: ", output));
        return FALSE;
    };
};

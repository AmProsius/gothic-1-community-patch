/*
 * #43 Missing whitespace for skill point(s)
 *
 * The skill learn print function is called.
 *
 * Expected behavior: The whitespace will be correctly added to the string.
 */
func int Ninja_G1CP_Test_043() {
    // Check language first
    if (Ninja_G1CP_Lang != 0) {
        Ninja_G1CP_TestsuiteErrorDetail("Test only applicable for the English localization");
        return TRUE; // True?
    };

    // Check if function exists
    var int funcId; funcId = MEM_FindParserSymbol("B_BuildLearnString");
    if (funcId == 1) {
        Ninja_G1CP_TestsuiteErrorDetail("Skill learn string function not found");
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
        Ninja_G1CP_TestsuiteErrorDetail(ConcatStrings("Output incorrect: ", output));
        return FALSE;
    };
};

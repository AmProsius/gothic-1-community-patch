/*
 * #43 Missing whitespace for skill point(s)
 *
 * The skill learn print function is called.
 *
 * Expected behavior: The whitespace will be correctly added to the string.
 */
func void G1CP_Test_0043() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var int funcId; funcId = G1CP_Testsuite_CheckFunc("B_BuildLearnString", "string|string|int|int", "");

    MEM_PushStringParam("Test 43"); // text
    MEM_PushIntParam(20);           // lp
    MEM_PushIntParam(10);           // ore
    MEM_CallById(funcId);
    G1CP_Testsuite_AssertS(MEM_PopStringResult(), "Test 43 (10 ore, 20 skill points)");
};

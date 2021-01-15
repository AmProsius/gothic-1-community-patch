/*
 * #16 Thorus' bribe dialog doesn't disappear
 */
func void Ninja_G1CP_016_ThorusBribeDialog() {
    HookDaedalusFuncS("Info_Thorus_Give1000Ore_Condition", "Ninja_G1CP_016_ThorusBribeDialog_Hook1");
    HookDaedalusFuncS("Info_Thorus_LetterForMages_Condition", "Ninja_G1CP_016_ThorusBribeDialog_Hook2");
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int Ninja_G1CP_016_ThorusBribeDialog_Hook1() {
    // Add potentially missing symbols locally
    var int Diego_GomezAudience;

    // Fill the local symbols
    var int symbPtr; symbPtr = MEM_GetSymbol("Diego_GomezAudience");
    if (symbPtr) {
        Diego_GomezAudience = MEM_ReadInt(symbPtr + zCParSymbol_content_offset);
    };

    // Check if passage is granted
    var int passGate; passGate = Ninja_G1CP_GetAIVar(MEM_FindParserSymbol("Grd_212_Torwache"), "AIV_PASSGATE", 0);

    // Add the new condition (other conditions remain untouched)
    if (Diego_GomezAudience) || (passGate) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};

/*
 * Exact copy of the function above. Need unique functions for both because of the way Daedalus hooks work
 */
func int Ninja_G1CP_016_ThorusBribeDialog_Hook2() {
    // Add potentially missing symbols locally
    var int Diego_GomezAudience;

    // Fill the local symbols
    var int symbPtr; symbPtr = MEM_GetSymbol("Diego_GomezAudience");
    if (symbPtr) {
        Diego_GomezAudience = MEM_ReadInt(symbPtr + zCParSymbol_content_offset);
    };

    // Check if passage is granted
    var int passGate; passGate = Ninja_G1CP_GetAIVar(MEM_FindParserSymbol("Grd_212_Torwache"), "AIV_PASSGATE", 0);

    // Add the new condition (other conditions remain untouched)
    if (Diego_GomezAudience) || (passGate) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};

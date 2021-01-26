/*
 * #28 Mordrag doesn't refuse to escort the player
 */
func void Ninja_G1CP_028_MordragNoEscort() {
    HookDaedalusFuncS("Org_826_Mordrag_GotoNewcamp_Condition", "Ninja_G1CP_028_MordragNoEscort_Hook");
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int Ninja_G1CP_028_MordragNoEscort_Hook() {
    // Add the new condition (other conditions remain untouched)
    var int symbPtr; symbPtr = MEM_GetSymbol("MordragKO_HauAb");
    if (symbPtr) {
        if (MEM_ReadInt(symbPtr + zCParSymbol_content_offset) == TRUE) {
            return FALSE;
        };
    };

    // Continue with the original function
    ContinueCall();
};

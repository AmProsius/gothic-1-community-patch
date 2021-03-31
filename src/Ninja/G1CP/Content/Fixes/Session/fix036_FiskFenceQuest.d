/*
 * #36 Fisk's quest isn't triggered
 */
func int G1CP_036_FiskFenceQuest() {
    var int applied; applied = FALSE;

    // Get all necessary symbols
    var int funcId; funcId = MEM_GetSymbolIndex("Stt_311_Fisk_MordragKO_Condition");
    var int varId; varId = MEM_GetSymbolIndex("MordragKO_HauAb");
    if (funcId == -1) || (varID == -1) || (MEM_GetSymbolIndex("Org_826_Mordrag") == -1) {
        return FALSE;
    };

    // Find where "MordragKO_HauAb" is pushed in the function
    const int bytes[2] = {zPAR_TOK_PUSHVAR<<24, -1};
    bytes[1] = varId;
    var int matches; matches = G1CP_FindInFunc(funcId, _@(bytes)+3, 5);

    // There should only be one occurrence, otherwise the function was somehow modified (and possibly fixed)
    if (MEM_ArraySize(matches) == 1) {
        var int pos; pos = MEM_ArrayRead(matches, 0);

        // Replace the variable check by a call
        MEMINT_OverrideFunc_Ptr = pos;
        MEMINT_OFTokPar(zPAR_TOK_CALL, MEM_GetFuncOffset(G1CP_036_FiskFenceQuest_Intercept));

        /* The part of the function should change to this

        if (MordragKO_HauAb == TRUE)  ->   if (G1CP_036_FiskFenceQuest_Intercept() == TRUE)

        or this

        if (MordragKO_HauAb)          ->   if (G1CP_036_FiskFenceQuest_Intercept())
        */

        applied = TRUE;
    };

    // Free the array
    MEM_ArrayFree(matches);

    // Return success
    return applied;
};

/*
 * This function intercepts the conditions to add another one
 */
func int G1CP_036_FiskFenceQuest_Intercept() {
    G1CP_ReportFuncToSpy();

    // Retrieve variable content (exists given the function above)
    var int hauAb; hauAb = G1CP_GetIntVar("MordragKO_HauAb", 0, 0);

    // Check for Mordrag
    var C_Npc mordrag; mordrag = Hlp_GetNpc(MEM_GetSymbolIndex("Org_826_Mordrag"));

    // Squeeze in the new check
    return (hauAb) || (Npc_IsDead(mordrag));
};

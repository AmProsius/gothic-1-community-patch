/*
 * #129 Drake has wrong body skin color
 */
func int G1CP_0129_DrakeBodySkin() {
    var int applied; applied = FALSE;

    // Get necessary symbol indices
    var int symbId; symbId = G1CP_GetNpcInstID("Grd_260_Drake");
    if (symbId == -1) {
        return FALSE;
    };

    // Find call to "Mdl_SetVisualBody"
    var int matches; matches = G1CP_FindCall(symbId, 0, MEM_GetFuncID(Mdl_SetVisualBody));

    // Check for last occurrence
    if (MEM_ArraySize(matches) > 0) {
        var int pos; pos = MEM_ArrayLast(matches);

        // Get the necessary pushed arguments
        var int arg6; arg6 = MEM_ReadInt(pos-14);
        var int arg4; arg4 = MEM_ReadInt(pos-24);
        if (MEM_ReadByte(pos-15) == zPAR_TOK_PUSHVAR) {
            arg6 = G1CP_GetIntI(arg6, 0, arg6);
        };
        if (MEM_ReadByte(pos-25) == zPAR_TOK_PUSHVAR) {
            arg4 = G1CP_GetIntI(arg4, 0, arg4);
        };

        // Confirm head texture and body skin color
        if (arg6 == 110) && (arg4 == 3) {
            // Write the correct byte code for the forth argument
            MEMINT_OverrideFunc_Ptr = pos-25;
            MEMINT_OFTokPar(zPAR_TOK_PUSHINT, 1);
            applied = TRUE;
        };
    };

    // Free the array
    MEM_ArrayFree(matches);

    return applied;
};

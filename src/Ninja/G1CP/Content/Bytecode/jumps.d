/*
 * Copy of MEM_SetCallerStackPos but for two more frames up.
 */
func void G1CP_SetCaller2FStackPos(var int popPos) {
    MEM_WriteInt(MEM_GetFrameBoundary() + 4*MEMINT_DoStackFrameSize - MEMINT_DoStackPopPosOffset, popPos);
};
func int G1CP_GetCaller2FStackPos() {
    return MEM_GetFrameBoundary() + 4*MEMINT_DoStackFrameSize - MEMINT_DoStackPopPosOffset;
};


/*
 * Make the (n-th) caller immediately return, either false (FALSE) or true (TRUE) or nothing (-1).
 */
func void G1CP_ForceNthCallerToReturn(var int ret, var int stackPos) {
    const int retFnc = 0;
    if (!retFnc) {
        retFnc = MEM_GetFuncOffset(G1CP_Return_) + 6;
    };
    if (ret < -1) || (ret > 1) {
        MEM_Error("G1CP_ForceNthCallerToReturn accepts only 'FALSE', 'TRUE', or '-1'.");
        return;
    };
    if (!stackPos) {
        MEM_Warn("G1CP_ForceNthCallerToReturn: stackPos == 0.");
        return;
    };
    MEM_WriteInt(stackPos, retFnc + ret * 6);
};
func void G1CP_ForceCallerToReturn(var int ret) {
    G1CP_ForceNthCallerToReturn(ret, G1CP_GetCaller2FStackPos());
};
func void G1CP_Return_() { // +6
    // Entrypoint for "return;""
    return; // -6:   zPAR_TOK_RET
    FALSE;  // -5:   zPAR_TOK_PUSHVAR  FALSE

    // Entrypoint for "return FALSE;"
    FALSE;  //  0:   zPAR_TOK_PUSHVAR  FALSE
    return; //  5:   zPAR_TOK_RET

    // Entrypoint for "return TRUE;"
    TRUE;   //  6:   zPAR_TOK_PUSHVAR  TRUE
    return; // 11:   zPAR_TOK_RET
};

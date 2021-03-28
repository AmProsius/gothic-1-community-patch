/*
 * #142 Dialog lines with ambient templar interchanged pt. 1
 */
func int G1CP_142_TemplarVIPDialog() {
    var int applied; applied = FALSE;

    // Specifics
    var int funcId; funcId = MEM_GetSymbolIndex("Info_Tpl_8_WichtigePersonen_Info");
    const string ou = "Info_Tpl_8_WichtigePersonen_15_02";

    // Find all output units
    const int bytes[2] = {zPAR_TOK_CALLEXTERN<<24, -1};
    bytes[1] = MEM_GetFuncID(AI_Output);
    var int matches; matches = G1CP_FindInFunc(funcId, _@(bytes)+3, 5);

    // Iterate over all output units and check the function arguments
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);

        // Read the arguments
        var int arg1; arg1 = MEM_ReadInt(pos-14); // zPAR_TOK_PUSHINST instance
        var int arg2; arg2 = MEM_ReadInt(pos-9);  // zPAR_TOK_PUSHINST instance
        var int arg3; arg3 = MEM_ReadInt(pos-4);  // zPAR_TOK_PUSHVAR  string

        // Confirm: AI_Output(self, other, "Info_Tpl_8_WichtigePersonen_15_02");
        if (arg1 == self) && (arg2 == other)
        && (Hlp_StrCmp(G1CP_GetStringVarByIndex(arg3, 0, ""), ou)) {

            // Switch self and other
            MEMINT_OverrideFunc_Ptr = pos-15;
            MEMINT_OFTokPar(zPAR_TOK_PUSHINST, other);
            MEMINT_OFTokPar(zPAR_TOK_PUSHINST, self);

            applied += 1;
        };
    end;

    // Free the array
    MEM_ArrayFree(matches);

    // Return success
    return (applied > 0);
};

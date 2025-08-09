
/*
 * Split the name of an array symbol into its name and index, e.g. "count[4]" -> ("COUNT", 4).
 * The index is the return value and the name overwrites the argument in uppercase for compatibility.
 *
 * If the number is not a valid integer or is missing or the brackets are missing, the index is returned as 0.
 * That makes "text[4]" -> ("TEXT", 4) and "text" -> ("TEXT", 0).
 */
func int G1CP_DecomposeArraySymbolName(var int strPtr) {
    if (CALL_Begin(call)) {
        const int call = 0;
        const int one = 1;
        const int three = 3;

        const int arrIdx = 0;
        const int skipPtr = 0; skipPtr = _@s("]");
        const int delimPtr = 0; delimPtr = _@s("[");
        const int memStr1Ptr = 0; memStr1Ptr = MEM_Alloc(sizeof_zString);
        const int memStr2Ptr = 0; memStr2Ptr = MEM_Alloc(sizeof_zString);

        const int zSTRING__PickWord = 4611504; //0x465DB0
        const int zSTRING__ToInt = 5759728; //0x57E2F0
        const int zSTRING___zSTRING = 4199008; //0x401260
        const int zSTRING__operatorEq = 5759168; //0x57E0C0
        const int zSTRING__Insert = 4612656; //0x466230
        const int zSTRING__Upper = 4608912; //0x465390

        // Pick "abcde" from "abcde[x]"
        CALL_PtrParam(_@(delimPtr));
        CALL_PtrParam(_@(delimPtr));
        CALL_IntParam(_@(one));
        CALL_PtrParam(_@(memStr1Ptr));
        CALL__thiscall(_@(strPtr), zSTRING__PickWord);
        // Pick "x" from "abcde[x]"
        CALL_PtrParam(_@(skipPtr));
        CALL_PtrParam(_@(delimPtr));
        CALL_IntParam(_@(three));
        CALL_PtrParam(_@(memStr2Ptr));
        CALL__thiscall(_@(strPtr), zSTRING__PickWord);
        // Save "x" as integer into arrIdx (0 if invalid)
        CALL_PutRetValTo(_@(arrIdx));
        CALL__thiscall(_@(memStr2Ptr), zSTRING__ToInt);
        // Save "abcde" into strPtr (overwriting the argument)
        CALL_PtrParam(_@(memStr1Ptr));
        CALL__thiscall(_@(strPtr), zSTRING__operatorEq);
        // Turn all to upper case
        CALL__thiscall(_@(strPtr), zSTRING__Upper);
        // Clean up
        CALL__thiscall(_@(memStr1Ptr), zSTRING___zSTRING);
        CALL__thiscall(_@(memStr2Ptr), zSTRING___zSTRING);
        call = CALL_End();
    };
    return arrIdx;
};


/*
 * Inverse function of G1CP_DecomposeArraySymbolName to construct array names from variables.
 */
func string G1CP_ComposeArraySymbolName(var string name, var int arrIdx) {
    const int s = 0;
    if (!s) {
        s = SB_New();
    };

    SB_Use(s);
    SB_Clear();

    SB(name); SB("["); SBi(arrIdx); SB("]"); // E.g. "count[4]"

    return SB_ToString();
};

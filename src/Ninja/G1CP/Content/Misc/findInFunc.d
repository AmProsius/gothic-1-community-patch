/*
 * Find matching byte code in a function (multiple times)
 * Comparison happens starting from each token. Any search needs to start with a token byte (e.g. zPAR_TOK_PUSHVAR)
 */
func int Ninja_G1CP_FindInFunc(var int funcId, var int needle, var int byteCount) {
    if (!needle) {
        return 0;
    };

    // Tokenize function to get the token onsets
    var int positions; positions = MEM_ArrayCreate();
    var int dump; dump = MEM_ArrayCreate();
    MEMINT_TokenizeFunction(funcId, dump, dump, positions);
    MEM_ArrayFree(dump);
    var int funcEnd; funcEnd = MEM_ArrayLast(positions);

    // Create array to collect all matches
    var int all; all = MEM_ArrayCreate();

    // Iterate over and compare the bytes of the function
    repeat(i, MEM_ArraySize(positions)); var int i;
        var int pos; pos = MEM_ArrayRead(positions, i);
        if (pos > funcEnd-byteCount) {
            break;
        };
        if (MEM_CompareBytes(pos, needle, byteCount)) {
            MEM_ArrayInsert(all, pos);
        };
    end;

    // Free array
    MEM_ArrayFree(positions);

    return all;
};

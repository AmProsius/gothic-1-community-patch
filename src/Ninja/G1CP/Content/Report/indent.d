/*
 * Increase or decrease zSpy indentation
 */
func void G1CP_zSpyIndent(var string caller, var int num) {
    const int indent             = 0;
    const int unindent           = 0;
    const int zerr               = 8821208; //0x8699D8
    const int zERROR__BlockBegin = 4491664; //0x448990
    const int zERROR__BlockEnd   = 4492272; //0x448BF0

    // Create engine calls first time
    if (!indent) {
        CALL_Open();
        CALL_PtrParam(_@(FALSE));
        CALL_PtrParam(_@(chr));
        CALL__thiscall(_@(zerr), zERROR__BlockBegin);
        indent = CALL_Close();

        CALL_Open();
        CALL_PtrParam(_@(FALSE));
        CALL_PtrParam(_@(chr));
        CALL__thiscall(_@(zerr), zERROR__BlockEnd);
        unindent = CALL_Close();
    };

    // Obtain indentation direction
    const int call = 0;
    if (num > 0) {
        call = indent;
    } else if (num < 0) {
        call = unindent;
        num = -num;
    } else {
        return;
    };

    // Update the indentation
    var int chr; chr = STR_ToChar(caller);
    repeat(i, num); var int i;
        ASM_Run(call);
    end;
};

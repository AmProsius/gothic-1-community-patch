/*
 * Replace element in string array constant
 */
func int G1CP_ConstReplaceStr(var string strConst, var string originalStr, var string correctedStr) {
    var int idx; idx = G1CP_FindStringConstArrIdx(strConst, originalStr);

    if (idx == -1) {
        return FALSE;
    }

    G1CP_SetStringConst(strConst, idx, correctedStr);
    return TRUE;
};

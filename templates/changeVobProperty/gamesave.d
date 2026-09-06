/*
 * #@ISSUE_NUM@ @LONGNAME@
 */
const float G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@_Pos[3] = /*### TODO Coordinates for finding the VOB ###*/{0.0, 0.0, 0.0};

/*
 * Callback function to narrow down the found VOBs
 */
func int G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@Check(var int vobPtr) {
    var zCVob vob; vob = _^(vobPtr);
    /*### TODO Uniquely identify the VOB or remove this function when using existing function as callback ###*/
    return TRUE;
};

/*
 * Apply the fix
 */
func int G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@() {
    var int vobPtr; vobPtr = G1CP_FindVobByPosPtr(
        _@f(G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@_Pos),
        /*### TODO Custom callback, Hlp_Is_* function or NOFUNC ###*/G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@Check
    );
    if (vobPtr) {
        /*### TODO Adjust the VOB properties ###*/
        var zCVob vob; vob = _^(vobPtr);
        return TRUE;
    };
    return FALSE;
};

/*
 * Revert the changes
 */
func int G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@Revert() {
    if (!G1CP_IsFixApplied(@ISSUE_NUM@)) {
        return FALSE;
    };

    var int vobPtr; vobPtr = G1CP_FindVobByPosPtr(
        _@f(G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@_Pos),
        /*### TODO Custom callback, Hlp_Is_* function or NOFUNC ###*/G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@Check
    );
    if (vobPtr) {
        /*### TODO Reverse the VOB properties to their original state ###*/
        var zCVob vob; vob = _^(vobPtr);
        return TRUE;
    };
    return FALSE;
};

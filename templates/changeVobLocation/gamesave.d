/*
 * #@ISSUE_NUM@ @LONGNAME@
 */
const float G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@_PosOld[3] = /*### TODO Original coordinates ###*/{0.0, 0.0, 0.0};
const float G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@_PosNew[3] = /*### TODO Correct coordinates ###*/{0.0, 0.0, 0.0};

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
    return G1CP_Tpl_ChangeVobLocation(
        _@f(G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@_PosOld),
        _@f(G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@_PosNew),
        /*### TODO Custom callback, Hlp_Is_* function or NOFUNC ###*/G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@Check
    );
};

/*
 * Revert the changes
 */
func int G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@Revert() {
    if (!G1CP_IsFixApplied(@ISSUE_NUM@)) {
        return FALSE;
    };

    return G1CP_Tpl_ChangeVobLocation(
        _@f(G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@_PosNew),
        _@f(G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@_PosOld),
        /*### TODO Custom callback, Hlp_Is_* function or NOFUNC ###*/G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@Check
    );
};

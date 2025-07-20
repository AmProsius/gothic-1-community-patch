/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}() {
    // ### TODO: Replace routine name of "Rtn_Name_000" ###
    // ### TODO: Replace original waypoint name of "XXX_ORIGINAL" ###
    // ### TODO: Replace corrected waypoint name of "XXX_CORRECTED" ###
    var int funcId; funcId = G1CP_GetFuncId("Rtn_Name_000", "void|none");

    return (G1CP_ReplacePushStr(funcId, 0, "XXX_ORIGINAL", "XXX_CORRECTED") > 0);
};

/*
 * #{ISSUE_NUM} {LONGNAME}
 */

/*
 * Make the positions available to the functions below
 */
const float G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_PosOld[3] = {0, 0, 0}; // ### TODO Add coordinates, e.g. from Spacer ###
const float G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_PosNew[3] = {0, 0, 0}; // ### TODO Add coordinates, e.g. from Spacer ###

/*
 * Apply the fix
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}() {
    return G1CP_Tpl_ChangeVobLocation(
        _@f(G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_PosOld),
        _@f(G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_PosNew),
        callback // ### TODO Replace callback function ###
    );
};

/*
 * This function reverts the changes
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}Revert() {
    if (!G1CP_IsFixApplied({ISSUE_NUM})) {
        return FALSE;
    };

    return G1CP_Tpl_ChangeVobLocation(
        _@f(G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_PosNew),
        _@f(G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_PosOld),
        callback // ### TODO Replace callback function, same as above ###
    );
};

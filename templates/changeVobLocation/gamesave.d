/*
 * #{ISSUE_NUM} {LONGNAME}
 */

// ### TODO: Replace original position of {0, 0, 0} ###
// ### TODO: Replace corrected position of {0, 0, 0} ###
// ### TODO: Replace callbacks of Hlp_Is_Todo ###

/*
 * Make the positions available to the functions below
 */
const float G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_OriginalPos[3] = {0, 0, 0};
const float G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_CorrectedPos[3] = {0, 0, 0};

/*
 * Apply the fix
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}() {
    return G1CP_ChangeVobLocation(_@(G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_OriginalPos),
                                  _@(G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_CorrectedPos), Hlp_Is_Todo);
};

/*
 * This function reverts the changes
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}Revert() {
    if (!G1CP_IsFixApplied({ISSUE_NUM})) {
        return FALSE;
    };

    return G1CP_ChangeVobLocation(_@(G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_CorrectedPos),
                                  _@(G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_OriginalPos), Hlp_Is_Todo);
};
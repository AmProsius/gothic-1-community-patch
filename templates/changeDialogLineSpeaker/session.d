/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}() {
    // ### TODO: Replace info name of "Xxx_Info" ###
    // ### TODO: Replace OU name of "Xxx_Ou" ###
    // ### TODO: Optional: Switch `other` and `self` ###

    var int funcId; funcId = G1CP_GetFuncId("Xxx_Info", "void|none");
    return (G1CP_ReplaceOuInst(funcId, 0, "Xxx_Ou", self, other, other, self) > 0);
};

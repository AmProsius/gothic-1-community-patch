/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}() {
    var int funcId; funcId = G1CP_GetFuncId("### TODO info function ###", "void|none");
    return (G1CP_ReplaceOuInst(funcId, 0, "### TODO OU name ###", self, other, other, self) > 0);  // ### TODO Adjust ordering of self, other ###
};

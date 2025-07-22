/*
 * #142 Dialog lines with ambient templar interchanged pt. 1
 */
func int G1CP_0142_TemplarVIPDialog() {
    var int funcId; funcId = G1CP_GetFuncId("Info_Tpl_8_WichtigePersonen_Info", "void|none");

    return (G1CP_ReplaceOuInst(funcId, 0, "Info_Tpl_8_WichtigePersonen_15_02", self, other, other, self) > 0);
};

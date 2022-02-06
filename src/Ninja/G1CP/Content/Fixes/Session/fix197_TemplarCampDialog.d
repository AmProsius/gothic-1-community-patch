/*
 * #197 Dialog lines with ambient templar interchanged pt. 2
 */
func int G1CP_197_TemplarCampDialog() {
    var int funcId; funcId = G1CP_GetFuncId("Info_Tpl_8_DasLager_Info", "void|none");
    return (G1CP_ReplaceOuInst(funcId, 0, "Info_Tpl_8_DasLager_08_02", other, self, self, other) > 0);
};

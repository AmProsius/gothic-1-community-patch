/*
 * #142 Dialog lines with ambient templar interchanged pt. 1
 */
func int G1CP_142_TemplarVIPDialog() {
    var int funcId; funcId = MEM_GetSymbolIndex("Info_Tpl_8_WichtigePersonen_Info");
    return (G1CP_ReplaceOUInst(funcId, 0, "Info_Tpl_8_WichtigePersonen_15_02", self, other, other, self) > 0);
};

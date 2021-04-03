/*
 * #197 Dialog lines with ambient templar interchanged pt. 2
 */
func int G1CP_197_TemplarCampDialog() {
    var int funcId; funcId = MEM_GetSymbolIndex("Info_Tpl_8_DasLager_Info");
    return (G1CP_OUReplaceInst(funcId, "Info_Tpl_8_DasLager_08_02", other, self, self, other) > 0);
};

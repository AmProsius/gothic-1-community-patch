/*
 * #216 Digger doesn't repair hut
 */
func int G1CP_216_DiggerDailyRoutine() {
    var int funcId; funcId = MEM_GetSymbolIndex("Rtn_start_506");
    return (G1CP_ReplacePushStr(funcId, "OCR_Hut_15", "OCR_HUT_15") > 0);
};

/*
 * #216 Digger doesn't repair hut
 */
func int G1CP_216_DiggerDailyRoutine() {
    var int funcId; funcId = G1CP_GetFuncId("Rtn_start_506", "void|none");
    return (G1CP_ReplacePushStr(funcId, 0, "OCR_Hut_15", "OCR_HUT_15") > 0);
};

/*
 * #214 Graham doesn't sit at campfire
 */
func int G1CP_214_GrahamDailyRoutine() {
    var int funcId; funcId = G1CP_GetFuncId("Rtn_start_573", "void|none");

    return (G1CP_ReplacePushStr(funcId, 0, "OCR_OUSIDE_HUT_77_INSERT", "OCR_OUTSIDE_HUT_77_INSERT") > 0);
};

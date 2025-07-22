/*
 * #215 Guy doesn't sit at arena
 */
func int G1CP_0215_GuyDailyRoutine() {
    var int funcId; funcId = G1CP_GetFuncId("Rtn_start_530", "void|none");

    return (G1CP_ReplacePushStr(funcId, 0, "OCR_OUTSIDE_ARENA_BENCH_2", "OCR_OUTSIDE_ARENA_BENCH2") > 0);
};

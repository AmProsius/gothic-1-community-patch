/*
 * #215 Guy doesn't sit at arena
 */
func int G1CP_215_GuyDailyRoutine() {
    var int funcId; funcId = MEM_GetSymbolIndex("Rtn_start_530");
    return (G1CP_ReplacePushStr(funcId, "OCR_OUTSIDE_ARENA_BENCH_2", "OCR_OUTSIDE_ARENA_BENCH2") > 0);
};

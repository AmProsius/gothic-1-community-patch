/*
 * #215 Guy doesn't sit at arena
 */
func int G1CP_215_GuyDailyRoutine() {  
    const string rtnName = "Rtn_start_530";
    const string originalWpName = "OCR_OUTSIDE_ARENA_BENCH_2";
    const string correctedWpName = "OCR_OUTSIDE_ARENA_BENCH2";

    return (G1CP_RtnChangeWp(rtnName, originalWpName, correctedWpName) > 0);
};

/*
 * #214 Graham doesn't sit at campfire
 */
func int G1CP_214_GrahamDailyRoutine() {
    const string rtnName = "Rtn_start_573";
    const string originalWpName = "OCR_OUSIDE_HUT_77_INSERT";
    const string correctedWpName = "OCR_OUTSIDE_HUT_77_INSERT";

    return (G1CP_RtnChangeWp(rtnName, originalWpName, correctedWpName) > 0);
};

/*
 * #216 Digger doesn't repair hut
 */
func int G1CP_216_DiggerDailyRoutine() {
    const string rtnName = "Rtn_start_506";
    const string originalWpName = "OCR_Hut_15";
    const string correctedWpName = "OCR_HUT_15";

    return (G1CP_RtnChangeWp(rtnName, originalWpName, correctedWpName) > 0);
};

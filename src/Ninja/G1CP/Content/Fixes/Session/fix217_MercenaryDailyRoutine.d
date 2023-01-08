/*
 * #217 Mercenary doesn't guard the palisade
 */
func int G1CP_217_MercenaryDailyRoutine() {
    const string rtnName = "Rtn_FMCstart_750";
    const string originalWpName = "FMC_Path19";
    const string correctedWpName = "FMC_PATH19";

    return (G1CP_RtnChangeWp(rtnName, originalWpName, correctedWpName) > 0);
};

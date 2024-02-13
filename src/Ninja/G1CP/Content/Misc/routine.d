/*
 * Change waypoint of daily routine
 */
func int G1CP_RtnChangeWp(var string rtnName, var string originalWpName, var string correctedWpName) {
    var int funcId; funcId = G1CP_GetFuncId(rtnName, "void|none");

    return (G1CP_ReplacePushStr(funcId, 0, originalWpName, correctedWpName) > 0);
};

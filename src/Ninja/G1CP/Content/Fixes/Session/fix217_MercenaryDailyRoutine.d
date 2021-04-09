/*
 * #217 Mercenary doesn't guard the palisade
 */
func int G1CP_217_MercenaryDailyRoutine() {
    var int funcId; funcId = MEM_GetSymbolIndex("Rtn_FMCstart_750");
    return (G1CP_ReplacePushStr(funcId, 0, "FMC_Path19", "FMC_PATH19") > 0);
};

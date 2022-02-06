/*
 * #30 Silas trades only one time
 */
func int G1CP_030_SilasTrade() {
    var int symbId; symbId = G1CP_GetInfoInstId("DIA_Silas_Trade");
    return (G1CP_ReplaceAssignInt(symbId, 0, "C_Info.permanent", 0, 0, 1) > 0);
};

/*
 * #30 Silas trades only one time
 */
func int G1CP_030_SilasTrade() {
    const string infoName = "DIA_Silas_Trade";
    const string infoProp = "permanent";
    const int originalInt = 0;
    const int correctedInt = 1;

    return (G1CP_ChangeInfoIntVar(infoName, infoProp, originalInt, correctedInt) > 0);
};

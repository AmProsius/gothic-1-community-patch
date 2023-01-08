/*
 * #235 Spelling - Magic book: "Verwandlung Orkhund" (DE)
 */
func int G1CP_235_DE_OrcDogMagBook() {
    const string strConst = "TXT_SPELLS";
    const string originalStr = "Verwandlung Orc-Hund";
    const string correctedStr = "Verwandlung Orkhund";

    return (G1CP_ConstReplaceStr(strConst, originalStr, correctedStr) > 0);
};

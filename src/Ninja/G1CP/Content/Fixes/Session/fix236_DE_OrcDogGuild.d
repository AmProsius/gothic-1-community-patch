/*
 * #236 Spelling - Guild: "Orkhund" (DE)
 */
func int G1CP_236_DE_OrcDogGuild() {
    const string strConst = "TXT_GUILDS";
    const string originalStr = "Ork-Hund";
    const string correctedStr = "Orkhund";

    return (G1CP_ConstReplaceStr(strConst, originalStr, correctedStr) > 0);
};

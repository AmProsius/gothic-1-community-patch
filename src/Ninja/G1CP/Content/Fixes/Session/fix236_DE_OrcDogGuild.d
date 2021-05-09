/*
 * #236 Spelling - Guild: "Orkhund" (DE)
 */
func int G1CP_236_DE_OrcDogGuild() {
    var int idx; idx = G1CP_FindStringConstArrIdx("TXT_GUILDS", "Ork-Hund");
    if (idx != -1) {
        G1CP_SetStringConst("TXT_GUILDS", idx, "Orkhund");
        return TRUE;
    } else {
        return FALSE;
    };
};
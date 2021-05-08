/*
 * #235 Spelling - Magic book: "Verwandlung Orkhund" (DE)
 */
func int G1CP_235_DE_OrcDogMagBook() {
    var int idx; idx = G1CP_FindStringConstArrIdx("TXT_SPELLS", "Verwandlung Orc-Hund");
    if (idx != -1) {
        G1CP_SetStringConst("TXT_SPELLS", idx, "Verwandlung Orkhund");
        return TRUE;
    } else {
        return FALSE;
    };
};
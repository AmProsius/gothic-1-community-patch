/*
 * Guess localization (0 = EN, 1 = DE, 2 = PL, 3 = RU)
 * Source: https://github.com/szapp/Ninja/wiki/Inject-Changes#localization
 */
func int G1CP_GuessLocalization() {
    var int pan; pan = MEM_GetSymbol("MOBNAME_PAN");
    if (pan) {
        var zCPar_Symbol panSymb; panSymb = _^(pan);
        var string panName; panName = MEM_ReadString(panSymb.content);
        if (Hlp_StrCmp(panName, "Pfanne")) { // DE (Windows 1252)
            return G1CP_Lang_DE;
        } else if (Hlp_StrCmp(panName, "Patelnia")) { // PL (Windows 1250)
            return G1CP_Lang_PL;
        } else if (Hlp_StrCmp(panName, "Сковорода")) { // RU (Windows 1251)
            return G1CP_Lang_RU;
        };
    };
    return G1CP_Lang_EN; // Otherwise EN
};

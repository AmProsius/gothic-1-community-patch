/*
 * #15 Horatio may lower STRENGTH
 */
func int Ninja_G1CP_015_HoratioStrength() {
    const int PrintScreen_popped = 6630384; //0x652BF0

    if (MEM_FindParserSymbol("DIA_Horatio_HelpSTR_LEARN_NOW") != -1)
    && (Ninja_G1CP_IsMemAvail(PrintScreen_popped, "8B 35 BC A6 8D 00")) {
        HookDaedalusFuncS("DIA_Horatio_HelpSTR_LEARN_NOW", "Ninja_G1CP_015_HoratioStrength_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * Backup of strength before dialog (global to be accessible from the print hook)
 */
const int Ninja_G1CP_015_HoratioStrength_StrBak = 0;

/*
 * This function wraps around DIA_Horatio_HelpSTR_LEARN_NOW to reinstate the strength if it decreased
 */
func void Ninja_G1CP_015_HoratioStrength_Hook() {
    Ninja_G1CP_ReportFuncToSpy();

    const int PrintScreen_popped = 6630384; //0x652BF0

    // Define possibly missing symbols locally
    const int ATR_STRENGTH = 4;

    // Backup the strength before the dialog
    Ninja_G1CP_015_HoratioStrength_StrBak = hero.attribute[ATR_STRENGTH];

    // Place hook to fix on-screen information
    if (Ninja_G1CP_IsMemAvail(PrintScreen_popped, "8B 35 BC A6 8D 00")) {
        HookEngineF(PrintScreen_popped, 6, Ninja_G1CP_015_HoratioStrength_PrintFix);
    };

    // Call the original DIA_Horatio_HelpSTR_LEARN_NOW
    ContinueCall();

    // Remove print fix hook again
    RemoveHookF(PrintScreen_popped, 6, Ninja_G1CP_015_HoratioStrength_PrintFix);

    // If lower, reset strength to before
    if (hero.attribute[ATR_STRENGTH] < Ninja_G1CP_015_HoratioStrength_StrBak) {
        hero.attribute[ATR_STRENGTH] = Ninja_G1CP_015_HoratioStrength_StrBak;
    };
};

/*
 * This function hooks PrintScreen (temporarily, see above) and replaces the on-screen text if necessary
 */
func void Ninja_G1CP_015_HoratioStrength_PrintFix() {
    Ninja_G1CP_ReportFuncToSpy();

    // Get text parameter
    var zString zstr; zstr = _^(ESP+60);
    var int pos; pos = zstr.len-3;
    var string textEnd; textEnd = STR_FromChar(zstr.ptr+pos);

    // Compare if it ends on "100"
    if (Hlp_StrCmp(textEnd, "100")) {
        var string text; text = MEM_ReadString(ESP+60);
        text = STR_SubStr(text, 0, pos);
        text = ConcatStrings(text, IntToString(Ninja_G1CP_015_HoratioStrength_StrBak));

        // Assign with new string
        MEM_WriteString(ESP+60, text);
    };
};

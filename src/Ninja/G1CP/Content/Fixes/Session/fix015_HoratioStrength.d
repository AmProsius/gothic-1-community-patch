/*
 * #15 Horatio may lower STRENGTH
 */
func int G1CP_015_HoratioStrength() {
    var int funcId;   funcId   = MEM_FindParserSymbol("DIA_Horatio_HelpSTR_LEARN_NOW");
    var int needleId; needleId = MEM_GetFuncID(PrintScreen);
    var int replacId; replacId = MEM_GetFuncID(G1CP_015_HoratioStrength_PrintScreen);

    if (funcId != -1) {
        HookDaedalusFuncS("DIA_Horatio_HelpSTR_LEARN_NOW", "G1CP_015_HoratioStrength_Hook");
        var int count; count = G1CP_ReplaceCallInFunc(funcId, needleId, replacId);
        return (count > 0);
    } else {
        return FALSE;
    };
};

/*
 * Backup of strength before dialog (global to be accessible from the print hook)
 */
const int G1CP_015_HoratioStrength_StrBak = 0;

/*
 * This function wraps around DIA_Horatio_HelpSTR_LEARN_NOW to reinstate the strength if it decreased
 */
func void G1CP_015_HoratioStrength_Hook() {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int ATR_STRENGTH = 4;

    // Backup the strength before the dialog
    G1CP_015_HoratioStrength_StrBak = hero.attribute[ATR_STRENGTH];

    // Call the original DIA_Horatio_HelpSTR_LEARN_NOW
    ContinueCall();

    // If lower, reset strength to before
    if (hero.attribute[ATR_STRENGTH] < G1CP_015_HoratioStrength_StrBak) {
        hero.attribute[ATR_STRENGTH] = G1CP_015_HoratioStrength_StrBak;
    };
};

/*
 * This function intercepts the calls to PrintScreen and replaces the on-screen text if necessary
 */
func void G1CP_015_HoratioStrength_PrintScreen(var string msg, var int x, var int y, var string font, var int timeSec) {
    G1CP_ReportFuncToSpy();

    // Get end of text
    var zString zstr; zstr = _^(_@s(msg));
    var int pos; pos = zstr.len-3;
    var string textEnd; textEnd = STR_FromChar(zstr.ptr+pos);

    // Compare if the text ends on "100"
    if (Hlp_StrCmp(textEnd, "100")) {
        msg = STR_SubStr(msg, 0, pos);
        msg = ConcatStrings(msg, IntToString(G1CP_015_HoratioStrength_StrBak));
    };

    // Proceed
    PrintScreen(msg, x, y, font, timeSec);
};

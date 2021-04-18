/*
 * #176 The text of items with no value is incomplete in the inventory
 */
func int G1CP_176_InvItemTextValue() {
    const int oCItemContainer__DrawItemInfo_showText = 6714596; //0x6674E4

    if (G1CP_CheckBytes(oCItemContainer__DrawItemInfo_showText, "50 53 68 FA 00 00 00") == 1) // Must not be hooked
    && (G1CP_IsStringConst("NAME_Value", 0)) {
        HookEngineF(oCItemContainer__DrawItemInfo_showText, 7, G1CP_176_InvItemTextValue_Hook);
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * Engine hook to intercept printing of the left hand text
 * This function is called five times per frame when the inventory is open. It should be replaced by machine code!
 */
func void G1CP_176_InvItemTextValue_Hook() {
    // Get the content of the string once
    const string NAME_Value = "";
    const int once = 0;
    if (!once) {
        once = 1;
        NAME_Value = G1CP_GetStringConst("NAME_Value", 0, NAME_Value);
    };

    if (!EDI) { // The value number
        var string left; left = MEM_ReadString(EAX); // The text on the left side
        if (STR_Compare(left, NAME_Value) == STR_EQUAL) {
            EAX = _@s(""); // New text on the left side
        };
    };
};

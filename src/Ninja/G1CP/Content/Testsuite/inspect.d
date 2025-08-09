/*
 * Inspect a string property of an item
 */
func int G1CP_Testsuite_InspectItemString(var C_Item itm, var string classVar, var string expected) {
    var string itmVar;

    var string baseName; baseName = classVar; // Copy will be modified
    var int arrIdx; arrIdx = G1CP_DecomposeArraySymbolName(_@s(baseName));

    if (Hlp_StrCmp(classVar, "name")) {
        itmVar = itm.name;
    } else if (Hlp_StrCmp(classVar, "description")) {
        itmVar = itm.description;
    } else if (Hlp_StrCmp(baseName, "text")) {
        if (arrIdx <= 0) {
            itmVar = itm.text;
        } else {
            itmVar = MEM_ReadStatStringArr(itm.text, arrIdx);
        };
    } else {
        G1CP_TestsuiteErrorDetailSSS("Property '", classVar, "' not recognized");
        return FALSE;
    };

    if (STR_Compare(itmVar, expected) != STR_EQUAL) {
        G1CP_TestsuiteErrorDetailSSSSS("Property incorrect: ", classVar, " = '", itmVar, "'");
        return FALSE;
    };

    return TRUE;
};


/*
 * Inspect a string property of an NPC
 */
func int G1CP_Testsuite_InspectNpcString(var C_Npc npc, var string classVar, var string expected) {
    var string npcVar;

    if (Hlp_StrCmp(classVar, "name")) {
        npcVar = npc.name;
    } else {
        G1CP_TestsuiteErrorDetailSSS("Property '", classVar, "' not recognized");
        return FALSE;
    };

    if (STR_Compare(npcVar, expected) != STR_EQUAL) {
        G1CP_TestsuiteErrorDetailSSSSS("Property incorrect: ", classVar, " = '", npcVar, "'");
        return FALSE;
    };

    return TRUE;
};


/*
 * Inspect a string property of an output unit
 */
func int G1CP_Testsuite_InspectOuString(var int ouPtr, var string classVar, var string expected) {
    var string ouVar;

    if (Hlp_StrCmp(classVar, "text")) {
        ouVar = G1CP_GetOuTextP(ouPtr);
    } else if (Hlp_StrCmp(classVar, "name")) {
        ouVar = G1CP_GetOuFilenameP(ouPtr);
    } else {
        G1CP_TestsuiteErrorDetailSSS("Property '", classVar, "' not recognized");
        return FALSE;
    };

    if (STR_Compare(ouVar, expected) != STR_EQUAL) {
        G1CP_TestsuiteErrorDetailSSSSS("Property incorrect: ", classVar, " = '", ouVar, "'");
        return FALSE;
    };

    return TRUE;
};

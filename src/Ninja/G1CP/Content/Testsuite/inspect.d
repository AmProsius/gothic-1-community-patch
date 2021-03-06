/*
 * The variable of the item is inspected programmatically.
 *
 * Expected behavior: The item will have the correct variable.
 */
func int G1CP_Testsuite_InspectItemVariable(var C_Item itm, var string type, var string expectedVar) {
    var string itmVar;

    if (Hlp_StrCmp(type, "name")) {
        itmVar = itm.name;
    } else if (Hlp_StrCmp(type, "description")) {
        itmVar = itm.description;
    } else if (Hlp_StrCmp(type, "text[0]")) {
        itmVar = itm.text;
    } else if (Hlp_StrCmp(type, "text[1]")) {
        itmVar = MEM_ReadStatStringArr(itm.text, 1);
    } else if (Hlp_StrCmp(type, "text[2]")) {
        itmVar = MEM_ReadStatStringArr(itm.text, 2);
    } else if (Hlp_StrCmp(type, "text[3]")) {
        itmVar = MEM_ReadStatStringArr(itm.text, 3);
    } else if (Hlp_StrCmp(type, "text[4]")) {
        itmVar = MEM_ReadStatStringArr(itm.text, 4);
    } else {
        G1CP_TestsuiteErrorDetailSSS("Property '", type, "' not recognized");
        return FALSE;
    };

    if (STR_Compare(itmVar, expectedVar) != STR_EQUAL) {
        G1CP_TestsuiteErrorDetailSSSSS("Property incorrect: ", type, " = '", itmVar, "'");
        return FALSE;
    };
    
    return TRUE;
};

/*
 * The variable of the npc is inspected programmatically.
 *
 * Expected behavior: The npc will have the correct variable.
 */
func int G1CP_Testsuite_InspectNpcVariable(var C_Npc npc, var string type, var string expectedVar) {
    var string npcVar;

    if (Hlp_StrCmp(type, "name")) {
        npcVar = npc.name;
    } else {
        G1CP_TestsuiteErrorDetailSSS("Property '", type, "' not recognized");
        return FALSE;
    };

    if (STR_Compare(npcVar, expectedVar) != STR_EQUAL) {
        G1CP_TestsuiteErrorDetailSSSSS("Property incorrect: ", type, " = '", npcVar, "'");
        return FALSE;
    };
    
    return TRUE;
};

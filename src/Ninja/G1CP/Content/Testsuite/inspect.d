/*
 * The variable of the item is inspected programmatically.
 *
 * Expected behavior: The item will have the correct variable.
 */
func int G1CP_Testsuite_InspectItemVariable(var C_Item itm, var string type, var string expectedVar) {
    var string itmVar;

    if (type == "name") {
        itmVar = itm.name;
    } else if (type == "description") {
        itmVar = itm.description;
    } else if (type == "text[0]") {
        itmVar = itm.text;
    } else if (type == "text[1]") {
        itmVar = MEM_ReadStatStringArr(itm.text, 1);
    } else if (type == "text[2]") {
        itmVar = MEM_ReadStatStringArr(itm.text, 2);
    } else if (type == "text[3]") {
        itmVar = MEM_ReadStatStringArr(itm.text, 3);
    } else if (type == "text[4]") {
        itmVar = MEM_ReadStatStringArr(itm.text, 4);
    } else {
        return FALSE;
    };

    if (STR_Compare(itmVar, expectedVar) != STR_EQUAL) {
        G1CP_TestsuiteErrorDetailSSSSS("Property incorrect: ", type, " = '", itmVar, "'");
        return FALSE;
    };
    
    return TRUE;
};

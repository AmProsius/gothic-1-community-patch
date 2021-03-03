/*
 * #44 Bugmeat in the wrong inventory category
 *
 * The mainflag (item category) of the item "ItAt_Meatbug_01" is inspected programmatically
 *
 * Expected behavior: The item will have the correct mainflag
 */
func int Ninja_G1CP_Test_044() {
    // Define possibly missing symbols locally
    const int ITEM_KAT_FOOD = 1 << 5;

    // Check if item exists
    var int symbId; symbId = MEM_FindParserSymbol("ItAt_Meatbug_01");
    if (symbId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Item 'ItAt_Meatbug_01' not found");
        return FALSE;
    };

    // Create the key locally
    if (Itm_GetPtr(symbId)) {
        if (item.mainflag == ITEM_KAT_FOOD) {
            return TRUE;
        } else {
            var string msg; msg = "Category incorrect: mainflag = '";
            msg = ConcatStrings(msg, IntToString(item.mainflag));
            msg = ConcatStrings(msg, "'");
            Ninja_G1CP_TestsuiteErrorDetail(msg);
            return FALSE;
        };
    } else {
        Ninja_G1CP_TestsuiteErrorDetail("Item 'ItAt_Meatbug_01' could not be created");
        return FALSE;
    };
};

/*
 * Check if item instance exists, create an item of that instance and return it
 */
func C_Item G1CP_Testsuite_CreateItem(var string name) {
    // Backup global symbol
    var C_Item itemBak; itemBak = MEM_CpyInst(item);

    var int symbId; symbId = G1CP_Testsuite_CheckItem(name);
    if (symbId != -1) {
        // Create the item locally using the Item_Helper
        var int itmPtr; itmPtr = Itm_GetPtr(symbId);
        if (!itmPtr) {
            G1CP_TestsuiteErrorDetailSSS("Item of instance '", name, "' could not be created");
            G1CP_TestsuiteStatusPassed = FALSE;
            MEM_NullToInst();
        } else {
            _^(itmPtr);
            // var C_Item itm; itm = MEM_CpyInst(item); // Item_Helper assigns global symbol
            // MEMINT_StackPushInst(itm); // Need to push another instance
        };
    } else {
        MEM_NullToInst();
    };

    // Restore global symbol
    item = MEM_CpyInst(itemBak);
};

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
            G1CP_TestsuiteErrorDetail3("Item of instance '", name, "' could not be created");
            G1CP_Testsuite_FailTest();
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

/*
 * Check if NPC instance exists, create an NPC of that instance and return it. The NPC will be created at a non-existent
 * waypoint and made non-persistent, such that it will not be written to a savegame. This way, no clean up is necessary.
 */
func C_Npc G1CP_Testsuite_CreateNpc(var string name) {
    // Backup global symbol
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);

    var int symbId; symbId = G1CP_Testsuite_CheckNpc(name);
    if (symbId != -1) {
        // Create the NPC at a non-existing waypoint
        Wld_InsertNpc(symbId, "G1CP_NOWHERE");

        if (Hlp_GetInstanceId(self) != symbId) {
            G1CP_TestsuiteErrorDetail3("NPC of instance '", name, "' could not be created");
            G1CP_Testsuite_FailTest();
            MEM_NullToInst();
        } else {
            // Set the NPC to non-persistent
            var zCVob npc; npc = Hlp_GetNpc(self); // zCVob here
            npc.bitfield[4] = npc.bitfield[4] | zCVob_bitfield4_dontWriteIntoArchive;

            // Need to push an instance different from self
            MEMINT_StackPushInst(npc);
        };
    } else {
        MEM_NullToInst();
    };

    // Restore global symbol
    self = MEM_CpyInst(slfBak);
};

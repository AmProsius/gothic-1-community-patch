/*
 * #46 Door near the smithy in the castle of the Old Camp is inaccessible
 *
 * This fix replaces the required key instance of the door and adds a key to the game under the following circumstances:
 *  - The door is identified by its exact location
 *  - The door requires the expected (incorrect) key instance
 *  - There is no item of the incorrect key instance (possibly added by a mod to fix the problem the other way around)
 *  - The door is not already unlocked (because in that case the fix is not necessary)
 *  - The door's lock is not pickable (possibly added by a mod in part of a new quest)
 *  - The waypoint to insert the key at exists
 *  - The story is progressed far enough (Kapitel >= 4, specifically ExploreSunkenTower == TRUE)
 *
 * When reverting, the key instance of the door will be reset to the incorrect instance. However, the door will NOT be
 * locked again. The reasoning behind this is, that G1CP is only supplying a way of unlocking the door. It's the player
 * that may unlock it. G1CP will only revert its own actions, not the consequences.
 * G1CP supplies its own unique copy of the key. It will NOT be removed on reverting the fix, because the key item will
 * only remain in the game as long as its instance exists in the scripts. In other words, as soon as G1CP was to be
 * uninstalled, the key would automatically vanish from the game on loading.
 */
func int G1CP_046_SmithDoor() {
    // First find the symbol indices once
    const int keyIdOld = -2; // -1 is reserved for invalid symbols
    const int keyIdNew = -2;
    const int funcId   = -2;
    const int varId    = -2;
    const int varPtr   =  0;
    if (keyIdOld == -2) {
        keyIdOld = G1CP_GetItemInstId("ITKEY_OB_SMITH_01");
        keyIdNew = G1CP_GetItemInstId("ITKE_OB_SMITH_01");
        funcId = G1CP_GetFuncId("B_Story_ExploreSunkenTower", "void|none");
        varId = G1CP_GetIntVarId("ExploreSunkenTower", 0);
        varPtr = MEM_GetSymbol("ExploreSunkenTower") + zCParSymbol_content_offset;
    };

    // Abort immediately if the correct key does not even exist
    if (keyIdNew == -1) {
        return FALSE;
    };

    // Check if story variable exists (and symbol is valid too)
    if (varId == -1) || (varPtr == zCParSymbol_content_offset) {
        return FALSE;
    };

    // Find the door in the world
    var int vobPtr; vobPtr = G1CP_FindVobByPosF(3659.20801, 267.0802, 970.182068, Hlp_Is_oCMobDoor);
    if (!vobPtr) {
        return FALSE;
    };
    var oCMobDoor mob; mob = _^(vobPtr);

    // Make sure no lock picking string was added
    if (!Hlp_StrCmp(mob._oCMobLockable_pickLockStr, "")) {
        return FALSE;
    };

    // Check if the door is still locked (an unlocked door does not need this fix)
    if (!(mob._oCMobLockable_bitfield & oCMobLockable_bitfield_locked)) {
        return FALSE;
    };

    // Check if the door references the expected key instance
    if (!Hlp_StrCmp(mob._oCMobLockable_keyInstance, "ITKEY_OB_SMITH_01")) {
        return FALSE;
    };

    // Make sure the key instance does not exist (might have been added by the mod)
    if (keyIdOld != -1) {
        return FALSE;
    };

    // Check if target waypoint exists
    var int wpPtr; wpPtr = G1CP_GetWaypoint("OCC_CELLAR_BACK_LEFT_CELL");
    if (!wpPtr) {
        return FALSE;
    };
    var zCWaypoint wp; wp = _^(wpPtr);

    // All checks passed! Make the new key available and finally adjust the door property

    // Check if new key item already exists somewhere (if not, insert key first)
    if (!G1CP_IsItemInstantiated("G1CP_046_SmithDoor_Item")) {

        // Check if the story variable is true
        if (!MEM_ReadInt(varPtr)) { // It follows from above that varPtr is not zero
            // If the story did not progress that far yet, hook the function to apply this fix during the game
            if (funcId != -1) {

                // Check if somewhere in that function the story variable is set (check only once)
                const int funcHooked = 0;
                if (funcHooked == 0) {
                    funcHooked = TRUE;

                    // Find "ExploreSunkenTower = xxxx" within the function
                    const int bytes[3] = {zPAR_TOK_PUSHVAR<<24, -1, zPAR_OP_IS};
                    bytes[1] = varId;
                    var int matches; matches = G1CP_FindInFunc(funcId, _@(bytes)+3, 6);
                    var int funcGood; funcGood = (MEM_ArraySize(matches) > 0);
                    MEM_ArrayFree(matches);

                    // Hook the function only if it makes sense
                    if (funcGood == TRUE) {
                        HookDaedalusFuncI(funcId, MEM_GetFuncId(G1CP_046_SmithDoor_HookStory));
                    };
                };
            };
            return FALSE;
        };

        // Insert item
        Wld_InsertItem(G1CP_046_SmithDoor_Item, "OCC_CELLAR_BACK_LEFT_CELL");

        // Double check that it worked (probably not necessary)
        var zCTree latestNode; latestNode = _^(MEM_World.globalVobTree_firstChild);
        var int itmPtr; itmPtr = latestNode.data;
        if (!Hlp_Is_oCItem(itmPtr)) {
            return FALSE;
        };
        var oCItem itm; itm = _^(itmPtr);
        if (itm.instanz != G1CP_046_SmithDoor_Item) {
            return FALSE;
        };

        // Correct item inserted, but check if copying of the original item instance worked
        if (!itm._zCVob_visual) {
            Wld_RemoveItem(G1CP_046_SmithDoor_Item);
            return FALSE;
        };

        // Align the item to the ground (otherwise it would be floating mid-air)
        var int posPtr; posPtr = _@(wp.pos);
        const int oCVob__SetOnFloor = 7160768; //0x6D43C0
        const int call = 0;
        if (CALL_Begin(call)) {
            CALL_PtrParam(_@(posPtr));
            CALL__thiscall(_@(itmPtr), oCVob__SetOnFloor);
            call = CALL_End();
        };
    };

    // FINALLY: Replace the key instance
    mob._oCMobLockable_keyInstance = "G1CP_046_SMITHDOOR_ITEM";
    return TRUE;
};

/*
 * This function reverts the changes
 */
func int G1CP_046_SmithDoorRevert() {
    // Find the door in the world
    var int vobPtr; vobPtr = G1CP_FindVobByPosF(3659.20801, 267.0802, 970.182068, Hlp_Is_oCMobDoor);
    if (!vobPtr) {
        return FALSE;
    };
    var oCMobDoor mob; mob = _^(vobPtr);

    // Make sure no lock picking string was added
    if (!Hlp_StrCmp(mob._oCMobLockable_pickLockStr, "")) {
        return FALSE;
    };

    // Check if the door references the expected key instance
    if (!Hlp_StrCmp(mob._oCMobLockable_keyInstance, "G1CP_046_SmithDoor_Item")) {
        return FALSE;
    };

    // Replace the key instance with the original (incorrect) name
    mob._oCMobLockable_keyInstance = "ITKEY_OB_SMITH_01";
    return TRUE;
};

/*
 * Hook to apply the fix during the running game when the story progresses
 */
func void G1CP_046_SmithDoor_HookStory() {
    // Call original function
    ContinueCall();

    // Apply fix (call all to update the lookup table properly)
    MEM_Call(G1CP_GamesaveFixes_Apply);
};

/*
 * Unique copy of the item "ItKe_OB_Smith_01"
 */
instance G1CP_046_SmithDoor_Item(C_Item) {
    // This is very delicate now!

    // Backup the current instance
    var int i; i = MEM_GetUseInstance();

    // Find the original key instance
    var int symbPtr; symbPtr = MEM_GetSymbol("ItKe_OB_Smith_01");
    if (!symbPtr) {
        return; // No visual
    };

    // Find the start of the instance function of the original key
    var int origOffset; origOffset = MEM_ReadInt(symbPtr+zCParSymbol_content_offset);

    // Find the end of this instance function using "G1CP_046_SmithDoor_ItemHlp" for help
    var int hlpSymbPtr; hlpSymbPtr = MEM_GetSymbol("G1CP_046_SmithDoor_ItemHlp");
    var int endPos; endPos = MEM_ReadInt(hlpSymbPtr+zCParSymbol_content_offset) - 1; // zPAR_TOK_RET
    endPos -= 5; // Length of zPAR_TOK_JUMP + target

    // Overwrite the end of this instance function with a jump to the original key instance function
    MEMINT_OverrideFunc_Ptr = endPos + MEM_Parser.stack_stack;
    MEMINT_OFTokPar(zPAR_TOK_JUMP, origOffset);

    // Restore the current instance
    MEM_SetUseInstance(i);

    // These returns here will be overwritten with a 5 bytes jump to the original key instance
    return;
    return;
    return;
    return;
    return;
};
func void G1CP_046_SmithDoor_ItemHlp() {
    // This helper functions allows to identify the end of the instance function above
};

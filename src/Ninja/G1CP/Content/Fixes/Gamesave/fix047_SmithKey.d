/*
 * #47 Key to smithy doesn't spawn
 */
func int Ninja_G1CP_047_SmithKey() {
    // Find the symbol indices once
    const int keyId = -2; // -1 is reserved for invalid symbols
    if (keyId == -2) {
        keyId = MEM_FindParserSymbol("ItKe_OB_Smith_01");
    };
    const int funcId = -2; // -1 is reserved for invalid symbols
    if (funcId == -2) {
        funcId = MEM_FindParserSymbol("B_Story_ExploreSunkenTower");
    };
    const int varId = -2; // -1 is reserved for invalid symbols
    const int varPtr = 0;
    if (varId == -2) {
        varId = MEM_FindParserSymbol("ExploreSunkenTower");
        varPtr = MEM_GetSymbol("ExploreSunkenTower") + zCParSymbol_content_offset;
    };

    // Check if key instance exists
    if (keyId == -1) {
        return FALSE;
    };

    // Check if story variable exists
    if (varId == -1) {
        return FALSE;
    };

    /*// Find the door in the world
    var int vobPtr; vobPtr = Ninja_G1CP_046_SmithDoorFind(); // Borrowed from #46
    if (!vobPtr) {
        return FALSE;
    };
    var oCMobDoor mob; mob = _^(vobPtr);

    // Check if the door is still locked (an unlocked door does not need this fix)
    if (!(mob._oCMobLockable_bitfield | oCMobLockable_bitfield_locked)) {
        return FALSE;
    };

    // Check if the door references the expected key instance
    if (!Hlp_StrCmp(mob._oCMobLockable_keyInstance, "ItKe_OB_Smith_01")) {
        return FALSE;
    };*/

    // Check if target waypoint exists
    var int wpPtr; wpPtr = Ninja_G1CP_GetWaypoint("OCC_CELLAR_BACK_LEFT_CELL");
    if (!wpPtr) {
        return FALSE;
    };
    var zCWaypoint wp; wp = _^(wpPtr);

    // Check if item exists somewhere
    if (Ninja_G1CP_IsItemInstantiated("ItKe_OB_Smith_01")) {
        return FALSE;
    };

    // Check if the story variable is true
    if (!MEM_ReadInt(varPtr)) { // It follows from above that varPtr is not zero
        // If the story did not advance that far yet, hook the function to apply this fix during the game
        if (funcId != -1) {

            // Check if somewhere in that function the story variable is set to a non-zero value (check only once)
            const int funcGood = -1;
            if (funcGood == -1) {
                // Find "ExploreSunkenTower = xxxx" within the function
                const int bytes[3] = {zPAR_TOK_PUSHVAR<<24, -1, zPAR_OP_IS};
                bytes[1] = varId;
                var int matches; matches = Ninja_G1CP_FindInFunc(funcId, _@(bytes)+3, 6);
                funcGood = (MEM_ArraySize(matches) > 0);
                MEM_ArrayFree(matches);
            };

            // So far the above check makes no difference to the success state of the fix
            if (funcGood == TRUE) {
                HookDaedalusFuncI(funcId, MEM_GetFuncID(Ninja_G1CP_047_SmithKey_HookStory));
                // return TRUE; // Whether this makes sense is arguable, because the key is not yet inserted here
            };
        };
        return FALSE;
    };

    // Insert item
    Wld_InsertItem(keyId, "OCC_CELLAR_BACK_LEFT_CELL");

    // Double check that it worked (probably not necessary)
    var zCTree latestNode; latestNode = _^(MEM_World.globalVobTree_firstChild);
    var int itmPtr; itmPtr = latestNode.data;
    if (!Hlp_Is_oCItem(itmPtr)) {
        return FALSE;
    };
    var oCItem itm; itm = _^(itmPtr);
    if (itm.instanz != keyId) {
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

    // Done
    return TRUE;
};

func int Ninja_G1CP_047_SmithKeyRevert() {
    // Make sure the fix is applied
    if (!Ninja_G1CP_IsFixApplied(47)) {
        return FALSE;
    };

    // Check if key still physically exists in the world (i.e. not picked up)
    var int itmPtr; itmPtr = MEM_SearchVobByName("ITKE_OB_SMITH_01"); // Upper case!
    if (!itmPtr) {
        return FALSE;
    };

    // Check if key still lies near the waypoint it was inserted at
    if (!Hlp_StrCmp(Ninja_G1CP_GetNearestWP(itmPtr), "OCC_CELLAR_BACK_LEFT_CELL")) {
        return FALSE;
    };

    // Remove the item
    var C_Item itm; itm = _^(itmPtr);
    Wld_RemoveItem(itm);
    return TRUE;
};

func void Ninja_G1CP_047_SmithKey_HookStory() {
    // Call original function
    ContinueCall();

    // Apply fix (call all to update the lookup table properly)
    MEM_Call(Ninja_G1CP_GamesaveFixes_Apply);
};

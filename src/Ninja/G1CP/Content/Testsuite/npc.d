/*
 * Internal functions for instant teleport (for the testsuite functions)
 * Advantages:
 * - Destination may be anything from a waypoint to a VOB name/NPC instance name
 * - The teleport is instant
 * Note: Always run 'G1CP_Testsuite_CheckWorld' prior to ensure correct world.
 */
func void G1CP_Testsuite_NpcBeamTo(var C_Npc slf, var string destination) {
    if (Hlp_StrCmp(destination, "")) || (Hlp_StrCmp(destination, "START")) {
        destination = "START";
        // Edge case: Find the start point without name and use the nearest waypoint
        if (!MEM_SearchVobByName(destination)) {
            var int worldPtr; worldPtr = MEM_Game._zCSession_world;
            var int vobTreePtr; vobTreePtr = worldPtr + 36;
            if (CALL_Begin(call1)) {
                const int zCWorld__SearchVobListByBaseClass = 6250016; //0x5F5E20
                const int zCVobStartpoint__classDef = 9298624; //0x8DE2C0
                const int zCArray_zCVob___DeleteList = 4840976; //0x49DE10
                const int call1 = 0;
                const int arrPtr = 0;
                arrPtr = MEM_ArrayCreate(); // Memory preserved for session
                CALL__thiscall(_@(arrPtr), zCArray_zCVob___DeleteList);
                CALL_PtrParam(_@(vobTreePtr));
                CALL_PtrParam(_@(arrPtr));
                CALL_PtrParam(_@(zCVobStartpoint__classDef));
                CALL__thiscall(_@(worldPtr), zCWorld__SearchVobListByBaseClass);
                call1 = CALL_End();
            };
            if (MEM_ArraySize(arrPtr) > 0) {
                var int vobPtr; vobPtr = MEM_ArrayRead(arrPtr, 0);
                destination = G1CP_GetNearestWp(vobPtr);
            };
        };
    };
    var int slfPtr; slfPtr = _@(slf);
    const int oCNpc__BeamTo = 6896400; //0x693B10
    const int strPtr = 0;
    const int call = 0;
    if (CALL_Begin(call)) {
        strPtr = _@s(destination);
        CALL_PtrParam(_@(strPtr));
        CALL__thiscall(_@(slfPtr), oCNpc__BeamTo);
        call = CALL_End();
    };
};


/*
 * Instant teleport (for the testsuite functions) to an exact position (rotation not considered)
 * Note: Always run 'G1CP_Testsuite_CheckWorld' prior to ensure correct world.
 */
func void G1CP_Testsuite_NpcBeamToPosPtr(var C_Npc slf, var int posPtr) {
    if (!posPtr) {
        return;
    };

    // Abuse the nearest waypoint to give a chance for controlling the rotation
    var zCWaypoint wp; wp = _^(G1CP_GetWaypoint(G1CP_GetNearestWpPosPtr(posPtr)));
    if (!wp) {
        wp = _^(MEM_GetAnyWPPtr()); // Fallback to random waypoint.
    };
    var int posBak[3]; MEM_CopyWords(_@(wp.pos), _@(posBak), 3);

    MEM_CopyWords(posPtr, _@(wp.pos), 3);
    G1CP_Testsuite_NpcBeamTo(slf, wp.name);
    MEM_CopyWords(_@(posBak), _@(wp.pos), 3);
};
func void G1CP_Testsuite_NpcBeamToPos(var C_Npc slf, var int x, var int y, var int z) { // Integer-floats!
    var int pos[3];
    pos[0] = x;
    pos[1] = y;
    pos[2] = z;
    G1CP_Testsuite_NpcBeamToPosPtr(slf, _@(pos));
};
func void G1CP_Testsuite_NpcBeamToPosF(var C_Npc slf, var float x, var float y, var float z) {
    MEM_PushInstParam(slf);
    castToIntf(x); // Just to repush
    castToIntf(y);
    castToIntf(z);
    MEM_Call(G1CP_Testsuite_NpcBeamToPos);
};


/*
 * Instant teleport (for the testsuite functions) to the nearest waypoint from a position
 * Note: Always run 'G1CP_Testsuite_CheckWorld' prior to ensure correct world.
 */
func void G1CP_Testsuite_NpcBeamToNearestWpPosPtr(var C_Npc slf, var int posPtr) {
    var string wpName; wpName = G1CP_GetNearestWpPosPtr(posPtr);
    if (Hlp_StrCmp(wpName, "")) {
        G1CP_Testsuite_NpcBeamToPosPtr(slf, posPtr); // Fallback to position
    };
    G1CP_Testsuite_NpcBeamTo(slf, wpName);
};


/*
 * Set an item in the inventory of an NPC to an exact amount.
 */
func void G1CP_Testsuite_NpcSetInvItemAmount(var C_Npc slf, var int itemId, var int amount) {
    var int r; // Dump return values to keep the data stack clean
    r = Npc_RemoveInvItems(slf, itemId, Npc_HasItems(slf, itemId)); // Remove all
    if (amount > 0) {
        CreateInvItems(slf, itemId, amount); // Add the required amount
    };
};

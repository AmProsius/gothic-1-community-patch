/*
 * Instant teleport (for the testsuite functions)
 * Advantages:
 * - Destination may be anything from a waypoint to a VOB name/NPC instance name
 * - The teleport is instant
 */
func void G1CP_Testsuite_NpcBeamTo(var C_Npc slf, var string destination) {
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
 */
func void G1CP_Testsuite_NpcBeamToPosPtr(var C_Npc slf, var int posPtr) {
    if (!posPtr) {
        return;
    };

    // Abuse a random waypoint
    var zCWaypoint wp; wp = _^(MEM_GetAnyWPPtr());
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
 */
func void G1CP_Testsuite_NpcBeamToNearestWpPosPtr(var C_Npc slf, var int posPtr) {
    var string wpName; wpName = G1CP_GetNearestWpPosPtr(posPtr);
    if (Hlp_StrCmp(wpName, "")) {
        G1CP_Testsuite_NpcBeamToPosPtr(slf, posPtr); // Fallback to position
    };
    G1CP_Testsuite_NpcBeamTo(slf, wpName);
};


/*
 * Teleport the player to a waypoint that is presumably in another level
 */
func void G1CP_Testsuite_NpcTeleportToWorld(var C_Npc slf, var string world, var string waypoint) {
    if (!Hlp_StrCmp(MEM_World.worldFilename, world)) {
        const int oCGame__TriggerChangeLevel = 6542464; //0x63D480
        CALL_zStringPtrParam(waypoint);
        CALL_zStringPtrParam(world);
        CALL__thiscall(_@(MEM_Game), oCGame__TriggerChangeLevel);
    } else {
        AI_Teleport(slf, waypoint);
    };
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

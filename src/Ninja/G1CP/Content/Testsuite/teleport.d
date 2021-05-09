/*
 * Instant teleport (for the testsuite functions)
 * Advantages:
 * - Destination may be anything from a waypoint to a VOB name/NPC instance name
 * - The teleport is instant
 */
func void G1CP_NpcBeamTo(var C_Npc slf, var string destination) {
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
func void G1CP_NpcBeamToPosF(var C_Npc slf, var float x, var float y, var float z) {
    // Abuse a random waypoint
    var zCWaypoint wp; wp = _^(MEM_GetAnyWPPtr());
    var int posBak[3];
    posBak[0] = wp.pos[0];
    posBak[1] = wp.pos[1];
    posBak[2] = wp.pos[2];

    wp.pos[0] = castToIntf(x);
    wp.pos[1] = castToIntf(y);
    wp.pos[2] = castToIntf(z);
    G1CP_NpcBeamTo(slf, wp.name);

    wp.pos[0] = posBak[0];
    wp.pos[1] = posBak[1];
    wp.pos[2] = posBak[2];
};

/*
 * Teleport the player to a waypoint that may be in another level
 */
func void G1CP_TeleportToWorld(var string world, var string waypoint) {
    if (!Hlp_StrCmp(MEM_World.worldFilename, world)) {
        const int oCGame__TriggerChangeLevel = 6542464; //0x63D480
        CALL_zStringPtrParam(waypoint);
        CALL_zStringPtrParam(world);
        CALL__thiscall(_@(MEM_Game), oCGame__TriggerChangeLevel);
    } else {
        AI_Teleport(hero, waypoint);
    };
};

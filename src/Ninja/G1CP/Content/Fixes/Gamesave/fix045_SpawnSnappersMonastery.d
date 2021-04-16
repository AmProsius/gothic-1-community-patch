/*
 * #45 Snappers don't spawn outside the Monastery ruins
 */

/*
 * Remember the snappers (until loading)
 */
instance G1CP_045_SpawnSnappersMonastery_Snapper1 (C_Npc);
instance G1CP_045_SpawnSnappersMonastery_Snapper2 (C_Npc);


/*
 * One-time checks
 */
func int G1CP_045_SpawnSnappersMonastery_InitSession() {
    // Get necessary symbols
    var int funcId; funcId = G1CP_GetFuncID("Startup_Sub_Surface", "void|none");
    var int instId; instId = G1CP_GetNpcInstId("Snapper");
    if (funcId == -1) || (instId == -1) {
        return FALSE;
    };

    // Find all pushed snapper instances in "Startup_Sub_Surface"
    var int bytes[2];
    MEMINT_OverrideFunc_Ptr = _@(bytes);
    MEMINT_OFTokPar(zPAR_TOK_PUSHINT, instId);
    MEMINT_OFTok(zPAR_TOK_PUSHVAR);
    var int matches; matches = G1CP_FindInCode(funcId, 0, _@(bytes), 6, 0);

    // Verify context: Wld_InsertNpc(Snapper, "OW_MONSTER_NAVIGATE02")
    var int insertId; insertId = MEM_GetFuncID(Wld_InsertNpc);
    var int i; i = 0;
    var int wasFixed; wasFixed = FALSE;
    while(i < MEM_ArraySize(matches));
        var int pos; pos = MEM_ArrayRead(matches, i);
        if (MEM_ReadByte(pos+10) == zPAR_TOK_CALLEXTERN) && (MEM_ReadInt(pos+11) == insertId) {
            var string wp; wp = G1CP_GetStringI(MEM_ReadInt(pos+6), 0, "");
            if (Hlp_StrCmp(wp, "OW_MONSTER_NAVIGATE02")) {
                // Found a lost snapper
                i += 1;
                continue;
            } else if (Hlp_StrCmp(wp, "OW_MONSTER_NAVIGATE_02")) {
                // Someone adds a snapper at the correct way point
                wasFixed = TRUE;
                break;
            };
        };
        MEM_ArrayRemoveIndex(matches, i);
    end;

    // Check if exactly two lost snapper-insertions were found
    var int proceed; proceed = (!wasFixed) && (MEM_ArraySize(matches) == 2);

    // Free the array
    MEM_ArrayFree(matches);

    // Success
    return proceed;
};


/*
 * Apply the changes
 */
func int G1CP_045_SpawnSnappersMonastery() {
    // Do one-time checks
    const int fixNecessary = -1;
    if (fixNecessary == -1) {
        fixNecessary = G1CP_045_SpawnSnappersMonastery_InitSession();
    };

    // No need to do anything, issue is mostly likely already fixed
    if (!fixNecessary) {
        return FALSE;
    };

    // The incorrect waypoint seems to have been created to fix the issue
    if (G1CP_GetWaypoint("OW_MONSTER_NAVIGATE02")) {
        return FALSE;
    };

    // Confirm the correct world by checking the waypoint
    if (!G1CP_GetWaypoint("OW_MONSTER_NAVIGATE_02")) {
        return FALSE;
    };

    // Proceed with the fix
    var int snapper1; snapper1 = 0;
    var int snapper2; snapper2 = 0;

    // Iterate over all snappers in the world lists and get the lost ones
    var int arrPtr; arrPtr = MEM_SearchAllVobsByName("SNAPPER");
    repeat(i, MEM_ArraySize(arrPtr)); var int i;
        var int npcPtr; npcPtr = MEM_ArrayRead(arrPtr, i);
        if (Hlp_Is_oCNpc(npcPtr)) {
            var oCNpc npc; npc = _^(npcPtr);

            // Identify snappers by no spawn point information
            if (npc.state_aiStatePosition[0] == 0) { // Separate blocks for performance
            if (npc.state_aiStatePosition[1] == 0) {
            if (npc.state_aiStatePosition[2] == 0) {
            if (Hlp_StrCmp(npc.wpname, "")) {

                // Double-check if in Spawn manager
                var C_Npc slf; slf = MEM_CpyInst(npc);
                if (G1CP_NpcIsInSpawnMan(slf)) {
                    continue;
                };

                // Only accept two lost snappers, otherwise this fix becomes too complicated
                if (snapper2) {
                    snapper2 = 0; // Reset
                    break;
                } else if (snapper1) {
                    snapper2 = npcPtr;
                } else {
                    snapper1 = npcPtr;
                };
            }; }; }; };
        };
    end;
    MEM_ArrayFree(arrPtr);

    // Only do something, if exactly two lost snappers were found
    if (snapper1) && (snapper2) {

        // Add both to the spawn manager. Equivalent to: Wld_InsertNpc, but with pre-existing NPCs
        const int oCSpawnManager__SpawnNpc = 7144640; //0x6D04C0
        const int spawnManPtr = 0;
        const int strPtr = 0;
        const int call = 0;
        if (CALL_Begin(call)) {
            spawnManPtr = MEM_Game.spawnman;
            strPtr = _@s("OW_MONSTER_NAVIGATE_02");
            CALL_PtrParam(_@(FLOATNULL));
            CALL_PtrParam(_@(strPtr));
            CALL_PtrParam(_@(snapper1));
            CALL__thiscall(_@(spawnManPtr), oCSpawnManager__SpawnNpc);
            CALL_PtrParam(_@(FLOATNULL));
            CALL_PtrParam(_@(strPtr));
            CALL_PtrParam(_@(snapper2));
            CALL__thiscall(_@(spawnManPtr), oCSpawnManager__SpawnNpc);
            call = CALL_End();
        };

        // Remember for reverting (will never be reset, see below)
        G1CP_045_SpawnSnappersMonastery_Snapper1 = _^(snapper1);
        G1CP_045_SpawnSnappersMonastery_Snapper2 = _^(snapper2);
        return TRUE;
    } else {
        return FALSE;
    };
};


/*
 * Remove an NPC from the spawn manager
 */
func int G1CP_045_SpawnSnappersMonasteryRemoveSpawn(var C_Npc slf) {
    // Check if in spawn list
    var int nodePtr; nodePtr = G1CP_NpcGetSpawnNode(slf);
    if (nodePtr) {

        // Remove from spawn manager and disable NPC
        const int oCSpawnManager__RemoveFromList = 7141232; //0x6CF770
        const int spawnManPtr = 0;
        const int call = 0;
        if (CALL_Begin(call)) {
            spawnManPtr = MEM_Game.spawnman;
            CALL_PtrParam(_@(nodePtr));
            CALL__thiscall(_@(spawnManPtr), oCSpawnManager__RemoveFromList);
            call = CALL_End();
        };

        // Reset spawn position
        var oCNpc npc; npc = Hlp_GetNpc(slf);
        npc.state_aiStatePosition[0] = FLOATNULL;
        npc.state_aiStatePosition[1] = FLOATNULL;
        npc.state_aiStatePosition[2] = FLOATNULL;
        npc.wpname = "";
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * Revert the changes
 */
func int G1CP_045_SpawnSnappersMonasteryRevert() {
    // Remove snappers from the spawn manager
    var int count; count = 0;
    count += G1CP_045_SpawnSnappersMonasteryRemoveSpawn(G1CP_045_SpawnSnappersMonastery_Snapper1);
    count += G1CP_045_SpawnSnappersMonasteryRemoveSpawn(G1CP_045_SpawnSnappersMonastery_Snapper2);

    /* If reverting failed (because the snappers are currently spawned), keep the NPC instance variables intact. This
    allows to try again on next revert. However, if the game is closed before saving again, the snappers will remain
    in the savegame and are part of the game from that point on. */

    // Return if removed both
    return (count == 2);
};

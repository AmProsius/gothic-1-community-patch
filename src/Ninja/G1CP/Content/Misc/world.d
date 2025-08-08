/*
 * Check if an item exists anywhere
 */
func int G1CP_IsItemInstantiated(var string name) {
    // MEM_SearchVobByName need upper case
    name = STR_Upper(name);

    // Check if physically in world (fast hash table search)
    if (MEM_SearchVobByName(name)) {
        return TRUE;
    };

    // Get instance ID
    var int id; id = MEM_GetSymbolIndex(name);

    // Check if in inventory or container
    var int found; found = FALSE;
    var int list; list = MEM_World.voblist;
    var zCListSort l;
    while((list) && (!found));
        l = _^(list);
        if (Hlp_Is_oCNpc(l.data)) {
            var C_NPC npc; npc = _^(l.data);
            found = Npc_HasItems(npc, id);
        } else if (Hlp_Is_oCMobContainer(l.data)) {
            var int vobPtr; vobPtr = l.data;
            const int oCMobContainer__IsIn = 6833040; //0x684390
            const int call = 0;
            if (CALL_Begin(call)) {
                CALL_PtrParam(_@(id));
                CALL_PutRetValTo(_@(found));
                CALL__thiscall(_@(vobPtr), oCMobContainer__IsIn);
                call = CALL_End();
            };
        };
        list = l.next;
    end;
    return found;
};

/*
 * Find VOB in the world by its exact position (and optionally a callback to narrow down the search). The callback, if
 * provided (i.e. specify NOFUNC to ignore), is a function with the signature
 *   func int callback(var int vobPtr)
 * and will be called for each prospective VOB candidate to return TRUE or FALSE.
 */
func int G1CP_FindVobByPosPtr(var int posPtr, var func callback) {
    MEM_InitGlobalInst();

    if (!posPtr) {
        return FALSE;
    };

    var int bspRoot; bspRoot = MEM_World.bspTree_bspRoot;
    var int arrPtr; arrPtr = MEM_ArrayCreate();
    var int bboxPtr; bboxPtr = _@(bbox);
    var int bbox[6]; MEM_CopyWords(posPtr, bboxPtr, 3); MEM_CopyWords(posPtr, bboxPtr+12, 3);
    var int pos[3]; MEM_CopyWords(posPtr, _@(pos), 3);

    // Find all VOBs that intersect that point with their bounding box
    const int zCBspBase__CollectVobsInBBox3D = 5367744; //0x51E7C0
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(bboxPtr));
        CALL__fastcall(_@(bspRoot), _@(arrPtr), zCBspBase__CollectVobsInBBox3D);
        call = CALL_End();
    };

    // Narrow down the found VOBs to the exact position
    var int found; found = 0;
    repeat(i, MEM_ArraySize(arrPtr)); var int i;
        var int vobPtr; vobPtr = MEM_ArrayRead(arrPtr, i);
        if (vobPtr) {
            var zCVob vob; vob = _^(vobPtr);
            if (vob.trafoObjToWorld[3]  == pos[0]) { // Separate if-statements for performance
            if (vob.trafoObjToWorld[7]  == pos[1]) {
            if (vob.trafoObjToWorld[11] == pos[2]) {
                MEM_PushIntParam(vobPtr);
                if (G1CP_IsValidFunc(callback)) {
                    MEM_Call(callback);
                };
                if (MEM_PopIntResult()) {
                    found = vobPtr;
                    break; // Find only first match
                };
            }; }; };
        };
    end;

    // Free array
    MEM_ArrayFree(arrPtr);

    // Return pointer of possibly found VOB or zero
    return +found;
};
func int G1CP_FindVobByPos(var int x, var int y, var int z, var func callback) { // Integer-floats!
    var int pos[3];
    pos[0] = x;
    pos[1] = y;
    pos[2] = z;
    G1CP_FindVobByPosPtr(_@(pos), callback); // Leave return value on stack
};
func int G1CP_FindVobByPosF(var float x, var float y, var float z, var func callback) {
    castToIntf(x); // Just to repush
    castToIntf(y);
    castToIntf(z);
    if (G1CP_IsValidFunc(callback)) {
        MEM_PushIntParam(MEM_GetFuncId(callback));
    } else {
        MEM_PushIntParam(-1);
    };
    MEM_Call(G1CP_FindVobByPos); // Leave return value on stack
};

/*
 * Find light VOB in the world by its exact position (and optionally a callback to narrow down the search). See above
 * for details.
 */
func int G1CP_FindLightVobByPosPtr(var int posPtr, var func callback) {
    // Prepare some temporary changes to the engine function
    const int zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr1 = 5368964; //0x51EC84
    const int zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr2 = 5368994; //0x51ECA2
    const int zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr3 = 5369000; //0x51ECA8
    const int zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr4 = 5369360; //0x51EE10
    const int once = 0;
    if (!once) {
        MemoryProtectionOverride(zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr1, 1);
        MemoryProtectionOverride(zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr2, 1);
        MemoryProtectionOverride(zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr3, 1);
        MemoryProtectionOverride(zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr4, 1);
        once = 1;
    };

    // Check for expected bytes
    if (MEM_ReadByte(zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr1) != 52)
    || (MEM_ReadByte(zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr2) != 44)
    || (MEM_ReadByte(zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr3) != 44)
    || (MEM_ReadByte(zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr4) != 52) {
        MEM_Warn("Failed to modify zCBspBase::CollectVobsInBBox3D_I!");
        return FALSE;
    };

    // Collect light VOBs only instead of instead ignoring them
    MEM_WriteByte(zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr1, 64);
    MEM_WriteByte(zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr2, 56);
    MEM_WriteByte(zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr3, 56);
    MEM_WriteByte(zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr4, 64);

    // Call the function
    var int ret; ret = G1CP_FindVobByPosPtr(posPtr, callback);

    // Reset changes to default
    MEM_WriteByte(zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr1, 52);
    MEM_WriteByte(zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr2, 44);
    MEM_WriteByte(zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr3, 44);
    MEM_WriteByte(zCBspBase__CollectVobsInBBox3D_I_leafVobList_addr4, 52);

    return +ret;
};
func int G1CP_FindLightVobByPos(var int x, var int y, var int z, var func callback) { // Integer-floats!
    var int pos[3];
    pos[0] = x;
    pos[1] = y;
    pos[2] = z;
    G1CP_FindLightVobByPosPtr(_@(pos), callback); // Leave return value on stack
};
func int G1CP_FindLightVobByPosF(var float x, var float y, var float z, var func callback) {
    castToIntf(x); // Just to repush
    castToIntf(y);
    castToIntf(z);
    if (G1CP_IsValidFunc(callback)) {
        MEM_PushIntParam(MEM_GetFuncId(callback));
    } else {
        MEM_PushIntParam(-1);
    };
    MEM_Call(G1CP_FindLightVobByPos); // Leave return value on stack
};

/*
 * Move VOB to position coordinates
 */
func void G1CP_MoveVobToPosPtr(var int vobPtr, var int posPtr) {
    if (!vobPtr) || (!posPtr) {
        return;
    };

    // Backup and lift collision
    var zCVob v; v = _^(vobPtr);
    var int bits; bits = v.bitfield[0];
    v.bitfield[0] = v.bitfield[0] & ~(zCVob_bitfield0_collDetectionStatic | zCVob_bitfield0_collDetectionDynamic);

    // Move the VOB
    const int zCVob__SetPositionWorld = 6219344; //0x5EE650
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(posPtr));
        CALL__thiscall(_@(vobPtr), zCVob__SetPositionWorld);
        call = CALL_End();
    };

    // Restore collision
    v.bitfield[0] = bits;
};
func void G1CP_MoveVobToPos(var int vobPtr, var int x, var int y, var int z) { // Integer-floats!
    var int pos[3];
    pos[0] = x;
    pos[1] = y;
    pos[2] = z;
    G1CP_MoveVobToPosPtr(vobPtr, _@(pos));
};
func void G1CP_MoveVobToPosF(var int vobPtr, var float x, var float y, var float z) {
    MEM_PushIntParam(vobPtr);
    castToIntf(x); // Just to repush
    castToIntf(y);
    castToIntf(z);
    MEM_Call(G1CP_MoveVobToPos);
};

/*
 * Move/translate/rotate VOB by transformation matrix
 */
func void G1CP_TransformVob(var int vobPtr, var int trafoPtr) {
    if (!vobPtr) || (!trafoPtr) {
        return;
    };

    // Backup and lift collision
    var zCVob v; v = _^(vobPtr);
    var int bits; bits = v.bitfield[0];
    v.bitfield[0] = v.bitfield[0] & ~(zCVob_bitfield0_collDetectionStatic | zCVob_bitfield0_collDetectionDynamic);

    // Move the VOB
    const int zCVob__SetTrafoObjToWorld = 6219616; //0x5EE760
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(trafoPtr));
        CALL__thiscall(_@(vobPtr), zCVob__SetTrafoObjToWorld);
        call = CALL_End();
    };

    // Restore collision
    v.bitfield[0] = bits;
};

/*
 * Get the world time analogous to Wld_SetTime, returned as an integer of the format HHMM where
 * Hours   = G1CP_GetWorldTime() / 60
 * Minutes = G1CP_GetWorldTime() % 60
 * Caution: Only accurate within the nearest few minutes!
 */
func int G1CP_GetWorldTime() {
    MEM_InitGlobalInst();

    var int hour; hour = truncf(divf(MEM_WorldTimer.worldTime, mkf(oCWorldTimer_TicksPerHour)));
    var int minI; minI = subf(MEM_WorldTimer.worldTime, mkf(hour * oCWorldTimer_TicksPerHour));
    var int min; min = truncf(divf(minI, mkf(oCWorldTimer_TicksPerMin_approx)));

    return hour * 100 + min;
};

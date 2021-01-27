/*
 * #53 Ladder in Old Mine too short
 */

/* Old positions of the ladders (Integerfloats for precision) */
const int Ninja_G1CP_053_OldMineLadders_L1PosOld[16] = {
    1056645348, 1039739221,  1063053323, -996629510,
    1036063365, 1064967154, -1102844970, -975445247,
   -1084372949, 1043555876,  1055881796, -981167673,
             0,          0,           0, 1065353216
};
const int Ninja_G1CP_053_OldMineLadders_L2PosOld[16] = {
    1054446790, 1042272444,  1063535493, -996953302,
    1023915813, 1065045910, -1103093957, -975519819,
   -1083730910, 1038076817,  1054012091, -981016188,
             0,          0,           0, 1065353216
};
/* New positions of the ladders */
const int Ninja_G1CP_053_OldMineLadders_L1PosNew[16] = {
    1056177182, -2147483648, 1063325801,  -996629510,
             0,  1065353216,          0,  -975445247,
   -1084157847, -2147483648, 1056177182,  -981167673,
             0,           0,          0,  1065353216
};
const int Ninja_G1CP_053_OldMineLadders_L2PosNew[16] = {
    1054262023, -2147483648, 1063805944,  -996953302,
             0,  1065353216,          0,  -975519819,
   -1083677704, -2147483648, 1054262023,  -981016188,
             0,           0,          0,  1065353216
};
/* Position of the new plank connecting the ladders to the cliff */
const float Ninja_G1CP_053_OldMineLadders_PlkPos[16] = {
    0.419457, 0.000000, 0.907775, -1000.000000,
    0.000000, 1.000000, 0.000000, -6625.000000,
   -0.907775, 0.000000, 0.419457, -4300.000000,
    0.000000, 0.000000, 0.000000,     1.000000
};

/*
 * This function applies the changes of #53
 */
func void Ninja_G1CP_053_OldMineLadders() {
    // Expected properties
    const string waypoint = "OM_185";
    const string mobName = "LADDER_4";
    const string visName = "LADDER_3.ASC";
    const float distToWp = 300.0;
    // New properties
    const string visNew = "LADDER_4.ASC";
    const string name1 = "NINJA_G1CP_053_LADDER1";
    const string name2 = "NINJA_G1CP_053_LADDER2";
    // New plank vob
    const string plkVis = "Min_Lob_Planks_2x3m.3DS";
    const string plkName = "NINJA_G1CP_053_PLANK";

    // First, check if the closest waypoint exists (correct world)
    var int wpPtr; wpPtr = Ninja_G1CP_GetWaypointByName(waypoint);
    if (!wpPtr) {
        return;
    };

    // Check if already applied
    if (MEM_SearchVobByName(plkName)) {
        return;
    };

    // Find all vobs of matching name
    var int arrPtr; arrPtr = MEM_SearchAllVobsByName(mobName);

    // Narrow down the search
    var int found; found = 0;
    repeat(i, MEM_ArraySize(arrPtr)); var int i;
        var int vobPtr; vobPtr = MEM_ArrayRead(arrPtr, i);

        // Check if vob is a ladder
        if (!Hlp_Is_oCMobLadder(vobPtr)) {
            continue;
        };

        // Check if it is in certain range of the way point
        var int dist; dist = Ninja_G1CP_GetDistToWp(vobPtr, wpPtr);
        if (dist > castToIntf(distToWp)) {
            continue;
        };

        // Make sure it has a visual
        var zCVob ladder; ladder = _^(vobPtr);
        if (!ladder.visual) {
            continue;
        };

        // Confirm visual name (non-recyclable call)
        var int vtbl; vtbl = MEM_ReadInt(ladder.visual);
        var int GetVisualName; GetVisualName = MEM_ReadInt(vtbl+32);
        CALL_RetValIszString();
        CALL__thiscall(ladder.visual, GetVisualName);
        if (!Hlp_StrCmp(CALL_RetValAszString(), visName)) {
            continue;
        };

        // Confirm exact position and update it
        if (MEM_CompareWords(vobPtr+60, _@(Ninja_G1CP_053_OldMineLadders_L1PosOld), 16)) {
            MEM_RenameVob(vobPtr, name1);
            MEM_CopyWords(_@(Ninja_G1CP_053_OldMineLadders_L1PosNew), vobPtr+60, 16);
        } else if (MEM_CompareWords(vobPtr+60, _@(Ninja_G1CP_053_OldMineLadders_L2PosOld), 16)) {
            MEM_RenameVob(vobPtr, name2);
            MEM_CopyWords(_@(Ninja_G1CP_053_OldMineLadders_L2PosNew), vobPtr+60, 16);
        } else {
            continue;
        };

        // Set the new visual
        const int zCVob__SetVisual = 6123424; //0x5D6FA0
        const int call = 0;
        const int visNamePtr = 0;
        if (CALL_Begin(call)) {
            visNamePtr = _@s(visNew);
            CALL_PtrParam(_@(visNamePtr));
            CALL__thiscall(_@(vobPtr), zCVob__SetVisual);
            call = CALL_End();
        };

        found += 1;
    end;
    MEM_ArrayFree(arrPtr);

    // Check if at least one ladder was found
    if (!found) {
        return;
    };

    // Add the plank on the upper end
    var int plankPtr; plankPtr = MEM_InsertVob(plkVis, waypoint);
    MEM_RenameVob(plankPtr, plkName);
    var zCVob plank; plank = _^(plankPtr);

    // Remove collision
    var int bits; bits = plank.bitfield[0];
    plank.bitfield[0] = (plank.bitfield[0] & ~zCVob_bitfield0_collDetectionStatic
                                           & ~zCVob_bitfield0_collDetectionDynamic);

    const int zCVob__SetTrafoObjToWorld = 6219616; //0x5EE760
    const int trfPtr = 0;
    const int call2 = 0;
    if (CALL_Begin(call2)) {
        trfPtr = _@f(Ninja_G1CP_053_OldMineLadders_PlkPos);
        CALL_PtrParam(_@(trfPtr));
        CALL__thiscall(_@(plankPtr), zCVob__SetTrafoObjToWorld);
        call2 = CALL_End();
    };

    // Reset collision
    plank.bitfield[0] = bits;
};


/*
 * This function reverts the changes of #53
 */
func void Ninja_G1CP_053_OldMineLadders_Revert() {
    const string name1 = "NINJA_G1CP_053_LADDER1";
    const string name2 = "NINJA_G1CP_053_LADDER2";
    const string plkName = "NINJA_G1CP_053_PLANK";
    const string mobName = "LADDER_4";
    const string visName = "LADDER_3.ASC";

    // Remove plank (may be zero)
    MEM_DeleteVob(MEM_SearchVobByName(plkName));

    // Create call first time
    const int zCVob__SetVisual = 6123424; //0x5D6FA0
    const int call = 0;
    const int visNamePtr = 0;
    if (!call) {
        CALL_Open();
        visNamePtr = _@s(visName);
        CALL_PtrParam(_@(visNamePtr));
        CALL__thiscall(_@(vobPtr), zCVob__SetVisual);
        call = CALL_Close();
    };

    // Revert the changes to the ladders if applicable
    var int vobPtr;
    vobPtr = MEM_SearchVobByName(name1);
    if (vobPtr) {
        MEM_RenameVob(vobPtr, mobName);
        MEM_CopyWords(_@(Ninja_G1CP_053_OldMineLadders_L1PosOld), vobPtr+60, 16);
        ASM_Run(call);
    };
    vobPtr = MEM_SearchVobByName(name2);
    if (vobPtr) {
        MEM_RenameVob(vobPtr, mobName);
        MEM_CopyWords(_@(Ninja_G1CP_053_OldMineLadders_L2PosOld), vobPtr+60, 16);
        ASM_Run(call);
    };
};

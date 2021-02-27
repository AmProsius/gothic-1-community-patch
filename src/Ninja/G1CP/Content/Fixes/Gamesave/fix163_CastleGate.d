/*
 * #163 Castle gate of the Old Camp cannot close
 */

/* Old position of the winch */
const int Ninja_G1CP_163_CastleGate_WinchPosOld[3] = {
    -985984063, 1144577608, 1154041161
};
/* New position of the winch */
const int Ninja_G1CP_163_CastleGate_WinchPosNew[3] = {
    -985455819, 1144577608, 1156341419
    // As float: -3122.20044, 739.473145, 1890.95837
};

/*
 * This function applies the changes of #163
 */
func int Ninja_G1CP_163_CastleGate() {
    // Move the winch as it blocks the gate
    var int vobPtr; vobPtr = MEM_SearchVobByName("EVT_OC_INNERMAINGATE_SWITCH");
    if (Hlp_Is_oCMobInter(vobPtr)) {
        var zCVob v; v = _^(vobPtr);

        // Verify position
        if (v.trafoObjToWorld[ 3] == Ninja_G1CP_163_CastleGate_WinchPosOld[0])
        && (v.trafoObjToWorld[ 7] == Ninja_G1CP_163_CastleGate_WinchPosOld[1])
        && (v.trafoObjToWorld[11] == Ninja_G1CP_163_CastleGate_WinchPosOld[2]) {

            // Update position
            var int bits; bits = v.bitfield[0];
            v.bitfield[0] = v.bitfield[0] & ~(zCVob_bitfield0_collDetectionStatic|zCVob_bitfield0_collDetectionDynamic);
            const int zCVob__SetPositionWorld = 6219344; //0x5EE650
            const int call = 0;
            if (CALL_Begin(call)) {
                const int ptr = 0;
                ptr = _@(Ninja_G1CP_163_CastleGate_WinchPosNew);
                CALL_PtrParam(_@(ptr));
                CALL__thiscall(_@(vobPtr), zCVob__SetPositionWorld);
                call = CALL_End();
            };
            v.bitfield[0] = bits;

            // // Alternatively remove dynamic collision
            // v.bitfield[0] = v.bitfield[0] & ~zCVob_bitfield0_collDetectionDynamic

            return TRUE;
        };
    };

    return FALSE;
};

/*
 * This function reverts the changes of #163
 */
func int Ninja_G1CP_163_CastleGateRevert() {
    var int vobPtr; vobPtr = MEM_SearchVobByName("EVT_OC_INNERMAINGATE_SWITCH");
    if (Hlp_Is_oCMobInter(vobPtr)) {
        var zCVob v; v = _^(vobPtr);

        // Verify position
        if (Ninja_G1CP_IsFixApplied(163)) // Safety check in case the mod did the same thing
        && (v.trafoObjToWorld[ 3] == Ninja_G1CP_163_CastleGate_WinchPosNew[0])
        && (v.trafoObjToWorld[ 7] == Ninja_G1CP_163_CastleGate_WinchPosNew[1])
        && (v.trafoObjToWorld[11] == Ninja_G1CP_163_CastleGate_WinchPosNew[2]) {

            // Update position
            var int bits; bits = v.bitfield[0];
            v.bitfield[0] = v.bitfield[0] & ~(zCVob_bitfield0_collDetectionStatic|zCVob_bitfield0_collDetectionDynamic);
            const int zCVob__SetPositionWorld = 6219344; //0x5EE650
            const int call = 0;
            if (CALL_Begin(call)) {
                const int ptr = 0;
                ptr = _@(Ninja_G1CP_163_CastleGate_WinchPosOld);
                CALL_PtrParam(_@(ptr));
                CALL__thiscall(_@(vobPtr), zCVob__SetPositionWorld);
                call = CALL_End();
            };
            v.bitfield[0] = bits;

            // // Alternatively revert dynamic collision
            // v.bitfield[0] = v.bitfield[0] | zCVob_bitfield0_collDetectionDynamic

            return TRUE;
        };
    };

    return FALSE;
};

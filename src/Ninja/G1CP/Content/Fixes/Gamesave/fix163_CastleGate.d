/*
 * #163 Castle gate of the Old Camp cannot close
 */

/* Position of the gate */
const int Ninja_G1CP_163_CastleGate_GatePos[3] = {
    -986222562, 1108197423, 1153254665
};
/* Position of the winch */
const int Ninja_G1CP_163_CastleGate_WinchPos[3] = {
    -985984063, 1144577608, 1154041161
};

/*
 * This function applies the changes of #163
 */
func int Ninja_G1CP_163_CastleGate() {
    // Identify the gate
    var int movPtr; movPtr = MEM_SearchVobByName("EVT_OC_INNERMAINGATE");
    if (Hlp_Is_zCMover(movPtr)) {
        var zCMover mov; mov = _^(movPtr);
        if (mov._zCVob_trafoObjToWorld[ 3] == Ninja_G1CP_163_CastleGate_GatePos[0])
        && (mov._zCVob_trafoObjToWorld[ 7] == Ninja_G1CP_163_CastleGate_GatePos[1])
        && (mov._zCVob_trafoObjToWorld[11] == Ninja_G1CP_163_CastleGate_GatePos[2])
        && (!(mov.bitfield & zCMover_bitfield_autoLinkEnabled)) {

            // Now identify the winch
            var int vobPtr; vobPtr = MEM_SearchVobByName("EVT_OC_INNERMAINGATE_SWITCH");
            if (Hlp_Is_oCMobInter(vobPtr)) {
                var oCMobInter mob; mob = _^(vobPtr);
                if (mob._zCVob_trafoObjToWorld[ 3] == Ninja_G1CP_163_CastleGate_WinchPos[0])
                && (mob._zCVob_trafoObjToWorld[ 7] == Ninja_G1CP_163_CastleGate_WinchPos[1])
                && (mob._zCVob_trafoObjToWorld[11] == Ninja_G1CP_163_CastleGate_WinchPos[2])
                && (mob._zCVob_bitfield[0] & zCVob_bitfield0_collDetectionDynamic)
                && (mob._zCVob_bitfield[0] & zCVob_bitfield0_staticVob)
                && (Hlp_StrCmp(mob.triggerTarget, "EVT_OC_INNERMAINGATE")) {

                    // Everything as expected: Remove collision from the winch by abusing the autolinking property
                    mov.bitfield = mov.bitfield | zCMover_bitfield_autoLinkEnabled;
                    return TRUE;
                };
            };
        };
    };

    return FALSE;
};

/*
 * This function reverts the changes of #163
 */
func int Ninja_G1CP_163_CastleGateRevert() {
    if (Ninja_G1CP_IsFixApplied(163)) {
        var int movPtr; movPtr = MEM_SearchVobByName("EVT_OC_INNERMAINGATE");
        if (Hlp_Is_zCMover(movPtr)) {
            var zCMover mov; mov = _^(movPtr);
            if (mov.bitfield & zCMover_bitfield_autoLinkEnabled) {
                mov.bitfield = mov.bitfield & ~zCMover_bitfield_autoLinkEnabled;
                return TRUE;
            };
        };
    };
    return FALSE;
};

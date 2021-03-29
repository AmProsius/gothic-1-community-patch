/*
 * #193 Gates triggered by switches are stuck after loading
 *
 * Originally the idea was to fix the switch states on unarchiving. Unfortunately, the trigger-targets to infer the
 * state from might not be unarchived at that time. Therefore, the switches are updated post-hoc after loading is
 * complete. This is, of course, not so elegant or fast.
 *
 * The state of this fix is not informative, because it will only show as "applied" right after loading. When the fix
 * is re-applied after saving, it will no longer be listed as "applied", because it was never reverted (only its state).
 *
 * This approach is based on (but much improved): https://forum.worldofplayers.de/forum/threads/?p=25954985
 */

/*
 * Obtain the state of a VOB or its trigger-target VOB recursively
 */
func int G1CP_193_GateSwitchesStuck_InferState(var string targetVobName) {
    const int zCTriggerList_vtbl                    = 8239436; //0x7DB94C
    const int zCTriggerList__activeTargetIdx_offset = 476;     //0x1DC
    const int zCTriggerList__triggerTargets_offset  = 328;     //0x148
    const int MOVER_STATE_OPEN                      = 0;

    // Filter out empty targets
    if (Hlp_StrCmp(targetVobName, "")) {
        return 0;
    };

    // Obtain trigger-target VOB
    var int targetPtr; targetPtr = MEM_SearchVobByName(targetVobName);
    if (!targetPtr) {
        return 0;
    };

    // Check if mover
    if (Hlp_Is_zCMover(targetPtr)) {
        var zCMover mover; mover = _^(targetPtr);
        return (mover.moverState == MOVER_STATE_OPEN);
    };

    // Check if trigger list
    if (MEM_ReadInt(targetPtr) == zCTriggerList_vtbl) {
        var int idx; idx = MEM_ReadInt(targetPtr+zCTriggerList__activeTargetIdx_offset);
        var int arr; arr = targetPtr+zCTriggerList__triggerTargets_offset;
        var string act; act = MEM_ReadStringArray(arr, idx);
        return G1CP_193_GateSwitchesStuck_InferState(act); // Recursion with new trigger target
    };

    // No target or non-triggerable (== another oCMobInter)
    return 0;
};

/*
 * This function applies the changes
 */
func int G1CP_193_GateSwitchesStuck() {
    var int vobTreePtr; vobTreePtr = _@(MEM_Vobtree);
    var int worldPtr; worldPtr = _@(MEM_World);
    var int arrPtr; arrPtr = MEM_ArrayCreate();

    // Find all oCMobInter objects
    const int zCWorld__SearchVobListByBaseClass = 6250016; //0x5F5E20
    const int oCMobInter__classDef              = 9285728; //0x8DB060
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(vobTreePtr));
        CALL_PtrParam(_@(arrPtr));
        CALL_PtrParam(_@(oCMobInter__classDef));
        CALL__thiscall(_@(worldPtr), zCWorld__SearchVobListByBaseClass);
        call = CALL_End();
    };

    // Iterate over all found MOBs
    var int count; count = 0;
    repeat(i, MEM_ArraySize(arrPtr)); var int i;
        var int vobPtr; vobPtr = MEM_ArrayRead(arrPtr, i);
        var oCMobInter mob; mob = _^(vobPtr);

        // Infer the state from potential trigger targets (if none, zero)
        var int state; state = G1CP_193_GateSwitchesStuck_InferState(mob.triggerTarget);

        // Update animation and state
        if (state != mob.state) {

            // Get MOB model
            var int model; model = mob._zCVob_visual;
            if (model) {
                if (MEM_ReadInt(model+88)) { // Extra safety: Check for zCModelPrototype
                    const string aniStr = "";
                    aniStr = ConcatStrings("S_S", IntToString(state));

                    // Check if the model has the corresponding animation
                    const int zCModel__GetAniIDFromAniName = 4713552; //0x47EC50
                    const int strPtr = 0;
                    const int call2 = 0;
                    if (CALL_Begin(call2)) {
                        strPtr = _@s(aniStr);
                        CALL_PtrParam(_@(strPtr));
                        CALL_PutRetValTo(_@(aniId));
                        CALL__thiscall(_@(model), zCModel__GetAniIDFromAniName);
                        call2 = CALL_End();
                    };

                    // Only if it does, apply it
                    var int aniId;
                    if (aniId != -1) {
                        const int zCModel__StartAni = 5640864; //0x5612A0
                        const int call3 = 0;
                        if (CALL_Begin(call3)) {
                            CALL_IntParam(_@(FALSE));
                            CALL_PtrParam(_@(aniId));
                            CALL__thiscall(_@(model), zCModel__StartAni);
                            call3 = CALL_End();
                        };

                        // Finally update the state
                        mob.state = state;
                        mob.state_target = state;

                        count += 1;
                    };
                };
            };
        };
    end;

    // Free the array
    MEM_ArrayFree(arrPtr);

    // Return success
    return (count > 0);
};

/*
 * No need to revert anything. This function is just added for completeness
 */
func int G1CP_193_GateSwitchesStuckRevert() {
    return TRUE;
};

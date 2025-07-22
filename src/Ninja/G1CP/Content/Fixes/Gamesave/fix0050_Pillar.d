/*
 * #50 Column in monastery ruin falls in wrong direction
 */

/* Old bounding box of the pillar (Integerfloats for precision) */
const int G1CP_0050_Pillar_BBoxUp[6] = {
     1185788240, 1158508150, 1189383823,
     1185874939, 1161671733, 1189471981
};
const int G1CP_0050_Pillar_BBoxDown[6] = {
     1185788240, 1158263848, 1189370762,
     1186082677, 1161671733, 1189701003
};
/* Old position of the pillar */
const int G1CP_0050_Pillar_PosOld[16] = {
     1061428080,          0, 1059360178, 1185813390,
              0, 1065353216,          0, 1158508150,
    -1088123470,          0, 1061428080, 1189410053,
              0,          0,          0, 1065353216
};
/* New position of the pillar */
const float G1CP_0050_Pillar_PosNew[16] = {
    -0.766044, 0.000000, -0.642787, 22345.777343,
     0.000000, 1.000000,  0.000000,  2262.903808,
     0.642787, 0.000000, -0.766044, 29390.509765,
     0.000000, 0.000000,  0.000000,     1.000000
};

/*
 * Identify the pillar in the world
 */
func int G1CP_0050_PillarFind() {
    // Find all vobs of matching name
    var int arrPtr; arrPtr = MEM_SearchAllVobsByName("MOBSISEULE");

    // Narrow down the search
    var int foundPtr; foundPtr = 0;
    repeat(i, MEM_ArraySize(arrPtr)); var int i;
        var int vobPtr; vobPtr = MEM_ArrayRead(arrPtr, i);

        // Check if vob is an interactive mob
        if (!Hlp_Is_oCMobInter(vobPtr)) {
            continue;
        };

        // Make sure it has a visual
        var zCVob pillar; pillar = _^(vobPtr);
        if (!pillar.visual) {
            continue;
        };

        // Confirm visual name (non-recyclable call)
        var int vtbl; vtbl = MEM_ReadInt(pillar.visual);
        var int GetVisualName; GetVisualName = MEM_ReadInt(vtbl+32);
        CALL_RetValIszString();
        CALL__thiscall(pillar.visual, GetVisualName);
        if (!Hlp_StrCmp(CALL_RetValAszString(), "PILLAR_7M.MDS")) {
            continue;
        };

        // Positively identified
        foundPtr = vobPtr;
        break;
    end;

    // Free the array
    MEM_ArrayFree(arrPtr);

    return foundPtr;
};

/*
 * This function applies the changes of #50
 */
func int G1CP_0050_Pillar() {
    // Before anything else, check if the memory was modified
    const int oCMobInter__StopInteraction_End = 6816979; //0x6804D3
    if (!G1CP_CheckBytes(oCMobInter__StopInteraction_End, "8B 8C 24 8C 00 00 00")) {
        return FALSE;
    };

    // Find the pillar in the world
    var int vobPtr; vobPtr = G1CP_0050_PillarFind();
    if (vobPtr) {

        // Confirm exact position
        if (!MEM_CompareWords(vobPtr+60, _@(G1CP_0050_Pillar_PosOld), 16)) {
            return FALSE;
        };

        // Confirm exact bounding box, in case the visual was replaced
        if (!MEM_CompareWords(vobPtr+124, _@(G1CP_0050_Pillar_BBoxUp), 6))     // Upright
        && (!MEM_CompareWords(vobPtr+124, _@(G1CP_0050_Pillar_BBoxDown), 6)) { // Fallen
            return FALSE;
        };

        // Add state function
        var oCMobInter mob; mob = _^(vobPtr);
        if (!Hlp_StrCmp(mob.onStateFuncName, "")) && (G1CP_IsCallable(mob.onStateFuncName)) {
            HookDaedalusFuncS(mob.onStateFuncName, "G1CP_0050_Pillar_StateFunc_S1");
        } else {
            mob.onStateFuncName = "G1CP_0050_PILLAR_STATEFUNC"; // _S1 added automatically
        };

        // Update position
        G1CP_TransformVob(vobPtr, _@f(G1CP_0050_Pillar_PosNew));
        return TRUE;
    };

    // Pillar not found
    return FALSE;
};

/*
 * This function reverts the changes of #50
 */
func int G1CP_0050_PillarRevert() {
    // Save some time by checking if even applied
    if (!G1CP_IsFixApplied(50)) {
        return FALSE;
    };

    // Identify the pillar
    var int vobPtr; vobPtr = G1CP_0050_PillarFind();
    if (vobPtr) {
        // Revert state func
        var oCMobInter mob; mob = _^(vobPtr);
        if (Hlp_StrCmp(mob.onStateFuncName, "G1CP_0050_PILLAR_STATEFUNC")) {
            mob.onStateFuncName = "";
        };

        // Revert position only if it is as expected
        G1CP_TransformVob(vobPtr, _@(G1CP_0050_Pillar_PosOld));
    };

    // Remove the hook function again if it had been applied before
    const int oCMobInter__StopInteraction_End = 6816979; //0x6804D3
    if (IsHooked(oCMobInter__StopInteraction_End)) {
        HookEngineF(oCMobInter__StopInteraction_End, 7, G1CP_0050_Pillar_FixBbox); // Actively add to event
        RemoveHookF(oCMobInter__StopInteraction_End, 7, G1CP_0050_Pillar_FixBbox); // In order to fully remove
    };

    // Found and reverted pillar
    return (vobPtr != 0);
};

/*
 * State function of the mob to be called after interaction is complete
 */
func void G1CP_0050_Pillar_StateFunc_S1() {
    G1CP_ReportFuncToSpy();

    // Can't update the bounding box yet. Wait for complete stop
    const int oCMobInter__StopInteraction_End = 6816979; //0x6804D3
    if (G1CP_CheckBytes(oCMobInter__StopInteraction_End, "8B 8C 24 8C 00 00 00")) {
        HookEngineF(oCMobInter__StopInteraction_End, 7, G1CP_0050_Pillar_FixBbox);
    };
};
func void G1CP_0050_Pillar_FixBbox() {
    G1CP_ReportFuncToSpy();

    var int vobPtr; vobPtr = ESI;
    if (vobPtr != G1CP_0050_PillarFind()) {
        // Not the mob in question
        return;
    };

    // Remove hook now
    const int oCMobInter__StopInteraction_End = 6816979; //0x6804D3
    RemoveHookF(oCMobInter__StopInteraction_End, 0, G1CP_0050_Pillar_FixBbox); // Keep engine hooked: Currently executed!

    var zCVob vob; vob = _^(vobPtr);
    if (!vob.visual) {
        return;
    };

    // Iterate over all model nodes to compute the correct bounding box
    var int bbox[6]; var int bboxPtr; bboxPtr = _@(bbox);
    var int modelBboxPtr; modelBboxPtr = vob.visual+204; // zCModel.bbox
    var zCArray nodeList; nodeList = _^(vob.visual+100); // zCArray<zCModelNodeInst*>
    repeat(j, nodeList.numInArray); var int j;
        var int nodeInst; nodeInst = MEM_ReadIntArray(nodeList.array, j); // zCModelNodeInst*
        var int nodeVis; nodeVis = MEM_ReadInt(nodeInst+8); // zCVisual *
        if (nodeVis) {
            // Non-recyclable call (virtual method call)
            var int vtbl; vtbl = MEM_ReadInt(nodeVis);
            var int GetBBox3D; GetBBox3D = MEM_ReadInt(vtbl+24);
            CALL_PtrParam(bboxPtr);
            CALL__thiscall(nodeVis, GetBBox3D);

            // Enlarge the model bounding box by including the node bounding box
            const int zTBBox3D__CalcGreaterBBox3D = 5441728; //0x5308C0
            const int call2 = 0;
            if (CALL_Begin(call2)) {
                CALL_PtrParam(_@(bboxPtr));
                CALL__thiscall(_@(modelBboxPtr), zTBBox3D__CalcGreaterBBox3D);
                call2 = CALL_End();
            };
        };
    end;

    // Update the bounding box of the vob (done by the model's bounding box)
    G1CP_TransformVob(vobPtr, _@(vob.trafoObjToWorld));
};

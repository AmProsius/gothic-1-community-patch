/*
 * #50 Column in monastery ruin falls in wrong direction
 */

/* Old bounding box of the pillar (Integerfloats for precision) */
const int Ninja_G1CP_050_Pillar_BBoxOld[6] = {
     1185788240, 1158508150, 1189383823,
     1185874939, 1161671733, 1189471981
};
/* Old position of the pillar */
const int Ninja_G1CP_050_Pillar_PosOld[16] = {
     1061428080,          0, 1059360178, 1185813390,
              0, 1065353216,          0, 1158508150,
    -1088123470,          0, 1061428080, 1189410053,
              0,          0,          0, 1065353216
};
/* New position of the pillar */
const float Ninja_G1CP_050_Pillar_PosNew[16] = {
    -0.766044, 0.000000, -0.642787, 22345.777343,
     0.000000, 1.000000,  0.000000,  2262.903808,
     0.642787, 0.000000, -0.766044, 29390.509765,
     0.000000, 0.000000,  0.000000,     1.000000
};

/*
 * This function applies the changes of #50
 */
func void Ninja_G1CP_050_Pillar() {
    // Find all vobs of matching name
    var int arrPtr; arrPtr = MEM_SearchAllVobsByName("MOBSISEULE");

    // Narrow down the search
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

        // Confirm exact position
        if (!MEM_CompareWords(vobPtr+60, _@(Ninja_G1CP_050_Pillar_PosOld), 16)) {
            continue;
        };

        // Confirm exact bounding box, in case the visual was replaced
        if (!MEM_CompareWords(vobPtr+124, _@(Ninja_G1CP_050_Pillar_BBoxOld), 6)) {
            continue;
        };

        // Update position and rename the mob to revert to changes later
        MEM_RenameVob(vobPtr, "NINJA_G1CP_050_PILLAR");

        // Add state function
        var oCMobInter mob; mob = _^(vobPtr);
        if (!Hlp_StrCmp(mob.onStateFuncName, "")) {
            HookDaedalusFuncS(mob.onStateFuncName, "Ninja_G1CP_050_Pillar_StateFunc_S1");
        } else {
            mob.onStateFuncName = "NINJA_G1CP_050_PILLAR_STATEFUNC"; // _S1 added automatically
        };

        // Update position
        const int zCVob__SetTrafoObjToWorld = 6219616; //0x5EE760
        var zCVob v; v = _^(vobPtr);
        var int bits; bits = v.bitfield[0];
        v.bitfield[0] = v.bitfield[0] & ~(zCVob_bitfield0_collDetectionStatic | zCVob_bitfield0_collDetectionDynamic);
        var int trfPtr; trfPtr = _@f(Ninja_G1CP_050_Pillar_PosNew);
        const int call = 0;
        if (CALL_Begin(call)) {
            CALL_PtrParam(_@(trfPtr));
            CALL__thiscall(_@(vobPtr), zCVob__SetTrafoObjToWorld);
            call = CALL_End();
        };
        v.bitfield[0] = bits;
    end;
};

/*
 * This function reverts the changes of #50
 */
func void Ninja_G1CP_050_Revert() {
    var int vobPtr; vobPtr = MEM_SearchVobByName("NINJA_G1CP_050_PILLAR");
    if (vobPtr) {
        // Revert name
        MEM_RenameVob(vobPtr, "MOBSISEULE");

        // Revert state func
        var oCMobInter mob; mob = _^(vobPtr);
        if (Hlp_StrCmp(mob.onStateFuncName, "NINJA_G1CP_050_PILLAR_STATEFUNC")) {
            mob.onStateFuncName = "";
        };

        // Revert position
        const int zCVob__SetTrafoObjToWorld = 6219616; //0x5EE760
        var zCVob v; v = _^(vobPtr);
        var int bits; bits = v.bitfield[0];
        v.bitfield[0] = v.bitfield[0] & ~(zCVob_bitfield0_collDetectionStatic | zCVob_bitfield0_collDetectionDynamic);
        var int trfPtr; trfPtr = _@(Ninja_G1CP_050_Pillar_PosOld);
        const int call = 0;
        if (CALL_Begin(call)) {
            CALL_PtrParam(_@(trfPtr));
            CALL__thiscall(_@(vobPtr), zCVob__SetTrafoObjToWorld);
            call = CALL_End();
        };
        v.bitfield[0] = bits;
    };
};

/*
 * State function of the mob to be called after interaction is complete
 */
func void Ninja_G1CP_050_Pillar_StateFunc_S1() {
    // Can't update the bounding box yet. Wait for complete stop
    const int oCMobInter__StopInteraction_End = 6816979; //0x6804D3
    HookEngineF(oCMobInter__StopInteraction_End, 7, Ninja_G1CP_050_Pillar_FixBbox);
};
func void Ninja_G1CP_050_Pillar_FixBbox() {
    var int vobPtr; vobPtr = ESI;
    if (!Hlp_StrCmp(MEM_ReadString(vobPtr+16), "NINJA_G1CP_050_PILLAR"))
    || (!Hlp_Is_oCMobInter(vobPtr)) {
        // Not the mob in question
        return;
    };

    // Remove hook now
    const int oCMobInter__StopInteraction_End = 6816979; //0x6804D3
    RemoveHookF(oCMobInter__StopInteraction_End, 7, Ninja_G1CP_050_Pillar_FixBbox);

    var zCVob vob; vob = _^(vobPtr);
    if (!vob.visual) {
        return;
    };

    // Iterate over all model nodes to compute the correct bounding box
    var int bbox[6]; var int bboxPtr; bboxPtr = _@(bbox);
    var int modelBBoxPtr; modelBBoxPtr = vob.visual+204; // zCModel.bbox
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
                CALL__thiscall(_@(modelBBoxPtr), zTBBox3D__CalcGreaterBBox3D);
                call2 = CALL_End();
            };
        };
    end;

    // Update the bounding box of the vob (done by the model's bounding box)
    const int zCVob__SetTrafoObjToWorld = 6219616; //0x5EE760
    var int trfPtr; trfPtr = _@(vob.trafoObjToWorld);
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(trfPtr));
        CALL__thiscall(_@(vobPtr), zCVob__SetTrafoObjToWorld);
        call = CALL_End();
    };
};

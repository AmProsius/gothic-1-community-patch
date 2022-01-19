/*
 * #56 Misplaced swamp portal
 */
func int G1CP_056_SwampPortal() {
    var int applied; applied = 0;

    // zCRenderer::SetPolyDrawMode(zTRnd_PolyDrawMode const &) // WMAT == 1

    // If getting the material instead is sufficient we can do this almost instantly with
    const int zCClassDef__SearchHashTable = 5812912; //0x58B2B0
    const int zCMaterial__classDef        = 8861992; //0x873928
    CALL_PtrParam(_@s("P:PSU01_"));
    CALL_PutRetValTo(_@(matPtr));
    CALL__thiscall(zCMaterial__classDef, zCClassDef__SearchHashTable);
    var int matPtr;
    if (matPtr) {
        var zCMaterial mat; mat = _^(matPtr);
        /*
        texture:        0
        matGroup:       0
        bspSectorFront: "PSU01" *
        bspSectorBack:  0
        kambient:       0
        kdiffuse:       -1
        bitfield:       0
        */

        if (mat.bspSectorFront) {
            var zCBspSector sector; sector = _^(mat.bspSectorFront);

            /*
            sectorNodes_numInArray:      49
            sectorPortals_numInArray:    72
            sectorPortalInfo_numInArray: 0
            hasBigNoFade:                1868767232
            */

            // sector.hasBigNoFade = sector.hasBigNoFade | ((1<<8)-1);

            // sector.sectorPortals_array = 0;
            // sector.sectorPortals_numAlloc = 0;
            // sector.sectorPortals_numInArray = 0;

            // sector.sectorName = "G1CP_disabled_sector";

            // mat.bspSectorFront = 0;
        };
        mat.color = zCOLOR_RED;
        // mat._zCObject_objectName = "G1CP_disabled_material";
    };


    // -----------


    // Iterate over all polygons in the mesh (oof! Way too slow, re-write in assembly)
    repeat(i, MEM_World.bspTree_numPolys); var int i;
        var zCPolygon poly; poly = _^(MEM_ReadIntArray(MEM_World.bspTree_treePolyList, i));

        // Find the occluder portal polygons
        if (poly.bitfield[0] & (zCPolygon_bitfield_portalPoly | zCPolygon_bitfield_occluder))
        && (!(poly.bitfield[0] & zCPolygon_bitfield_ghostOccluder)) {

            // Check for correct material
            if (poly.material) {
                if (MEM_ReadInt(poly.material) == zCMaterial_vtbl) {
                    var zCMaterial mat; mat = _^(poly.material);
                    if (Hlp_StrCmp(mat._zCObject_objectName, "P:PSU01_")) {

                        // --- DEBUG ---
                        // var int bbox[6];
                        // const int zCPolygon__GetBBox3D = 5867456; //0x5987C0
                        // CALL_PtrParam(_@(bbox));
                        // CALL__thiscall(_@(poly), zCPolygon__GetBBox3D);
                        // var int ob; ob = DrawBBoxAddr(_@(bbox), zCOLOR_RED);
                        mat.color = zCOLOR_RED;
                        // --- DEBUG ---

                        // How do we now remove these polygons?

                        // Some of the failed attempts:

                        /* mat._zCObject_refCtr -= 1;
                        if (mat._zCObject_refCtr <= 0) {
                            const int zCMaterial__delete = 5558384; //0x54D070
                            CALL_IntParam(-1);
                            CALL__thiscall(poly.material, zCMaterial__delete);
                        }; */
                        // poly.material = 0;
                        // poly.bitfield[0] = poly.bitfield[0] & ~(zCPolygon_bitfield_portalPoly
                        //                                       | zCPolygon_bitfield_occluder);
                        // poly.bitfield[0] = poly.bitfield[0] | zCPolygon_bitfield_ghostOccluder;
                        // poly.bitfield[0] = poly.bitfield[0] & ~zCPolygon_bitfield_portalPoly;
                        // mat._zCObject_objectName = "G1CP_disabled";

                        // // Iterate over all vertices
                        // var int strBld; strBld = SB_New();
                        // repeat(j, poly.bitfield[0] & zCPolygon_bitfield_polyNumVert); var int j;
                        //     var int vertPtr; vertPtr = MEM_ReadIntArray(poly.vertex, j);

                        //     SB(" [");
                        //     SBf(MEM_ReadInt(vertPtr));
                        //     SB(", ");
                        //     SBf(MEM_ReadInt(vertPtr+4));
                        //     SB(", ");
                        //     SBf(MEM_ReadInt(vertPtr+8));
                        //     SB("] ");
                        // end;
                        // MEM_Info(SB_ToString());
                        // SB_Destroy();

                        // At least one poly was adjusted
                        applied += 1;
                    };
                };
            };
        };
    end;

    return (applied > 0);
};


/*
 * Revert the changes
 */
func int G1CP_056_SwampPortalRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(56)) {
        return FALSE;
    };

    // TODO
    return FALSE;
};

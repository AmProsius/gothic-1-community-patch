/*
 * #56 Misplaced swamp portal
 */
func int G1CP_056_SwampPortal() {
    var int applied; applied = FALSE;

    // Iterate over all polygons in the mesh (oof! Way too slow, re-write in assembly)
    repeat(i, MEM_World.bspTree_numPolys); var int i;
        var zCPolygon poly; poly = _^(MEM_ReadIntArray(MEM_World.bspTree_treePolyList, i));

        // Find the occluder portal polygons
        if (poly.bitfield[0] & (zCPolygon_bitfield_portalPoly | zCPolygon_bitfield_occluder))
        && (!(poly.bitfield[0] & zCPolygon_bitfield_ghostOccluder)) {

            // Check for correct material
            var zCMaterial mat; mat = _^(poly.material);
            if (mat) {
                if (Hlp_StrCmp(mat._zCObject_objectName, "P:PSU01_")) {

                    // --- DEBUG ---
                    //var int bbox[6];
                    //const int zCPolygon__GetBBox3D = 5867456; //0x5987C0
                    //CALL_PtrParam(_@(bbox));
                    //CALL__thiscall(_@(poly), zCPolygon__GetBBox3D);
                    //var int ob; ob = DrawBBoxAddr(_@(bbox), zCOLOR_RED);
                    mat.color = zCOLOR_RED;
                    // --- DEBUG ---

                    // How do we now remove these polygons?

                    // All the failed attempts:

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


                    // At least one poly was adjusted
                    applied = TRUE;
                };
            };
        };
    end;

    return applied;
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

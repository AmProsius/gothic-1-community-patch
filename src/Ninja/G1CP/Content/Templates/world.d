/*
 * Find VOB in the world by its exact position and move it to another position. Returns true on success.
 */
func int G1CP_Tpl_ChangeVobLocation(var int originalPosPtr, var int correctedPosPtr, var func callback) {
    var int vobPtr; vobPtr = G1CP_FindVobByPosPtr(originalPosPtr, callback);

    if (!vobPtr) {
        return FALSE;
    };

    G1CP_MoveVobToPosPtr(vobPtr, correctedPosPtr);
    return TRUE;
};
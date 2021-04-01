/*
 * This check does not consider perceptions, senses range and angles, but really only uninterrupted line of sight.
 * Due to the simple structure of the engine function, this function can be used for any zCVob (not restricted to NPCs)
 */
func int G1CP_VobFreeLineOfSight(var int slfPtr, var int vobPtr) {
    if (!slfPtr) || (!vobPtr) {
        return FALSE;
    };

    const int oCNpc__FreeLineOfSight  = 6938192; //0x69DE50
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(vobPtr));
        CALL_PutRetValTo(_@(ret));
        CALL__thiscall(_@(slfPtr), oCNpc__FreeLineOfSight); // Does not have to be an NPC
        call = CALL_End();
    };

    var int ret;
    return +ret;
};


/*
 * Check if a VOB is (partially) visible on the screen
 */
func int G1CP_VobIsVisibleOnScreen(var int vobPtr) {
    if (!vobPtr) {
        return FALSE;
    };

    // Make sure the VOB physically exists
    var zCVob vob; vob = _^(vobPtr);
    if (!vob.homeWorld) {
        return FALSE;
    };

    // Don't bother if it was not even rendered
    const int bspFrameCtrAddr = 8846276; //0x86FBC4
    if (vob.lastTimeDrawn < MEM_ReadInt(bspFrameCtrAddr)) {
        return FALSE;
    };

    // Project position to the screen
    const int zCVob__GetScreenBBox2D = 6128992; //0x5D8560
    const int bbox2dPtr = 0;
    const int call = 0;
    var int bbox2d[4];
    if (CALL_Begin(call)) {
        bbox2dPtr = _@(bbox2d);
        CALL_PtrParam(_@(bbox2dPtr));
        CALL__thiscall(_@(vobPtr), zCVob__GetScreenBBox2D);
        call = CALL_End();
    };

    // Check if the projection lies on the visible region of the screen
    MEM_InitGlobalInst();
    if (gf(bbox2d[0], MEM_Camera.xmaxFloat)) {
        return FALSE;
    };
    if (lf(bbox2d[2], MEM_Camera.xminFloat)) {
        return FALSE;
    };
    if (gf(bbox2d[1], MEM_Camera.ymaxFloat)) {
        return FALSE;
    };
    if (lf(bbox2d[3], MEM_Camera.yminFloat)) {
        return FALSE;
    };

    // Check if something is blocking the view
    var int vis; vis = G1CP_VobFreeLineOfSight(MEM_Camera.connectedVob, vobPtr);

    const int DEBUG = TRUE;
    if (vis) && (DEBUG) {
        const int zTBBox2D__Draw = 5450688; //0x532BC0
        const int call2 = 0;
        if (CALL_Begin(call2)) {
            CALL__thiscall(_@(bbox2dPtr), zTBBox2D__Draw);
            call2 = CALL_End();
        };
    };

    return +vis;
};

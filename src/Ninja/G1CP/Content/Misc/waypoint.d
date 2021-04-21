/*
 * Find a waypoint by its name
 */
func int G1CP_GetWaypoint(var string name) {
    const int zCWayNet__GetWaypoint = 7366448; //0x706730

    var int waynetPtr; waynetPtr = _@(MEM_Waynet);
    name = STR_Upper(name);

    const int call = 0;
    const int namePtr = 0;
    if (Call_Begin(call)) {
        namePtr = _@s(name);
        CALL_PutRetValTo(_@(ret));
        CALL__fastcall(_@(waynetPtr), _@(namePtr), zCWayNet__GetWaypoint);
        call = CALL_End();
    };

    var int ret;
    return +ret;
};

/*
 * Create a new waypoint with name and position if it does not already exist
 */
func int G1CP_CreateWaypoint(var string name, var int posPtr) {
    var int wp; wp = G1CP_GetWaypoint(name);
    if (wp) {
        return +wp;
    };

    var int waynetPtr; waynetPtr = _@(MEM_Waynet);

    const int zCWayNet__HasWaypoint = 7353232; //0x703390

    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(posPtr));
        CALL_PutRetValTo(_@(wp));
        CALL__thiscall(_@(waynetPtr), zCWayNet__HasWaypoint);
        call = CALL_End();
    };

    if (wp) {
        return +wp;
    };

    var int namePtr; namePtr = _@s(name);

    const int zCObjectFactory__CreateWaypoint = 5816224; //0x58BFA0
    const int zCWaypoint__Init                = 7363744; //0x705CA0
    const int zCWaypoint__SetName             = 7364528; //0x705FB0
    const int zfactory                        = 8863624; //0x873F88

    const int call2 = 0;
    if (CALL_Begin(call2)) {
        CALL_PutRetValTo(_@(wp));
        CALL__thiscall(zfactory, zCObjectFactory__CreateWaypoint);

        CALL_PtrParam(_@(posPtr));
        CALL__thiscall(_@(wp), zCWaypoint__Init);

        CALL_PtrParam(_@(namePtr));
        CALL__thiscall(_@(wp), zCWaypoint__SetName);

        call2 = CALL_End();
    };

    return +wp;
};

/*
 * Insert waypoint in between two existing ones, creating two ways connecting them
 * i.e.: wp1----new----wp3
 */
func void G1CP_InsertWaypoint(var string name, var int posPtr, var string wp1, var string wp3) {
    var int w1; w1 = G1CP_GetWaypoint(wp1);
    var int w3; w3 = G1CP_GetWaypoint(wp3);
    if ((!w1) || (!w3)) {
        return;
    };

    var int w2; w2 = G1CP_CreateWaypoint(name, posPtr);

    var int waynetPtr; waynetPtr = _@(MEM_Waynet);

    const int zCWayNet__InsertWaypoint = 7353632; //0x703520
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(w3));
        CALL_PtrParam(_@(w2));
        CALL_PtrParam(_@(w1));
        CALL__thiscall(_@(waynetPtr), zCWayNet__InsertWaypoint);
        call = CALL_End();
    };
};

/*
 * Get distance to a waypoint
 */
func int G1CP_GetDistToWp(var int vobPtr, var string wp) {
    if (!vobPtr) {
        return -1;
    };

    // Find waypoint
    var int wpPtr; wpPtr = G1CP_GetWaypoint(wp);
    if (!wpPtr) {
        return -1;
    };

    // Check if vob exists in world
    var zCVob vob; vob = _^(vobPtr);
    if (!vob.homeWorld) {
        return -1;
    };

    // Obtain position
    var zCWaypoint wp1; wp1 = _^(wpPtr);

    // Get distances
    var int dist[3];
    dist[0] = sqrf(subf(wp1.pos[0], vob.trafoObjToWorld[ 3]));
    dist[1] = sqrf(subf(wp1.pos[1], vob.trafoObjToWorld[ 7]));
    dist[2] = sqrf(subf(wp1.pos[2], vob.trafoObjToWorld[11]));

    return sqrtf(addf(addf(dist[0], dist[1]), dist[2]));
};

/*
 * Get nearest waypoint
 */
func string G1CP_GetNearestWp(var int vobPtr) {
    if (!vobPtr) {
        return "";
    };

    // Get position of VOB
    var zCVob vob; vob = _^(vobPtr);
    var int pos[3];
    pos[0] = vob.trafoObjToWorld[ 3];
    pos[1] = vob.trafoObjToWorld[ 7];
    pos[2] = vob.trafoObjToWorld[11];

    var int waynetPtr; waynetPtr = _@(MEM_Waynet);
    const int zCWayNet__GetNearestWaypoint = 7354960; //0x703A50
    const int call = 0;
    const int posPtr = 0;
    if (Call_Begin(call)) {
        posPtr = _@(pos);
        CALL_PutRetValTo(_@(wpPtr));
        CALL__fastcall(_@(waynetPtr), _@(posPtr), zCWayNet__GetNearestWaypoint);
        call = CALL_End();
    };

    var int wpPtr;
    if (wpPtr) {
        var zCWaypoint wp1; wp1 = _^(wpPtr);
        return wp1.name;
    } else {
        return "";
    };
};

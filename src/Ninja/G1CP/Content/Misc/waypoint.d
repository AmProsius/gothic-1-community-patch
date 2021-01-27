/*
 * Waypoint functions
 */

func int Ninja_G1CP_GetWaypointByName(var string name) {
    const int zCWayNet__GetWaypoint = 7366448; //0x706730

    var int waynetPtr; waynetPtr = MEM_World.wayNet;
    var int wpNamePtr; wpNamePtr = _@s(name);

    const int call = 0;
    if (Call_Begin(call)) {
        CALL_PutRetValTo(_@(ret));
        CALL__fastcall(_@(waynetPtr), _@(wpNamePtr), zCWayNet__GetWaypoint);
        call = CALL_End();
    };

    var int ret;
    return +ret;
};


func int Ninja_G1CP_GetDistToWp(var int vobPtr, var int wpPtr) {
    if (!vobPtr) || (!wpPtr) {
        return 0;
    };

    // Check if vob exists in world
    var zCVob vob; vob = _^(vobPtr);
    if (!vob.homeWorld) {
        return 0;
    };

    // Obtain position
    var zCWaypoint wp; wp = _^(wpPtr);

    // Get distances
    var int dist[3];
    dist[0] = sqrf(subf(wp.pos[0], vob.trafoObjToWorld[ 3]));
    dist[1] = sqrf(subf(wp.pos[1], vob.trafoObjToWorld[ 7]));
    dist[2] = sqrf(subf(wp.pos[2], vob.trafoObjToWorld[11]));

    return sqrtf(addf(addf(dist[0], dist[1]), dist[2]));
};
func int Ninja_G1CP_GetDistToWpName(var int vobPtr, var string name) {
    return Ninja_G1CP_GetDistToWp(vobPtr, Ninja_G1CP_GetWaypointByName(name));
};

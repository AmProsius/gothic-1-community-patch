/*
 * #46 Smith's door has wrong key instance
 *
 * This fix replaces the required key instance of the door under the following circumstances:
 *  - The door is identified by its exact location
 *  - The door requires the expected (incorrect) key instance
 *  - There is no item of the incorrect key instance (possibly added by a mod to fix the problem the other way around)
 *  - The door is not already unlocked (because in that case the fix is not necessary)
 *  - The door's lock is not pickable (possibly added by a mod in part of a new quest)
 *
 * When reverting, the door will also be locked, as there is no possible way it could have been opened (if the fix was
 * applied, i.e. the above conditions were all met). To accommodate saving and loading WITH the patch, the locked state
 * of the door is stored in a variable. Whether the variable survives saving and loading cannot be guaranteed (it will
 * be lost when removing Ninja). So this variable is just for convenience. One important note follows: If the door does
 * become "re-locked" after saving and loading, the key instance should always be re-acquirable in the game (see #47).
 */

/* Position of the door */
const int Ninja_G1CP_046_SmithDoor_PosOld[3] = {
     1164227412, 1132825156, 1148357543
};

/* Locked state for saving and loading */
var int Ninja_G1CP_046_SmithDoorUnlocked;

/*
 * Identify the door in the world
 */
func int Ninja_G1CP_046_SmithDoorFind() {
    // Create VOB array once, clear it on consecutive calls
    const int arrPtr = 0;
    if (!arrPtr) {
        arrPtr = MEM_ArrayCreate();
    } else {
        MEM_ArrayClear(arrPtr);
    };

    // Find all cCMobDoor objects
    // Source: https://forum.worldofplayers.de/forum/threads/?p=25717007
    const int zCWorld__SearchVobListByBaseClass = 6250016; //0x5F5E20
    const int oCMobDoor__classDef               = 9284672; //0x8DAC40

    var int vobTreePtr; vobTreePtr = _@(MEM_Vobtree);
    var int worldPtr;   worldPtr   = _@(MEM_World);

    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(vobTreePtr));
        CALL_PtrParam(_@(arrPtr));
        CALL_PtrParam(_@(oCMobDoor__classDef));
        CALL__thiscall(_@(worldPtr), zCWorld__SearchVobListByBaseClass);
        call = CALL_End();
    };

    // Narrow down the search
    repeat(i, MEM_ArraySize(arrPtr)); var int i;
        var int vobPtr; vobPtr = MEM_ArrayRead(arrPtr, i);
        var oCMobDoor mob; mob = _^(vobPtr);

        // Confirm exact position (separate if-conditions for performance)
        if (mob._zCVob_trafoObjToWorld[ 3] == Ninja_G1CP_046_SmithDoor_PosOld[0]) {
        if (mob._zCVob_trafoObjToWorld[ 7] == Ninja_G1CP_046_SmithDoor_PosOld[1]) {
        if (mob._zCVob_trafoObjToWorld[11] == Ninja_G1CP_046_SmithDoor_PosOld[2]) {

            // Make sure no lock picking string was added
            if (Hlp_StrCmp(mob._oCMobLockable_pickLockStr, "")) {
                return vobPtr;
            };

        }; }; };
    end;

    // Not found
    return 0;
};

/*
 * This function applies the changes of #46
 */
func int Ninja_G1CP_046_SmithDoor() {
    // First find the key symbol indices once
    const int keyIdOld = -2; // -1 is reserved for invalid symbols
    if (keyIdOld == -2) {
        keyIdOld = MEM_FindParserSymbol("ITKEY_OB_SMITH_01");
    };
    const int keyIdNew = -2; // -1 is reserved for invalid symbols
    if (keyIdNew == -2) {
        keyIdNew = MEM_FindParserSymbol("ITKE_OB_SMITH_01");
    };

    // Abort immediately if the correct key does not even exist
    if (keyIdNew == -1) {
        return FALSE;
    };

    // Find the door in the world
    var int vobPtr; vobPtr = Ninja_G1CP_046_SmithDoorFind();
    if (!vobPtr) {
        return FALSE;
    };
    var oCMobDoor mob; mob = _^(vobPtr);

    // Check if the door is still locked (an unlocked door does not need this fix)
    if (!(mob._oCMobLockable_bitfield | oCMobLockable_bitfield_locked)) {
        return FALSE;
    };

    // Check if the door references the expected key instance
    if (!Hlp_StrCmp(mob._oCMobLockable_keyInstance, "ITKEY_OB_SMITH_01")) {
        return FALSE;
    };

    // Make sure the key instance does not exist (might have been added by the mod)
    if (keyIdOld != -1) {
        return FALSE;
    };

    // Replace the key instance
    mob._oCMobLockable_keyInstance = "ITKE_OB_SMITH_01";

    // Unlock the door if the fix was applied previously and the door was unlocked
    if (Ninja_G1CP_046_SmithDoorUnlocked) {
        mob._oCMobLockable_bitfield = mob._oCMobLockable_bitfield & ~oCMobLockable_bitfield_locked;
    };

    return TRUE;
};

/*
 * This function reverts the changes of #46
 */
func int Ninja_G1CP_046_SmithDoorRevert() {
    // Check if the fix is applied
    if (!Ninja_G1CP_IsFixApplied(46)) {
        return FALSE;
    };

    // Find the door in the world
    var int vobPtr; vobPtr = Ninja_G1CP_046_SmithDoorFind();
    if (!vobPtr) {
        return FALSE;
    };
    var oCMobDoor mob; mob = _^(vobPtr);

    // Check if the door references the expected key instance
    if (!Hlp_StrCmp(mob._oCMobLockable_keyInstance, "ITKE_OB_SMITH_01")) {
        return FALSE;
    };

    // Replace the key instance with the original (incorrect) name
    mob._oCMobLockable_keyInstance = "ITKEY_OB_SMITH_01";

    // Remember if the door was already unlocked (not guaranteed to survive saving and loading)
    Ninja_G1CP_046_SmithDoorUnlocked = (mob._oCMobLockable_bitfield & oCMobLockable_bitfield_locked);

    // Additionally, lock the door, as there would have been no way of opening it with a non-existing key and no
    // lock picking string
    mob._oCMobLockable_bitfield = mob._oCMobLockable_bitfield | oCMobLockable_bitfield_locked;

    return TRUE;
};

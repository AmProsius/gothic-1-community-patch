/*
 * #226 Missing mana potion in stonehenge crypt chest
 */


/*
 * Identify the chest
 */
func int G1CP_226_PotionStonehengeChestFind() {
    // Find the chest by its position
    var int vobPtr; vobPtr = G1CP_FindVobByPosF(-35412.4219, 2280.677, -15320.7129, Hlp_Is_oCMobContainer);
    if (!vobPtr) {
        return 0;
    };
    var oCMobContainer mob; mob = _^(vobPtr);

    // Confirm its "contains" string
    const string expected = "FOCUS_5,ITKELOCKPICK:2,ITFOBEER:2,ITAMARROW:45,ITMINUGGET:521,,ITFO_POTION_MANA_03";
    if (!Hlp_StrCmp(mob.contains, expected)) {
        return 0;
    };

    // Check if it's still locked. A chest cannot be locked again after it was opened once
    if (!(mob._oCMobLockable_bitfield & oCMobLockable_bitfield_locked)) {
        return 0;
    };

    return vobPtr;
};


/*
 * Apply the changes
 */
func int G1CP_226_PotionStonehengeChest() {
    var int applied; applied = FALSE;

    // Check if the potion item even exists
    const int itemId = -2;
    if (itemId == -2) {
        itemId = G1CP_GetItemInstId("ItFo_Potion_Mana_03");
    };
    if (itemId == -1) {
        return FALSE;
    };

    // Find the chest
    var int vobPtr; vobPtr = G1CP_226_PotionStonehengeChestFind();
    if (!vobPtr) {
        return FALSE;
    };

    // Check if the potion is already in the inventory
    var int isIn;
    const int oCMobContainer__IsIn = 6833040; //0x684390
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_IntParam(_@(itemId));
        CALL_PutRetValTo(_@(isIn));
        CALL__thiscall(_@(vobPtr), oCMobContainer__IsIn);
        call = CALL_End();
    };
    if (isIn) {
        return FALSE;
    };

    // Finally: Add the missing potion
    var oCMobContainer mob; mob = _^(vobPtr);
    var string bak; bak = mob._zCObject_objectname;
    mob._zCObject_objectname = "G1CP 226 TEMPORARY MOB";
    Mob_CreateItems(mob._zCObject_objectname, itemId, 1);
    mob._zCObject_objectname = bak;
    return TRUE;
};


/*
 * Revert the changes
 */
func int G1CP_226_PotionStonehengeChestRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(226)) {
        return FALSE;
    };

    // The item does exist (checked by the function above), but we only need to retrieve the symbol index once
    const int itemId = -2;
    if (itemId == -2) {
        itemId = G1CP_GetItemInstId("ItFo_Potion_Mana_03");
    };

    // Find the chest by its position
    var int vobPtr; vobPtr = G1CP_226_PotionStonehengeChestFind();
    if (!vobPtr) {
        return FALSE;
    };

    // Remove the item from the chest. There is no convenient way to do this...
    var int removed; removed = FALSE;
    var oCMobContainer mob; mob = _^(vobPtr);
    var int list; list = mob.containList_next;
    while(list);
        var zCListSort l; l = _^(list);
        list = l.next;
        if (Hlp_Is_oCItem(l.data)) {
            var oCItem itm; itm = _^(l.data);
            if (itm.instanz == itemId) {
                if (itm.amount > 1) {
                    itm.amount -= 1;
                    removed = TRUE;
                } else {
                    var int itmPtr; itmPtr = l.data;
                    const int call = 0;
                    const int oCMobContainer__Remove = 6831936; //0x683F40
                    if (CALL_Begin(call)) {
                        CALL_IntParam(_@(TRUE));
                        CALL_PtrParam(_@(itmPtr));
                        CALL_PutRetValTo(_@(itmPtr));
                        CALL__thiscall(_@(vobPtr), oCMobContainer__Remove);
                        call = CALL_End();
                    };
                    removed = (itmPtr == 0);
                };
                break;
            };
        };
    end;
    return removed;
};

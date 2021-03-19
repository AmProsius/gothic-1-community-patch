/*
 * Check if an item exists anywhere
 */
func int G1CP_IsItemInstantiated(var string name) {
    // MEM_SearchVobByName need upper case
    name = STR_Upper(name);

    // Check if physically in world (fast hash table search)
    if (MEM_SearchVobByName(name)) {
        return TRUE;
    };

    // Get instance ID
    var int id; id = MEM_GetSymbolIndex(name);

    // Check if in inventory or container
    var int found; found = FALSE;
    var int list; list = MEM_World.voblist;
    var zCListSort l;
    while((list) && (!found));
        l = _^(list);
        if (Hlp_Is_oCNpc(l.data)) {
            var C_NPC npc; npc = _^(l.data);
            found = Npc_HasItems(npc, id);
        } else if (Hlp_Is_oCMobContainer(l.data)) {
            var int vobPtr; vobPtr = l.data;
            const int oCMobContainer__IsIn = 6833040; //0x684390
            const int call = 0;
            if (CALL_Begin(call)) {
                CALL_PtrParam(_@(id));
                CALL_PutRetValTo(_@(found));
                CALL__thiscall(_@(vobPtr), oCMobContainer__IsIn);
                call = CALL_End();
            };
        };
        list = l.next;
    end;
    return found;
};

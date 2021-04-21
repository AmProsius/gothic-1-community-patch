/*
 * #2 NPCs don't use doors properly
 */
func int G1CP_002_NpcMoveDoor() {
    if (MEM_GetSymbolIndex("B_MoveMob") != -1) {
        HookDaedalusFuncS("B_MoveMob", "G1CP_002_NpcMoveDoor_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the NPC state to introduce more conditions
 */
func void G1CP_002_NpcMoveDoor_Hook() {
    G1CP_ReportFuncToSpy();

    // Call original function
    ContinueCall();

    // Detach the NPC from the door
    var string door; door = Npc_GetDetectedMob(self);
    if (Hlp_StrCmp(door, "DOOR")) {                  // Is only called for doors anyway
        if (Wld_GetMobState(self, door) == 0) {      // Door is closed
            AI_UseMob(self, door,  1);               // Just to be safe
            AI_UseMob(self, door, -1);               // Actual fix
            G1CP_NpcSetAiVar(self, "AIV_MOVINGMOB", 0); // Prevent starting 'ZS_WaitForPassage'
        };
    };
};

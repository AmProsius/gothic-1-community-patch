/*
 * #2 NPCs don't use doors properly
 */
func void Ninja_G1CP_002_FixDoor() {
    HookDaedalusFuncS("B_MoveMob", "Ninja_G1CP_002_FixDoor_Hook");
};

/*
 * This function intercepts the NPC state to introduce more conditions
 */
func void Ninja_G1CP_002_FixDoor_Hook() {
    // Call original function
    ContinueCall();

    // Detach the NPC from the door
    var string door; door = Npc_GetDetectedMob(self);
    if (Hlp_StrCmp(door, "DOOR")) {                                             // Is only called for doors anyway
        if (Wld_GetMobState(self, door) == 0)                                   // Door is closed
        && (Ninja_G1CP_GetAIVar(Hlp_GetInstanceID(self), "AIV_MOVINGMOB", 1)) { // AI-var was set to 1 or does not exist
            AI_UseMob(self, door,  1);                                          // Just to be safe
            AI_UseMob(self, door, -1);                                          // Actual fix
            AI_ContinueRoutine(self);                                           // Continue to walk through the door
        };
    };
};

/*
 * #9 NPCs freeze when fleeing
 */
func int G1CP_009_NpcStateFlee() {
    const int AI_Wait_popped = 6644536; //0x656338

    if (MEM_FindParserSymbol("ZS_Flee_Loop") != -1)
    && (G1CP_CheckBytes(AI_Wait_popped, "8B F8 83 C4") == 1) {
        HookDaedalusFuncS("ZS_Flee_Loop", "G1CP_009_NpcStateFlee_Hook");

        MemoryProtectionOverride(AI_Wait_popped, 4);

        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the NPC state to introduce more conditions
 */
func int G1CP_009_NpcStateFlee_Hook() {
    G1CP_ReportFuncToSpy();

    const int AI_Wait_popped = 6644536; //0x656338
    const int orig = 3296983179; /*8B F8 83 C4*/
    const int newb = 3296984881; /*31 FF 83 C4*/

    // Temporarily disable AI_Wait
    if (MEM_ReadInt(AI_Wait_popped) == orig) {
        MEM_WriteInt(AI_Wait_popped, newb);
    };

    // Call the original function (There might be other important changes that we do not want to overwrite!)
    ContinueCall();
    var int ret; ret = MEM_PopIntResult();

    // Re-enable the AI_Wait
    if (MEM_ReadInt(AI_Wait_popped) == newb) {
        MEM_WriteInt(AI_Wait_popped, orig);
    };

    // Return original return value
    return ret;
};

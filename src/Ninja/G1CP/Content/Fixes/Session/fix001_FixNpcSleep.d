/*
 * #1 NPCs wake up immediately
 */
func int Ninja_G1CP_001_FixNpcSleep() {
    const int AI_StartState_popped = 6627839; //0x6521FF

    if (MEM_FindParserSymbol("ZS_SleepBed_Loop") != -1)
    && (Ninja_G1CP_CheckBytes(AI_StartState_popped, "8B E8 83 C4 14")) {
        HookDaedalusFuncS("ZS_SleepBed_Loop", "Ninja_G1CP_001_FixNpcSleep_Hook");

        // Create empty hook (if there is a problem, rather fail now than later during the game)
        if (!IsHooked(AI_StartState_popped)) {
            HookEngineF(AI_StartState_popped, 5, Ninja_G1CP_001_FixNpcSleep_StateHook);
            RemoveHookF(AI_StartState_popped, 0, Ninja_G1CP_001_FixNpcSleep_StateHook);
        };
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the NPC state to introduce more conditions
 */
func int Ninja_G1CP_001_FixNpcSleep_Hook() {
    Ninja_G1CP_ReportFuncToSpy();

    const int AI_StartState_popped = 6627839; //0x6521FF
    // Changing the condition to start the ZS_SitAround is not easily possible with completely overwriting the function
    // Overwriting the function should be avoided, because that would remove any additional changes from someone else
    // Instead we will intercept AI_StartState and return if ZS_SitAround is to be started but our conditions fail

    // Temporarily hook AI_StartState
    HookEngineF(AI_StartState_popped, 5, Ninja_G1CP_001_FixNpcSleep_StateHook);

    // Call original function
    ContinueCall();
    var int ret; ret = MEM_PopIntResult();

    // Remove hook again (only remove function but leave changes in engine for performance)
    RemoveHookF(AI_StartState_popped, 0, Ninja_G1CP_001_FixNpcSleep_StateHook);

    // Return original return value
    return ret;
};

/*
 * This function hooks AI_StartState (temporarily, see above) and aborts if certain conditions are met
 * EAX is the address of the NPC. If not valid, AI_StartState is aborted
 */
func void Ninja_G1CP_001_FixNpcSleep_StateHook() {
    Ninja_G1CP_ReportFuncToSpy();

    // Create potentially missing symbols locally
    const int BS_FLAG_INTERRUPTABLE    = 32768;
    const int BS_MOBINTERACT_INTERRUPT = 16 | BS_FLAG_INTERRUPTABLE;

    // Check for valid ZS-function
    var int funcId; funcId = MEM_ReadInt(ESP+40);
    if (funcId < 0) || (funcId > currSymbolTableLength) {
        return;
    };

    // Check if it is ZS_SitAround that is about to be started
    var zCPar_symbol symb; symb = _^(MEM_GetSymbolByIndex(funcId));
    if (!Hlp_StrCmp(symb.name, "ZS_SitAround")) {
        return;
    };

    // Make sure the NPC is valid
    if (!Hlp_Is_oCNpc(EAX)) {
        return;
    };

    // If our conditions are not met, abort AI_StartState
    var C_Npc slf; slf = _^(EAX);
    if (Ninja_G1CP_BodyStateContains(slf, BS_MOBINTERACT_INTERRUPT)) {
        EAX = 0; // Terminate AI_StartState
    };
};

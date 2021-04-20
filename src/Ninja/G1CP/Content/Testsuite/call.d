/*
 * Call a function and save the context
 */
func void G1CP_Testsuite_Call(var int funcId, var int slf, var int oth, var int interruptPC) {
    // Backup global instances
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);
    var C_Npc vicBak; vicBak = MEM_CpyInst(victim);
    var C_Npc itmBak; itmBak = MEM_CpyInst(item);

    // Set self and other for the function
    if (slf) {
        self  = MEM_CpyInst(slf);
    } else {
        self  = MEM_CpyInst(hero);
    };
    if (oth) {
        other = MEM_CpyInst(oth);
    } else {
        other = MEM_CpyInst(hero);
    };

    // Call the function
    MEM_CallById(funcId);

    // Revert global instances
    item = MEM_CpyInst(itmBak);
    victim = MEM_CpyInst(vicBak);
    other = MEM_CpyInst(othBak);
    self = MEM_CpyInst(slfBak);

    // Optionally reset the PC (e.g. to stop any output units)
    if (interruptPC) {
        Npc_ClearAIQueue(hero);
        AI_StandUpQuick(hero);
    };
};

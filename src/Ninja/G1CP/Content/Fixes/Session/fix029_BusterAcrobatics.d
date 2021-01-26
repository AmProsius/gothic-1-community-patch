/*
 * #29 Buster trains Acrobatics multiple times
 */
func void Ninja_G1CP_029_BusterAcrobatics() {
    HookDaedalusFuncS("DIA_ORG_833_Buster3_Condition", "Ninja_G1CP_029_BusterAcrobatics_Hook");
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int Ninja_G1CP_029_BusterAcrobatics_Hook() {
    // Add the new condition (other conditions remain untouched)
    var int symbPtr; symbPtr = MEM_GetSymbol("NPC_TALENT_ACROBAT");
    if (symbPtr) {
        var int NPC_TALENT_ACROBAT; NPC_TALENT_ACROBAT = MEM_ReadInt(symbPtr + zCParSymbol_content_offset);
        if (Npc_GetTalentSkill(hero, NPC_TALENT_ACROBAT) != 0) {
            return FALSE;
        };
    };

    // Continue with the original function
    ContinueCall();
};

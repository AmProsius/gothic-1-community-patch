/*
 * #39 Fingers teaches advanced skills too soon
 */
func void G1CP_Test_0039() {
    const string instr[3] = {
        "The hero is teleported to Fingers and the teaching dialog is unlocked.",
        "Learn all the skills and check if each dialog choice appears according to the player's skill.",
        "Expected behavior: Fingers's available dialog choices should not appear before learning each prior."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckDialogFunc("DIA_Fingers_Lehrer_Info");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("STT_331_Fingers");
    var int varId; varId = G1CP_Testsuite_CheckIntVar("Fingers_CanTeach");

    // Add enough learning points and sneaking skill (prerequisite for pickpocket skill)
    const int NPC_TALENT_SNEAK = 0; NPC_TALENT_SNEAK = G1CP_GetIntConst("NPC_TALENT_SNEAK", 8);
    Npc_SetTalentSkill(hero, NPC_TALENT_SNEAK, 1);
    hero.LP = 90;

    // Set unlock the dialog
    G1CP_SetIntVarI(varId, 0, TRUE);
    AI_Teleport(hero, npc.wp);
};

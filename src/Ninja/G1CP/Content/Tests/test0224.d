/*
 * #224 Exploit: Undead orc priest can die from fall damage
 */
func void G1CP_Test_0224() {
    const string instr[5] = {
        "The hero is teleported to the orc temple close to the cliff to trigger the dialog with the last orc priest.",
        "Wait for the dialog to trigger and for the orc priest to fall off the cliff. Wait for the damage debug info.",
        "Run the test again to teleport the hero out of range which despawns the orc priest.",
        "Run back over the bridge to check if the orc priest is alive on his waypoint.",
        "Expected behavior: Grash-Varrag-Arushat doesn't die from fall damage and re-spawns alive when returning."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_ORCTEMPEL);
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("Info_HighPriest5");
    var zCVob npc; npc = G1CP_Testsuite_FindNpc("ORC_Priest_5");
    G1CP_Testsuite_CheckAiState("ZS_Talk");

    // Set PC to invincible to not be bothered by the fanatic templars in front of the bridge
    const int NPC_FLAG_IMMORTAL = 1 << 1;
    hero.flags = hero.flags | NPC_FLAG_IMMORTAL;

    // If out of spawn range or dialog hasn't triggered yet, lure the NPC
    if (!npc.homeWorld) || (!Npc_KnowsInfo(hero, infoId)) || (Npc_GetDistToWP(hero, "TPL_299") < 500) {
        G1CP_SetInfoToldI(infoId, FALSE); // Initially reset the dialog
        G1CP_Testsuite_NpcBeamTo(hero, "TPL_299"); // Spawn the orc priest from safe distance
        AI_WaitMS(hero, 500); // Allow time for character initialization
        AI_Function_NI(hero, G1CP_Test_0224_TriggerDialog, npc, infoId);
    } else {
        G1CP_Testsuite_NpcBeamTo(hero, "TPL_291"); // Far enough to despawn the NPC
        AI_WaitMS(hero, 500); // Give time to despawn
        AI_Teleport(hero, "TPL_299"); // Close enough to check the NPC (use teleport for AI queue)
    };
};

func void G1CP_Test_0224_TriggerDialog(var C_Npc slf, var int infoId) {
    G1CP_Testsuite_NpcBeamToPosF(hero, 12968, -600, 22000); // Lure NPC into abyss
    AI_Dodge(hero); // Make sure to step back into the cliff
    Npc_ClearAIQueue(slf);
    AI_StandUpQuick(slf);

    // AI_StartState(slf, ZS_Talk, 0, "");
    MEM_PushInstParam(slf);
    MEM_PushIntParam(MEM_GetSymbolIndex("ZS_Talk")); // Cannot re-push function correctly
    MEM_PushIntParam(0);
    MEM_PushStringParam("");
    MEM_Call(AI_StartState);
};

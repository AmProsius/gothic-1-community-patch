/*
 * #25 Saturas sells High Robe twice
 *
 * The hero is given the heavy robe and the KDW guild and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int Ninja_G1CP_Test_025() {
    // Check status of the test
    var int passed; passed = TRUE;

    // Find the dialog condition function
    var int funcId; funcId = MEM_FindParserSymbol("KDW_600_Saturas_HEAVYARMOR_Condition");
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Original dialog not found");
        passed = FALSE;
    };

    // Find Saturas
    var int symbId; symbId = MEM_FindParserSymbol("KDW_600_Saturas");
    if (symbId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("NPC 'KDW_600_Saturas' not found");
        passed = FALSE;
    };

    // Check if Saturas exists in the world
    var C_Npc saturas; saturas = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(saturas)) {
        Ninja_G1CP_TestsuiteErrorDetail("'KDW_600_Saturas' is not a valid NPC");
        passed = FALSE;
    };

    // Find the symbol
    var int robeId; robeId = MEM_FindParserSymbol("KDW_ARMOR_H");
    if (robeId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Item 'KDW_ARMOR_H' not found");
        passed = FALSE;
    };

    // Find the guild
    var int symbPtr; symbPtr = MEM_GetSymbol("GIL_KDW");
    if (!symbPtr) {
        Ninja_G1CP_TestsuiteErrorDetail("Variable 'GIL_KDW' not found");
        passed = FALSE;
    };

    // Obtain guild value
    var int GIL_KDW; GIL_KDW = MEM_ReadInt(symbPtr + zCParSymbol_content_offset);

    // Backup hero guild
    var int guildBak; guildBak = hero.guild;
    var int guildTrueBak; guildTrueBak = Npc_GetTrueGuild(hero);

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Set guild
    Npc_SetTrueGuild(hero, GIL_KDW);
    hero.guild = GIL_KDW;

    // Give the robe to the hero
    CreateInvItem(hero, robeId);

    // Backup self and other
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set self and other
    self  = MEM_CpyInst(saturas);
    other = MEM_CpyInst(hero);

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore self and other
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Remove the robe again
    Npc_RemoveInvItems(hero, robeId, 1);

    // Restore guild
    Npc_SetTrueGuild(hero, guildTrueBak);
    hero.guild = guildBak;

    // Check return value
    if (ret) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};

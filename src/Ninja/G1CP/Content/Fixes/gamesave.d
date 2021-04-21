/*
 * Place hooks for applying and reverting game save sensitive fixes
 */
func int G1CP_HookGameSaveFixes() {
    const int oCSavegameManager__ClearCurrent_ot = 4415800; //0x436138
    const int CGameManager__Write_Savegame_valid = 4360128; //0x4287C0

    if (G1CP_CheckBytes(oCGame__changeLevel, "6A FF 68 BE 66 7B 00"))
    && (G1CP_CheckBytes(oCSavegameManager__ClearCurrent_ot, "8B 0D 94 96 86 00"))
    && (G1CP_CheckBytes(CGameManager__Write_Savegame_valid, "8B 4D 20 53 56"))
    && (G1CP_CheckBytes(oCSavegameManager__SetAndWriteSavegame, "8D 04 88 8B 08")) {
        HookEngineF(oCGame__changeLevel, 7, G1CP_GamesaveFixes_Revert);                   // Revert on levelchange
        HookEngineF(oCSavegameManager__ClearCurrent_ot, 6, G1CP_GamesaveFixes_Revert);    // Revert on loading
        HookEngineF(CGameManager__Write_Savegame_valid, 5, G1CP_GamesaveFixes_Revert);    // Revert before saving
        HookEngineF(oCSavegameManager__SetAndWriteSavegame, 5, G1CP_GamesaveFixes_Apply); // Re-apply after saving
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * Apply all game save sensitive fixes
 */
func void G1CP_GamesaveFixes_Apply() {
    if (G1CP_InitStart()) {                             // Maximum fix function name length: 45 characters
        G1CP_037_LogEntryGravoMerchant();               // #37
        G1CP_045_SpawnSnappersMonastery();              // #45
        G1CP_046_SmithDoor();                           // #46
        G1CP_050_Pillar();                              // #50
        G1CP_051_StonehengeCryptChest();                // #51
        G1CP_052_UseWithItemNcGrindstone();             // #52
        G1CP_055_ReactivateInExtremo();                 // #55
        G1CP_093_DE_LogEntryHoratio();                  // #93
        G1CP_121_DE_LogTopicShrikeHut();                // #121
        G1CP_124_GateGuardId();                         // #124
        G1CP_133_DE_LogEntryScatty();                   // #133
        G1CP_143_DE_LogEntryBuster();                   // #143
        G1CP_193_GateSwitchesStuck();                   // #193
        G1CP_203_LogEntryGrahamMerchant();              // #203
        G1CP_205_LogEntryWolfMerchant();                // #205
        G1CP_212_UseWithItemNcCauldron1();              // #212
        G1CP_213_UseWithItemNcCauldron2();              // #213
    };
};

/*
 * Revert all game save sensitive fixes
 */
func void G1CP_GamesaveFixes_Revert() {
    if (G1CP_InitStart()) {                             // Maximum fix function name length: 45 characters
        G1CP_037_LogEntryGravoMerchantRevert();         // #37
        G1CP_045_SpawnSnappersMonasteryRevert();        // #45
        G1CP_046_SmithDoorRevert();                     // #46
        G1CP_050_PillarRevert();                        // #50
        G1CP_051_StonehengeCryptChestRevert();          // #51
        G1CP_052_UseWithItemNcGrindstoneRevert();       // #52
        G1CP_055_ReactivateInExtremoRevert();           // #55
        G1CP_093_DE_LogEntryHoratioRevert();            // #93
        G1CP_121_DE_LogTopicShrikeHutRevert();          // #121
        G1CP_124_GateGuardIdRevert();                   // #124
        G1CP_133_DE_LogEntryScattyRevert();             // #133
        G1CP_143_DE_LogEntryBusterRevert();             // #143
        G1CP_193_GateSwitchesStuckRevert();             // #193
        G1CP_203_LogEntryGrahamMerchantRevert();        // #203
        G1CP_205_LogEntryWolfMerchantRevert();          // #205
        G1CP_212_UseWithItemNcCauldron1Revert();        // #212
        G1CP_213_UseWithItemNcCauldron2Revert();        // #213
    };
};

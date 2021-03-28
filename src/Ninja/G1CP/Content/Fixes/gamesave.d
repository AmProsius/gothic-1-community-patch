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
        G1CP_046_SmithDoor();                           // #46
        G1CP_050_Pillar();                              // #50
        G1CP_052_UseWithItemNCGrindstone();             // #52
        G1CP_093_DE_LogEntryHoratio();                  // #93
        G1CP_121_DE_LogTopicShrikeHut();                // #121
        G1CP_124_GateGuardID();                         // #124
    };
};

/*
 * Revert all game save sensitive fixes
 */
func void G1CP_GamesaveFixes_Revert() {
    if (G1CP_InitStart()) {                             // Maximum fix function name length: 45 characters
        G1CP_037_LogEntryGravoMerchantRevert();         // #37
        G1CP_046_SmithDoorRevert();                     // #46
        G1CP_050_PillarRevert();                        // #50
        G1CP_052_UseWithItemNCGrindstoneRevert();       // #52
        G1CP_093_DE_LogEntryHoratioRevert();            // #93
        G1CP_121_DE_LogTopicShrikeHutRevert();          // #121
        G1CP_124_GateGuardIDRevert();                   // #124
    };
};

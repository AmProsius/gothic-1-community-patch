/*
 * Place hooks for applying and reverting game save sensitive fixes
 */
func int Ninja_G1CP_HookGameSaveFixes() {
    const int oCSavegameManager__ClearCurrent_ot = 4415800; //0x436138
    const int CGameManager__Write_Savegame_valid = 4360128; //0x4287C0

    if (Ninja_G1CP_IsMemAvail(oCGame__changeLevel, "6A FF 68 BE 66 7B 00"))
    && (Ninja_G1CP_IsMemAvail(oCSavegameManager__ClearCurrent_ot, "8B 0D 94 96 86 00"))
    && (Ninja_G1CP_IsMemAvail(CGameManager__Write_Savegame_valid, "8B 4D 20 53 56"))
    && (Ninja_G1CP_IsMemAvail(oCSavegameManager__SetAndWriteSavegame, "8D 04 88 8B 08")) {
        HookEngineF(oCGame__changeLevel, 7, Ninja_G1CP_GamesaveFixes_Revert);                   // Revert on levelchange
        HookEngineF(oCSavegameManager__ClearCurrent_ot, 6, Ninja_G1CP_GamesaveFixes_Revert);    // Revert on loading
        HookEngineF(CGameManager__Write_Savegame_valid, 5, Ninja_G1CP_GamesaveFixes_Revert);    // Revert before saving
        HookEngineF(oCSavegameManager__SetAndWriteSavegame, 5, Ninja_G1CP_GamesaveFixes_Apply); // Re-apply after saving
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * Apply all game save sensitive fixes
 */
func void Ninja_G1CP_GamesaveFixes_Apply() {
    Ninja_G1CP_InitStart();
    Ninja_G1CP_046_SmithDoor();
    Ninja_G1CP_050_Pillar();
    Ninja_G1CP_124_GateGuardID();
    Ninja_G1CP_InitEnd();
};

/*
 * Revert all game save sensitive fixes
 */
func void Ninja_G1CP_GamesaveFixes_Revert() {
    Ninja_G1CP_InitStart();
    Ninja_G1CP_046_SmithDoorRevert();
    Ninja_G1CP_050_PillarRevert();
    Ninja_G1CP_124_GateGuardIDRevert();
    Ninja_G1CP_InitEnd();
};

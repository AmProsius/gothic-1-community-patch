/*
 * Place hooks for applying and reverting game save sensitive fixes
 */
func void Ninja_G1CP_HookGameSaveFixes() {
    const int CGameManager__Write_Savegame_valid = 4360128; //0x4287C0
    HookEngineF(oCGame__changeLevel, 7, Ninja_G1CP_GamesaveFixes_Revert);                 // Revert on level change
    HookEngineF(CGameManager__Write_Savegame_valid, 5, Ninja_G1CP_GamesaveFixes_Revert);  // Revert on saving onset
    HookEngineF(oCSavegameManager__SetAndWriteSavegame, 5, Ninja_G1CP_GamesaveFixes_Add); // Re-add on saving offset
};

/*
 * Apply all game save sensitive fixes
 */
func void Ninja_G1CP_GamesaveFixes_Add() {
    Ninja_G1CP_050_Pillar();
};

/*
 * Revert all game save sensitive fixes
 */
func void Ninja_G1CP_GamesaveFixes_Revert() {
    Ninja_G1CP_050_Revert();
};

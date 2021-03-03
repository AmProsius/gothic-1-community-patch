/*
 * Menu initialization function called by Ninja every time a menu is opened
 */
func void Ninja_G1CP_Menu(var int menuPtr) {
    // Initialize one-time-per-session fixes
    if (Ninja_G1CP_InitStart()) {
        Ninja_G1CP_MenuVersionNumber();
        Ninja_G1CP_TestSuite();
        Ninja_G1CP_AppliedInit();
        Ninja_G1CP_HookGameSaveFixes();
        Ninja_G1CP_001_FixNpcSleep();                                   // #1
        Ninja_G1CP_002_FixDoor();                                       // #2
        Ninja_G1CP_003_RegainDroppedWeapon();                           // #3
        Ninja_G1CP_007_PracticeSwordWithWeapon();                       // #7
        Ninja_G1CP_009_FixFlee();                                       // #9
        Ninja_G1CP_010_FollowWalkMode();                                // #10
        Ninja_G1CP_011_PassGuardsCombatMode();                          // #11
        Ninja_G1CP_012_RangedDoubleXP();                                // #12
        Ninja_G1CP_015_HoratioStrength();                               // #15
        Ninja_G1CP_016_ThorusBribeDialog();                             // #16
        Ninja_G1CP_017_JackalProtectionMoney();                         // #17
        Ninja_G1CP_018_BloodwynProtectionMoney();                       // #18
        Ninja_G1CP_019_ScorpioFightDialog();                            // #19
        Ninja_G1CP_020_KirgoGivesBeer();                                // #20
        Ninja_G1CP_021_FletcherClosedQuest();                           // #21
        Ninja_G1CP_022_YBerionAttacks();                                // #22
        Ninja_G1CP_024_CorKalomWrongQuest();                            // #24
        Ninja_G1CP_025_SaturasSellsRobe();                              // #25
        Ninja_G1CP_026_LaresGuardAttacks();                             // #26
        Ninja_G1CP_027_DraxTeachingDialog();                            // #27
        Ninja_G1CP_028_MordragNoEscort();                               // #28
        Ninja_G1CP_029_BusterAcrobatics();                              // #29
        Ninja_G1CP_030_SilasTrade();                                    // #30
        Ninja_G1CP_031_WolfPlateDialog();                               // #31
        Ninja_G1CP_036_FiskFenceQuest();                                // #36
        Ninja_G1CP_038_SnafDialogNek();                                 // #38
        Ninja_G1CP_039_FingersTeachDialog();                            // #39
        Ninja_G1CP_040_AlephKeyDialog();                                // #40
        Ninja_G1CP_042_GuardExitDialog();                               // #42
        Ninja_G1CP_043_EN_SkillMissingWhitespace();                     // #43
        Ninja_G1CP_044_BugmeatCategory();                               // #44
        Ninja_G1CP_049_DungeonKeyText();                                // #49
        Ninja_G1CP_059_FixEquipBestWeapons();                           // #59
        Ninja_G1CP_060_JesseQuest();                                    // #60
        Ninja_G1CP_078_HumanAttackOrc();                                // #78
        Ninja_G1CP_079_WolfDexDialog();                                 // #79
        Ninja_G1CP_102_JesseProtectionMoneyPay();                       // #102
        Ninja_G1CP_109_BloodwynProtectionMoneyPayLater();               // #109
        Ninja_G1CP_111_JackalProtectionMoneyPay();                      // #111
        Ninja_G1CP_112_JackalProtectionMoneyPayLater();                 // #112
        Ninja_G1CP_122_CavalornDailyRoutine();                          // #122
        Ninja_G1CP_125_ButcherText();                                   // #125
        Ninja_G1CP_126_SharkyTrade();                                   // #126
        Ninja_G1CP_136_FollowLadder();                                  // #136
        Ninja_G1CP_157_SpeedPotion2Value();                             // #157
        Ninja_G1CP_InitEnd();
    };
};


/*
 * Initialization function called by Ninja after "Init_Global" (G2) / "Init_<Levelname>" (G1)
 */
func void Ninja_G1CP_Init() {
    // Wrapper for "LeGo_Init" to ensure correct LeGo initialization without breaking the mod
    LeGo_MergeFlags(LeGo_ConsoleCommands | LeGo_AI_Function);

    // Re-initialize game save fixes
    Ninja_G1CP_GamesaveFixes_Apply();

};

/*
 * Menu initialization function called by Ninja every time a menu is opened
 */
func void Ninja_G1CP_Menu(var int menuPtr) {
    // Initialize one-time-per-session fixes
    if (G1CP_InitStart()) {                             // Maximum fix function name length: 45 characters
        G1CP_MenuVersionNumber();
        G1CP_InitLookupTable();
        G1CP_ReadDisabledFixesIni();
        G1CP_TestSuite();
        G1CP_FixStatusInit();
        G1CP_HookGameSaveFixes();
        G1CP_001_NpcStateSleep();                       // #1
        G1CP_002_NpcMoveDoor();                         // #2
        G1CP_003_RegainDroppedWeapon();                 // #3
        G1CP_007_PracticeSwordWithWeapon();             // #7
        G1CP_009_NpcStateFlee();                        // #9
        G1CP_010_FollowWalkMode();                      // #10
        G1CP_011_PassGuardsCombatMode();                // #11
        G1CP_012_RangedDoubleXP();                      // #12
        G1CP_015_HoratioStrength();                     // #15
        G1CP_016_ThorusBribeDialog();                   // #16
        G1CP_017_JackalProtectionMoney();               // #17
        G1CP_018_BloodwynProtectionMoney();             // #18
        G1CP_019_ScorpioFightDialog();                  // #19
        G1CP_020_KirgoGivesBeer();                      // #20
        G1CP_021_FletcherClosedQuest();                 // #21
        G1CP_022_YBerionAttacks();                      // #22
        G1CP_024_CorKalomWrongQuest();                  // #24
        G1CP_025_SaturasSellsRobe();                    // #25
        G1CP_026_LaresGuardAttacks();                   // #26
        G1CP_027_DraxTeachingDialog();                  // #27
        G1CP_028_MordragNoEscort();                     // #28
        G1CP_029_BusterAcrobatics();                    // #29
        G1CP_030_SilasTrade();                          // #30
        G1CP_031_WolfPlateDialog();                     // #31
        G1CP_032_GornAttackFreeMine();                  // #32
        G1CP_033_ShrikeQuestDialog();                   // #33
        G1CP_036_FiskFenceQuest();                      // #36
        G1CP_038_SnafDialogNek();                       // #38
        G1CP_039_FingersTeachDialog();                  // #39
        G1CP_040_AlephKeyDialog();                      // #40
        G1CP_042_GuardExitDialog();                     // #42
        G1CP_043_EN_SkillMissingWhitespace();           // #43
        G1CP_044_BugmeatCategory();                     // #44
        G1CP_049_DungeonKeyText();                      // #49
        G1CP_059_NpcEquipBestWeapons();                 // #59
        G1CP_060_JesseQuest();                          // #60
        G1CP_078_HumanAttackOrc();                      // #78
        G1CP_079_WolfDexDialog();                       // #79
        G1CP_091_DE_HoratioAddChoiceAvenge();           // #91
        G1CP_094_DE_HoratioInfoDescThoughtStr();        // #94
        G1CP_102_JesseProtectionMoneyPay();             // #102
        G1CP_109_BloodwynProtectionMoneyPayLater();     // #109
        G1CP_111_JackalProtectionMoneyPay();            // #111
        G1CP_112_JackalProtectionMoneyPayLater();       // #112
        G1CP_122_CavalornDailyRoutine();                // #122
        G1CP_125_ButcherText();                         // #125
        G1CP_126_SharkyTrade();                         // #126
        G1CP_136_FollowLadder();                        // #136
        G1CP_142_TemplarVIPDialog();                    // #142
        G1CP_144_DE_GomezArmorName();                   // #144
        G1CP_145_DE_LightMercenarysArmorName();         // #145
        G1CP_146_DE_NovicesLoinclothName();             // #146
        G1CP_147_DE_CrawlerPlateArmorName();            // #147
        G1CP_148_DE_AncientOreArmorName();              // #148
        G1CP_149_DE_EN_ImprovedOreArmorName();          // #149
        G1CP_157_SpeedPotion2Value();                   // #157
        G1CP_158_SpeedPotion3Value();                   // #158
        G1CP_163_CastleGate();                          // #163
        G1CP_172_DE_KalomsRecipeName();                 // #172
        G1CP_173_DE_GomezKeyText();                     // #173
        G1CP_174_EN_GomezKeyName();                     // #174
        G1CP_175_EN_RiceLordKeyName();                  // #175
        G1CP_192_MagicUserAutoEquip();                  // #192
        G1CP_200_DE_ImprovedOreArmorText();             // #200
        G1CP_201_DE_AncientOreArmorText();              // #201
        G1CP_214_GrahamDailyRoutine();                  // #214
    };
};


/*
 * Initialization function called by Ninja after "Init_Global" (G2) / "Init_<Levelname>" (G1)
 */
func void Ninja_G1CP_Init() {
    // Wrapper for "LeGo_Init" to ensure correct LeGo initialization without breaking the mod
    LeGo_MergeFlags(LeGo_ConsoleCommands | LeGo_AI_Function);

    // Re-initialize game save fixes
    if (IsHookF(oCSavegameManager__SetAndWriteSavegame, G1CP_GamesaveFixes_Apply)) {
        G1CP_GamesaveFixes_Apply();
    };
};

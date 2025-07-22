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
        G1CP_0001_NpcStateSleep();                      // #1
        G1CP_0002_NpcMoveDoor();                        // #2
        G1CP_0003_RegainDroppedWeapon();                // #3
        G1CP_0004_NpcMoveNpcDefeated();                 // #4
        G1CP_0007_PracticeSwordWithWeapon();            // #7
        G1CP_0009_NpcStateFlee();                       // #9
        G1CP_0010_FollowWalkMode();                     // #10
        G1CP_0011_PassGuardsCombatMode();               // #11
        G1CP_0012_RangedDoubleXP();                     // #12
        G1CP_0014_PortalCancelFight();                  // #14
        G1CP_0015_HoratioStrength();                    // #15
        G1CP_0016_ThorusBribeDialog();                  // #16
        G1CP_0017_JackalProtectionMoney();              // #17
        G1CP_0018_BloodwynProtectionMoney();            // #18
        G1CP_0019_ScorpioFightDialog();                 // #19
        G1CP_0020_KirgoGivesBeer();                     // #20
        G1CP_0021_FletcherClosedQuest();                // #21
        G1CP_0022_YBerionAttacks();                     // #22
        G1CP_0023_BaalNamibSellArmor();                 // #23
        G1CP_0024_CorKalomWrongQuest();                 // #24
        G1CP_0025_SaturasSellsRobe();                   // #25
        G1CP_0026_LaresGuardAttacks();                  // #26
        G1CP_0027_DraxTeachingDialog();                 // #27
        G1CP_0028_MordragNoEscort();                    // #28
        G1CP_0029_BusterAcrobatics();                   // #29
        G1CP_0030_SilasTrade();                         // #30
        G1CP_0031_WolfPlateDialog();                    // #31
        G1CP_0032_GornAttackFreeMine();                 // #32
        G1CP_0033_ShrikeQuestDialog();                  // #33
        G1CP_0036_FiskFenceQuest();                     // #36
        G1CP_0038_SnafDialogNek();                      // #38
        G1CP_0039_FingersTeachDialog();                 // #39
        G1CP_0040_AlephKeyDialog();                     // #40
        G1CP_0042_GuardExitDialog();                    // #42
        G1CP_0043_EN_SkillMissingWhitespace();          // #43
        G1CP_0044_BugmeatCategory();                    // #44
        G1CP_0049_DungeonKeyText();                     // #49
        G1CP_0058_BlockFall();                          // #58
        G1CP_0059_NpcEquipBestWeapons();                // #59
        G1CP_0060_JesseQuest();                         // #60
        G1CP_0078_HumanAttackOrc();                     // #78
        G1CP_0079_WolfDexDialog();                      // #79
        G1CP_0091_DE_HoratioAddChoiceAvenge();          // #91
        G1CP_0092_DE_HoratioAddChoiceWipeOut();         // #92
        G1CP_0094_DE_HoratioInfoDescThoughtStr();       // #94
        G1CP_0102_JesseProtectionMoneyPay();            // #102
        G1CP_0109_BloodwynProtectionMoneyPayLater();    // #109
        G1CP_0110_MobInteractCamera();                  // #110
        G1CP_0111_JackalProtectionMoneyPay();           // #111
        G1CP_0112_JackalProtectionMoneyPayLater();      // #112
        G1CP_0115_KillSittingDuck();                    // #115
        G1CP_0122_CavalornDailyRoutine();               // #122
        G1CP_0124_GateGuardId();                        // #124
        G1CP_0125_ButcherText();                        // #125
        G1CP_0126_SharkyTrade();                        // #126
        G1CP_0128_GuardExitDialog();                    // #128
        G1CP_0129_DrakeBodySkin();                      // #129
        G1CP_0136_FollowLadder();                       // #136
        G1CP_0142_TemplarVIPDialog();                   // #142
        G1CP_0144_DE_GomezArmorName();                  // #144
        G1CP_0145_DE_LightMercenarysArmorName();        // #145
        G1CP_0146_DE_NovicesLoinclothName();            // #146
        G1CP_0147_DE_CrawlerPlateArmorName();           // #147
        G1CP_0148_DE_AncientOreArmorName();             // #148
        G1CP_0149_DE_EN_ImprovedOreArmorName();         // #149
        G1CP_0152_EN_ProtectionOfFireDescription();     // #152
        G1CP_0157_SpeedPotion2Value();                  // #157
        G1CP_0158_SpeedPotion3Value();                  // #158
        G1CP_0163_CastleGate();                         // #163
        G1CP_0166_RogueWeedDialog();                    // #166
        G1CP_0168_GorNaBarBecomeTemplar();              // #168
        G1CP_0172_DE_KalomsRecipeName();                // #172
        G1CP_0173_DE_GomezKeyText();                    // #173
        G1CP_0174_EN_GomezKeyName();                    // #174
        G1CP_0175_EN_RiceLordKeyName();                 // #175
        G1CP_0176_InvItemTextValue();                   // #176
        G1CP_0181_SwineyGiveArmor();                    // #181
        G1CP_0182_GuardDialogDusty();                   // #182
        G1CP_0183_CorristoSellsRobe();                  // #183
        G1CP_0184_BartholoWeedExploit();                // #184
        G1CP_0185_ScorpioCrossbow();                    // #185
        G1CP_0186_CorristoJoinMages();                  // #186
        G1CP_0188_CorKalomWeedExploit();                // #188
        G1CP_0191_CordOneHanded();                      // #191
        G1CP_0192_MagicUserAutoEquip();                 // #192
        G1CP_0194_TakeOpponentWeapon();                 // #194
        G1CP_0197_TemplarCampDialog();                  // #197
        G1CP_0200_DE_ImprovedOreArmorText();            // #200
        G1CP_0201_DE_AncientOreArmorText();             // #201
        G1CP_0204_LogEntryCavalornTutor();              // #204
        G1CP_0214_GrahamDailyRoutine();                 // #214
        G1CP_0215_GuyDailyRoutine();                    // #215
        G1CP_0216_DiggerDailyRoutine();                 // #216
        G1CP_0217_MercenaryDailyRoutine();              // #217
        G1CP_0220_GorNaRanDialogMad();                  // #220
        G1CP_0223_CarKalomSpyQuest();                   // #223
        G1CP_0225_MordragNcGetOut();                    // #225
        G1CP_0228_LaresDialogFindGorn();                // #228
        G1CP_0231_DE_TransformOrcDogDescription();      // #231
        G1CP_0232_DE_TransformBloodflyDescription();    // #232
        G1CP_0233_DE_OrcDogName();                      // #233
        G1CP_0235_DE_OrcDogMagBook();                   // #235
        G1CP_0236_DE_OrcDogGuild();                     // #236
        G1CP_0241_GuardAfterTrial();                    // #241
        G1CP_0244_GuardExitDialog();                    // #244
        G1CP_0278_EN_FemaleSvmOuMismatch();             // #278
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

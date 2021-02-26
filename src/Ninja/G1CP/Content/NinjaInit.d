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
        Ninja_G1CP_049_DungeonKeyText();                                // #49
        Ninja_G1CP_059_FixEquipBestWeapons();                           // #59
        Ninja_G1CP_060_JesseQuest();                                    // #60
        Ninja_G1CP_078_HumanAttackOrc();                                // #78
        Ninja_G1CP_079_WolfDexDialog();                                 // #79
        Ninja_G1CP_InitEnd();
    };

    MEM_Call(debugfollow);
};


/*
 * Initialization function called by Ninja after "Init_Global" (G2) / "Init_<Levelname>" (G1)
 */
func void Ninja_G1CP_Init() {
    // Wrapper for "LeGo_Init" to ensure correct LeGo initialization without breaking the mod
    LeGo_MergeFlags(LeGo_ConsoleCommands | LeGo_AI_Function);

    // Re-initialize game save fixes
    Ninja_G1CP_GamesaveFixes_Apply();

    MEM_Call(DoInLevel);
};


func int Ninja_G1CP_GetWaypoint(var string name) {
    const int zCWayNet__GetWaypoint = 7366448; //0x706730

    var int waynetPtr; waynetPtr = _@(MEM_Waynet);
    var int wpNamePtr; wpNamePtr = _@s(name);
    name = STR_Upper(name);

    const int call = 0;
    if (Call_Begin(call)) {
        CALL_PutRetValTo(_@(ret));
        CALL__fastcall(_@(waynetPtr), _@(wpNamePtr), zCWayNet__GetWaypoint);
        call = CALL_End();
    };

    var int ret;
    return +ret;
};

func int Ninja_G1CP_CreateWaypoint(var string name, var int posPtr) {
    var int wp; wp = Ninja_G1CP_GetWaypoint(name);
    if (wp) {
        return +wp;
    };

    var int waynetPtr; waynetPtr = _@(MEM_Waynet);

    const int zCWayNet__HasWaypoint = 7353232; //0x703390

    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(posPtr));
        CALL_PutRetValTo(_@(wp));
        CALL__thiscall(_@(waynetPtr), zCWayNet__HasWaypoint);
        call = CALL_End();
    };

    if (wp) {
        return +wp;
    };

    var int namePtr; namePtr = _@s(name);

    const int zCObjectFactory__CreateWaypoint = 5816224; //0x58BFA0
    const int zCWaypoint__Init                = 7363744; //0x705CA0
    const int zCWaypoint__SetName             = 7364528; //0x705FB0
    const int zfactory                        = 8863624; //0x873F88

    const int call2 = 0;
    if (CALL_Begin(call2)) {
        CALL_PutRetValTo(_@(wp));
        CALL__thiscall(zfactory, zCObjectFactory__CreateWaypoint);

        CALL_PtrParam(_@(posPtr));
        CALL__thiscall(_@(wp), zCWaypoint__Init);

        CALL_PtrParam(_@(namePtr));
        CALL__thiscall(_@(wp), zCWaypoint__SetName);

        call2 = CALL_End();
    };

    return +wp;
};


func void Ninja_G1CP_InsertWaypoint(var string name, var int posPtr, var string wp1, var string wp3) {
    var int w1; w1 = Ninja_G1CP_GetWaypoint(wp1);
    var int w3; w3 = Ninja_G1CP_GetWaypoint(wp3);
    if ((!w1) || (!w3)) {
        return;
    };

    var int w2; w2 = Ninja_G1CP_CreateWaypoint(name, posPtr);

    var int waynetPtr; waynetPtr = _@(MEM_Waynet);

    const int zCWayNet__InsertWaypoint = 7353632; //0x703520
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(w3));
        CALL_PtrParam(_@(w2));
        CALL_PtrParam(_@(w1));
        CALL__thiscall(_@(waynetPtr), zCWayNet__InsertWaypoint);
        call = CALL_End();
    };
};

func void DoInLevel() {

    const int once = 0;
    if (!once) {
        const float pos0[3] = {1700, 312, -1397};
        const float pos1[3] = {2122, 220, -1235};
        const float pos2[3] = {2405, 121, -800};
        const float pos3[3] = {2112, 111, -746};
        const float pos4[3] = {1895,  98, -607};
        Ninja_G1CP_InsertWaypoint("Ninja_G1CP_WP001", _@f(pos0), "FM_11", "FM_19");
        Ninja_G1CP_InsertWaypoint("Ninja_G1CP_WP002", _@f(pos1), "FM_09", "FM_11");
        Ninja_G1CP_InsertWaypoint("Ninja_G1CP_WP003", _@f(pos2), "FM_09", "Ninja_G1CP_WP002");
        Ninja_G1CP_InsertWaypoint("Ninja_G1CP_WP004", _@f(pos3), "FM_03", "Ninja_G1CP_WP003");
        Ninja_G1CP_InsertWaypoint("Ninja_G1CP_WP005", _@f(pos4), "FM_03", "Ninja_G1CP_WP004");
        once = 1;
    };

};

func void debugfollow() {
    //HookDaedalusFuncS("ZS_FollowPC_Loop", "debugfollowloop");
    HookDaedalusFuncS("B_FollowPC_AssessSC", "SomeAssess");
    // HookEngineF(7006128, 6, evusemob_hook);
    HookEngineF(7660027, 6, evgoroute_hook_2);

    MEM_Call(PrioritizeTestKeys);

    // Double the Y-distance in checking for nearest waypoint (prioritize leveled waypoints)
    const int nearestWaypointY = 7355016; //0x703A88
    const int two = 2;
    MemoryProtectionOverride(nearestWaypointY, 23);
    MEM_WriteByte(nearestWaypointY+0, 222); // de 0d                   fimul  WORD PTR [two_addr]
    MEM_WriteByte(nearestWaypointY+1, 13);
    MEM_WriteInt(nearestWaypointY +2, _@(two));
    MEM_WriteByte(nearestWaypointY+6, 217); // d9 e1                   fabs
    MEM_WriteByte(nearestWaypointY+7, 225);
    MEM_WriteInt(nearestWaypointY +8, 270818521); // D9 5C 24 10       Store
    MEM_WriteByte(nearestWaypointY+12, 217); // Load next
    MEM_WriteByte(nearestWaypointY+13, 65);
    MEM_WriteByte(nearestWaypointY+14, 76);
    MEM_WriteByte(nearestWaypointY+15, 144); // NOP
    MEM_WriteInt(nearestWaypointY +19, -1869574000); // NOP

    const int oCNpc__EV_GotoVob = 7665376; //0x74F6E0
    HookEngineF(oCNpc__EV_GotoVob, 6, checkChasmStop);

    return;

    // HookEngineF(7660153, 5, LadderOnWay);
    // HookEngineF(7660172, 7, LadderAvail);

    // const int oCNpc__EV_GoRoute_useLadder    = 7660374; //0x74E356
    // const int oCNpc__EV_GoRoute_useLadderEnd = 7660496; //0x74E3D0
    // if (Ninja_G1CP_IsMemAvail(oCNpc__EV_GoRoute_useLadder, "68 E5 05 00 00 68 30 88 85 00") == 1)  // Must not be hooked
    // && (Ninja_G1CP_IsMemAvail(oCNpc__EV_GoRoute_useLadder, "68 E5 05 00 00") == 1) {

    //     // const int oCNpc__EV_GoRoute_useLadderEnd = 7660496; //0x74E3D0
    //     // const int bytes[3] = {/*mov eax, */184 << 24, oCNpc__EV_GoRoute_useLadderEnd, /*jmp eax*/57599};

    //     // MemoryProtectionOverride(oCNpc__EV_GoRoute_useLadder, 7);
    //     // MEM_CopyBytes(oCNpc__EV_GoRoute_useLadder, _@(bytes)+3, 7);

    //     var int addr; addr = oCNpc__EV_GoRoute_useLadder+5;
    //     MemoryProtectionOverride(addr, 5);
    //     MEM_WriteByte(addr, ASMINT_OP_jmp);
    //     MEM_WriteInt(addr+1, oCNpc__EV_GoRoute_useLadderEnd+5 - addr-5);

    //     HookEngineF(oCNpc__EV_GoRoute_useLadder, 5, useLadderMyself);
    // };

    const int oCNpc__EV_GoRoute_useLadderNeg = 7660229; //0x74E2C5
    const int oCNpc__EV_GoRoute_useLadder    = 7660374; //0x74E356
    const int oCNpc__EV_GoRoute_useLadderEnd = 7660496; //0x74E3D0
    if (Ninja_G1CP_IsMemAvail(oCNpc__EV_GoRoute_useLadder,    "68 E5 05 00 00") == 1)  // Must not be hooked
    && (Ninja_G1CP_IsMemAvail(oCNpc__EV_GoRoute_useLadderEnd, "68 EA 05 00 00") == 1) {
        MemoryProtectionOverride(oCNpc__EV_GoRoute_useLadderEnd, 5);
        // HookEngineF(oCNpc__EV_GoRoute_useLadder, 5, useLadderMyself2);

        HookEngineF(6839072, 6, ladderInteract_hook);
        HookEngineF(6817008, 6, useMobToState_hook);
        HookEngineF(7006128, 6, evusemob_hook);
        HookEngineF(7006571, 6, evusemob_end_hook);
        HookEngineF(7659328, 6, evgoroute_hook);
        HookEngineF(6838448, 6, ladderStartInteract_hook);

        // // Remove high priority
        // MemoryProtectionOverride(7660343, 1);
        // MemoryProtectionOverride(7660465, 1);
        // MemoryProtectionOverride(7660582, 1);
        // MemoryProtectionOverride(7660746, 1);
        // MEM_WriteByte(7660343, 0);
        // MEM_WriteByte(7660465, 0);
        // MEM_WriteByte(7660582, 0);
        // MEM_WriteByte(7660746, 0);

        // // Delete EV_GoRoute from queue
        // MemoryProtectionOverride(7660793, 2);
        // MEM_WriteByte(7660793, 176);
        // MEM_WriteByte(7660794, 1);

        // Clear AI Queue
        HookEngineF(7660172, 7, ladderDetected_hook);

        // Skip setting state to -1
        // MemoryProtectionOverride(oCNpc__EV_GoRoute_useLadderNeg, 5);
        // MEM_WriteByte(oCNpc__EV_GoRoute_useLadderNeg, ASMINT_OP_jmp);
        // MEM_WriteInt(oCNpc__EV_GoRoute_useLadderNeg+1, oCNpc__EV_GoRoute_useLadder - oCNpc__EV_GoRoute_useLadderNeg-5);
    };
};

func void checkChasmStop() {
    var oCNpc slf; slf = _^(ECX);
    // MEM_Info(ConcatStrings("### use chasm checks: ",
    //                        IntToString(slf.rbt_bitfield & oTRobustTrace_bitfield_useChasmChecks)));
    // slf.rbt_bitfield = slf.rbt_bitfield & ~oTRobustTrace_bitfield_useChasmChecks;

    MEM_Info(ConcatStrings("RBT Failure percentage: ", toStringF(slf.rbt_failurePossibility)));
};

func void PrioritizeTestKeys() {
    const int oCGame__HandleEvent_start = 6680385; //0x65EF41
    const int oCGame__HandleEvent_end   = 6684420; //0x65FF04
    const int oCGame__TestKeys          = 6684672; //0x660000

    if (Ninja_G1CP_IsMemAvail(oCGame__HandleEvent_start, "8B 0D A0 CC 86 00") == 1) {

        // Create new instructions
        ASM_Open(30+6+1);
        ASM_2(40761); ASM_4(176);                                    // 39 9F B0 00 00 00  cmp   [edi+0B0h], ebx
        ASM_1(116);   ASM_1(16);                                     // 74 10              jz    0x10
        ASM_1(86);                                                   // 56                 push  esi
        ASM_2(63881);                                                // 89 f9              mov   ecx, edi
        ASM_1(ASMINT_OP_call); ASM_4(oCGame__TestKeys-ASM_Here()-4); // e8 XX XX XX XX     call  oCGame__TestKeys
        ASM_2(49285);                                                // 85 c0              test  eax, eax
        ASM_2(34063); ASM_4(oCGame__HandleEvent_end-ASM_Here()-4);   // 0f 85 XX XX XX XX  jnz   oCGame__HandleEvent_end
        MEM_CopyBytes(oCGame__HandleEvent_start, ASMINT_Cursor, 6);  // 8B 0D A0 CC 86 00
        ASMINT_Cursor += 6;
        ASM_1(ASMINT_OP_pushIm); ASM_4(oCGame__HandleEvent_start+6); // 68 XX XX XX XX     push  ret_addr
        ASM_1(ASMINT_OP_retn);                                       // c3                 ret
        var int addr; addr = ASM_Close();

        // Jump to new instructions
        MemoryProtectionOverride(oCGame__HandleEvent_start, 6);
        MEM_WriteByte(oCGame__HandleEvent_start, ASMINT_OP_jmp);
        MEM_WriteInt(oCGame__HandleEvent_start+1, addr - oCGame__HandleEvent_start - 5);
        MEM_WriteByte(oCGame__HandleEvent_start+5, ASMINT_OP_nop);
    };
};

func void evgoroute_hook_2() {
    var C_Npc slf; slf = _^(ESI);
    if (!Hlp_StrCmp(slf.name, "Gorn")) {
        return;
    };

    var oCNpc npc; npc = _^(ESI);
    if (npc.route) {
        const int zCRoute__GetDesc = 7376000; //0x708C80
        CALL_RetValIszString();
        CALL__thiscall(npc.route, zCRoute__GetDesc);
        var string rt; rt = CALL_RetValAszString();

        MEM_Info(rt);
    };
};


func void ladderStartInteract_hook() {
    var oCMobInter ladder; ladder = _^(ECX);
    var C_Npc slf; slf = _^(MEM_ReadInt(ESP+4));

    var string visname; visname = "";
    var int byvis;
    var int byheight;

    var int vis; vis = MEM_ReadInt(ECX+184);
    if (vis) {
        CALL_RetValIszString();
        CALL__thiscall(vis, MEM_ReadInt(MEM_ReadInt(vis)+32));
        visname = CALL_RetValAszString();

        var int pos; pos = STR_SplitCount(visname, "_") - 1;
        var string last; last = STR_Split(visname, "_", pos);
        byvis = STR_ToInt(STR_Split(last, ".", 0)) - 1;
    };

    byheight = -1;

    var string msg; msg = ConcatStrings(slf.name, " starts ladder");
    msg = ConcatStrings(msg, ", visual: ");
    msg = ConcatStrings(msg, visname);
    msg = ConcatStrings(msg, ", states before: ");
    msg = ConcatStrings(msg, IntToString(ladder.state_num));
    msg = ConcatStrings(msg, ", by visual: ");
    msg = ConcatStrings(msg, IntToString(byvis));
    msg = ConcatStrings(msg, ", by height: ");
    msg = ConcatStrings(msg, IntToString(byheight));
    MEM_Info(msg);
};

func void evusemob_hook() {
    var C_Npc slf; slf = _^(ESI);
    var oCNpc npc; npc = _^(ESI);
    var int msg; msg = MEM_ReadInt(ESP+4);
    var int targetVob; targetVob = MEM_ReadInt(msg+108);

    if (!targetVob) {
        MEM_Info("No target yet in EV_UseMob");
    };

    if (!npc.interactMob) {
        MEM_Info("NPC has no interact vob");
    };

    if (Hlp_Is_oCMobLadder(targetVob)) {
        var oCMobInter ladder; ladder = _^(targetVob);

        MEM_Info("Call EV_UseMob for ladder");

        const int oCMobInter__IsInteractingWith = 6814832; //0x67FC70
        CALL_PtrParam(ESI);
        CALL__thiscall(targetVob, oCMobInter__IsInteractingWith);
        var int isinteractingwith; isinteractingwith = CALL_RetValAsInt();

        const int oCMobLadder__CanInteractWith = 6838944; //0x685AA0
        CALL_PtrParam(ESI);
        CALL__thiscall(targetVob, oCMobLadder__CanInteractWith);
        var int caninteractwith; caninteractwith = CALL_RetValAsInt();

        // if (!isinteractingwith) {
        //     MEM_Info("MarkAsUsed");
        //     const int oCMobInter__MarkAsUsed = 6813136; //0x67F5D0
        //     CALL_PtrParam(ESI);
        //     CALL_FloatParam(mkf(50 * 1000));
        //     CALL__thiscall(targetVob, oCMobInter__MarkAsUsed);
        // };

        if (!isinteractingwith) && (!caninteractwith) {
            var string text; text = "### Terminated by EV_UseMob through: ";
            text = ConcatStrings(text, "IsInteractingWith = ");
            text = ConcatStrings(text, IntToString(isinteractingwith));
            text = ConcatStrings(text, ", CanInteractWith = ");
            text = ConcatStrings(text, IntToString(caninteractwith));
            MEM_Info(text);
        };
    } else if (targetVob) {
        MEM_Info(ConcatStrings("What is target vob?! ", MEM_ReadString(targetVob+16)));
    };
};

func void evusemob_end_hook() {
    MEM_Info(ConcatStrings("EV_UseMob returns: ", IntToString(EAX)));
};


func void ladderDetected_hook() {
    var C_Npc slf; slf = _^(ESI);
    Npc_ClearAIQueue(slf);
    AI_UseMob(slf, "LADDER", 100);
    AI_UseMob(slf, "LADDER", 100);
    AI_UseMob(slf, "LADDER", 100);
    AI_UseMob(slf, "LADDER", 100);
    AI_Wait(slf, 5);
};

func void evgoroute_hook() {
    var C_Npc slf; slf = _^(ECX);
    if (Hlp_StrCmp(slf.name, "Gorn")) {
        MEM_Info("=== Interrupt! ===");
    };
};

func void useMobToState_hook() {
    if (Hlp_Is_oCMobLadder(ECX)) {
        var oCMobInter ladder; ladder = _^(ECX);
        var C_Npc slf; slf = _^(MEM_ReadInt(ESP+4));
        var int target; target = MEM_ReadInt(ESP+8);

        // var string msg;
        // msg = ConcatStrings(slf.name, " uses ladder (AI_UseMobToState): target ");
        // msg = ConcatStrings(msg, IntToString(target));
        // MEM_Info(msg);

        if (target >= ladder.state_num) {
            target = ladder.state_num;
        };

        const int oCMobInter__IsInteractingWith = 6814832; //0x67FC70
        CALL_PtrParam(MEM_ReadInt(ESP+4));
        CALL__thiscall(ECX, oCMobInter__IsInteractingWith);
        var int isinteractingwith; isinteractingwith = CALL_RetValAsInt();

        const int oCMobInter__IsInState = 6808384; //0x67E340
        CALL_IntParam(target);
        CALL_PtrParam(MEM_ReadInt(ESP+4));
        CALL__thiscall(ECX, oCMobInter__IsInState);
        var int isinstate; isinstate = CALL_RetValAsInt();

        var string msg;
        msg = ConcatStrings(slf.name, " in AI_UseMobToState: target = ");
        msg = ConcatStrings(msg, IntToString(target));
        msg = ConcatStrings(msg, ", isinteractingwith = ");
        msg = ConcatStrings(msg, IntToString(isinteractingwith));
        msg = ConcatStrings(msg, ", isinstate = ");
        msg = ConcatStrings(msg, IntToString(isinstate));
        MEM_Info(msg);
    };
};
func void ladderInteract_hook() {
    var oCMobInter ladder; ladder = _^(ECX);
    var C_Npc slf; slf = _^(MEM_ReadInt(ESP+4));

    if (!Hlp_StrCmp(slf.name, "Gorn")) {
        return;
    };

    var string msg;
    msg = ConcatStrings(slf.name, " in Interact: action ");
    msg = ConcatStrings(msg, IntToString(MEM_ReadInt(ESP+8)));
    msg = ConcatStrings(msg, ", up ");
    msg = ConcatStrings(msg, IntToString(MEM_ReadInt(ESP+12)));
    msg = ConcatStrings(msg, ", state ");
    msg = ConcatStrings(msg, IntToString(ladder.state));
    msg = ConcatStrings(msg, ", state_target ");
    msg = ConcatStrings(msg, IntToString(ladder.state_target));
    msg = ConcatStrings(msg, ", state_num ");
    msg = ConcatStrings(msg, IntToString(ladder.state_num));
    MEM_Info(msg);
};

func void useLadderMyself2() {
    var C_Npc slf; slf = _^(ESI);
    var oCMobInter ladder; ladder = _^(EBX);
    var int target; target = MEM_ReadInt(ESP+20);

    var string msg;
    msg = ConcatStrings(slf.name, " goes up ");
    msg = ConcatStrings(msg, ladder.sceme);
    msg = ConcatStrings(msg, " from state ");
    msg = ConcatStrings(msg, IntToString(ladder.state));
    msg = ConcatStrings(msg, " to ");
    msg = ConcatStrings(msg, IntToString(target));
    msg = ConcatStrings(msg, ", state_num ");
    msg = ConcatStrings(msg, IntToString(ladder.state_num));
    MEM_Info(msg);


    // Append some stuff
    AI_Wait(slf, 1);

    return;

    const int oCNpc__EV_GoRoute_useLadder    = 7660374; //0x74E356
    const int oCNpc__EV_GoRoute_useLadderEnd = 7660496; //0x74E3D0
    if (target >= 98) {

        // var oCNpc npc; npc = _^(ESI);
        // npc.interactMob = EBX;
        // const int oCNpc__SetInteractMob = 6972864; //0x6A65C0
        // CALL_PtrParam(EBX);
        // CALL__thiscall(ESI, oCNpc__SetInteractMob);

        // const int oCMobInter__MarkAsUsed = 6813136; //0x67F5D0
        // CALL_PtrParam(ESI);
        // CALL_FloatParam(mkf(20 * 1000));
        // CALL__thiscall(EBX, oCMobInter__MarkAsUsed);

        MEM_WriteInt(ESP+20, target-1);
        MEM_WriteByte(oCNpc__EV_GoRoute_useLadderEnd, ASMINT_OP_jmp);
        MEM_WriteInt(oCNpc__EV_GoRoute_useLadderEnd+1, oCNpc__EV_GoRoute_useLadder - oCNpc__EV_GoRoute_useLadderEnd-5);
    } else {
        MEM_WriteByte(oCNpc__EV_GoRoute_useLadderEnd, ASMINT_OP_pushIm);
        MEM_WriteInt(oCNpc__EV_GoRoute_useLadderEnd+1, 1514);
    };
};

func void useLadderMyself() {
    var C_Npc slf; slf = _^(ESI);
    var oCMobInter ladder; ladder = _^(EBX);
    var int target; target = MEM_ReadInt(ESP+20);

    var string msg;
    msg = ConcatStrings(slf.name, " goes up ");
    msg = ConcatStrings(msg, ladder.sceme);
    msg = ConcatStrings(msg, " from state ");
    msg = ConcatStrings(msg, IntToString(ladder.state));
    msg = ConcatStrings(msg, " to ");
    msg = ConcatStrings(msg, IntToString(target));
    msg = ConcatStrings(msg, ", state_num ");
    msg = ConcatStrings(msg, IntToString(ladder.state_num));
    MEM_Info(msg);

    if (target == 100) {
        if (target >= ladder.state_num) {
            target = ladder.state_num+1;
        };
        repeat(i, target-ladder.state); var int i;
            MEM_Info(ConcatStrings("AI_UseMob: ", IntToString(ladder.state + i)));
            AI_UseMob(slf, "LADDER", ladder.state + i);
        end;
    } else {
        AI_UseMob(slf, "LADDER", target);
    };
};
func void LadderOnWay() {
    MEM_Info("Found a ladder");
};
func void LadderAvail() {
    MEM_Info("Ladder available");
};
func int debugfollowloop() {
/*    var oCNpc slf; slf = Hlp_GetNpc(self);
    if (slf.interactMob) {
        MEM_Info("##### USING MOB #####");
        return LOOP_CONTINUE;
    };
    MEM_Info("##### not using mob #####");
    ContinueCall();*/

    // AI_UseMob (self, "LADDER", 1);
    // AI_UseMob (self, "LADDER", 2);
    // AI_UseMob (self, "LADDER", 3);
    // AI_UseMob (self, "LADDER", 4);
    // AI_UseMob (self, "LADDER", 5);
    // AI_UseMob (self, "LADDER", 6);
    // AI_UseMob (self, "LADDER", 7);
    // AI_UseMob (self, "LADDER", 8);
    // AI_UseMob (self, "LADDER", 9);

    // AI_UseMob (self, "LADDER", -1);

    MEM_Info("#### ZS LOOP ####");

    ContinueCall();
};

func void SomeAssess() {
    if (Ninja_G1CP_BodyStateContains(self, BS_CLIMB)) {
        MEM_Info(ConcatStrings(self.name, " climbs!! #@@#### "));
        return;
    };

    ContinueCall();
};

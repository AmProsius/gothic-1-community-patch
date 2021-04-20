/*
 * #55 Reactivate In Extremo concert
 */

/*
 * One-time initialization
 */
func int G1CP_055_ReactivateInExtremo_InitSession() {
    // This function consists of a lot of if-conditions. It might seem wise to evaluate every condition separately and
    // exit es soon as possible. But we are actually not saving any time, because if all goes well, we will go through
    // the entire function anyway. This function is only called once on first loading and takes no more than 40 ms.

    // Get/check essential functions
    var int fncInsertId; fncInsertId = G1CP_GetFuncID("B_InsertInExtremo",     "void|none");
    var int fncRemoveId; fncRemoveId = G1CP_GetFuncID("B_KillInExtremo",       "void|none");
    var int fncStrtMsId; fncStrtMsId = G1CP_GetFuncID("B_InExtremoStartMusic", "void|none");
    var int fncStopMsId; fncStopMsId = G1CP_GetFuncID("B_InExtremoStopMusic",  "void|none");
    var int fncChpChgId; fncChpChgId = G1CP_GetFuncID("B_Kapitelwechsel",      "void|int");
    var int fncExgRtnId; fncExgRtnId = G1CP_GetFuncID("B_ExchangeRoutine",     "void|int|string");
    if (fncInsertId == -1) || (fncRemoveId == -1) || (fncStrtMsId == -1) || (fncStopMsId == -1)
    || (fncChpChgId == -1) || (fncExgRtnId == -1) {
        MEM_Info("Necessary functions not found");
        return FALSE;
    };

    // Get/check variables
    var int varPlyingId; varPlyingId = G1CP_GetIntVarID("InExtremoPlaying", 0);
    var int varChaptrId; varChaptrId = G1CP_GetIntVarID("Kapitel",          0);
    if (varPlyingId == 1) || (varChaptrId == 1) {
        MEM_Info("Necessary variables not found");
        return FALSE;
    };

    // Get/check NPCs (including fans)
    // Make no exceptions: We are only re-enabling it, not re-creating it
    const int GRIM = 13;
    const int ALL  = 14;
    var int npc[ALL]; // Do not change the order. It matches that of B_InExtremo.d
    npc[0]  = G1CP_GetNpcInstID("InExtremo_DrPymonte");
    npc[1]  = G1CP_GetNpcInstID("InExtremo_TheFlail");
    npc[2]  = G1CP_GetNpcInstID("InExtremo_ThomasTheForger");
    npc[3]  = G1CP_GetNpcInstID("InExtremo_Unicorn");
    npc[4]  = G1CP_GetNpcInstID("InExtremo_YellowPfeiffer");
    npc[5]  = G1CP_GetNpcInstID("InExtremo_Lutter");
    npc[6]  = G1CP_GetNpcInstID("InExtremo_Flex");
    npc[7]  = G1CP_GetNpcInstID("IE_397_Announcer");
    npc[8]  = G1CP_GetNpcInstID("Charlotte");
    npc[9]  = G1CP_GetNpcInstID("IEFan1");
    npc[10] = G1CP_GetNpcInstID("IEFan2");
    npc[11] = G1CP_GetNpcInstID("IEFan3");
    npc[12] = G1CP_GetNpcInstID("IEFan4");
    npc[13] = G1CP_GetNpcInstID("Vlk_580_Grim");
    if (npc[0]  == -1) || (npc[1]  == -1) || (npc[2]  == -1) || (npc[3]  == -1) || (npc[4]  == -1)
    || (npc[5]  == -1) || (npc[6]  == -1) || (npc[7]  == -1) || (npc[8]  == -1) || (npc[9]  == -1)
    || (npc[10] == -1) || (npc[11] == -1) || (npc[12] == -1) || (npc[13] == -1) {
        MEM_Info("Necessary NPC instances not found");
        return FALSE;
    };

    // Check daily routines (symbol indices not needed again for now)
    if (!G1CP_IsFunc("Rtn_Start_580",     "void|none")) || (!G1CP_IsFunc("Rtn_InExtremo_580", "void|none"))
    || (!G1CP_IsFunc("Rtn_announce_397",  "void|none")) || (!G1CP_IsFunc("Rtn_announce_398",  "void|none"))
    || (!G1CP_IsFunc("Rtn_concert_390",   "void|none")) || (!G1CP_IsFunc("Rtn_concert_391",   "void|none"))
    || (!G1CP_IsFunc("Rtn_concert_392",   "void|none")) || (!G1CP_IsFunc("Rtn_concert_393",   "void|none"))
    || (!G1CP_IsFunc("Rtn_concert_394",   "void|none")) || (!G1CP_IsFunc("Rtn_concert_395",   "void|none"))
    || (!G1CP_IsFunc("Rtn_concert_396",   "void|none")) || (!G1CP_IsFunc("Rtn_concert_397",   "void|none"))
    || (!G1CP_IsFunc("Rtn_concert_398",   "void|none")) || (!G1CP_IsFunc("Rtn_concert_399",   "void|none"))
    || (!G1CP_IsFunc("Rtn_concert_400",   "void|none")) || (!G1CP_IsFunc("Rtn_concert_401",   "void|none"))
    || (!G1CP_IsFunc("Rtn_concert_402",   "void|none")) || (!G1CP_IsFunc("Rtn_off_390",       "void|none"))
    || (!G1CP_IsFunc("Rtn_off_391",       "void|none")) || (!G1CP_IsFunc("Rtn_off_392",       "void|none"))
    || (!G1CP_IsFunc("Rtn_off_393",       "void|none")) || (!G1CP_IsFunc("Rtn_off_394",       "void|none"))
    || (!G1CP_IsFunc("Rtn_off_395",       "void|none")) || (!G1CP_IsFunc("Rtn_off_396",       "void|none"))
    || (!G1CP_IsFunc("Rtn_off_397",       "void|none")) || (!G1CP_IsFunc("Rtn_off_398",       "void|none"))
    || (!G1CP_IsFunc("Rtn_off_399",       "void|none")) || (!G1CP_IsFunc("Rtn_off_400",       "void|none"))
    || (!G1CP_IsFunc("Rtn_off_401",       "void|none")) || (!G1CP_IsFunc("Rtn_off_402",       "void|none")) {
        MEM_Info("Necessary daily routines not found");
        return FALSE;
    };

    // Check the announcer's and Grim's dialogs
    var int fncDiaGrimId; fncDiaGrimId = G1CP_GetFuncID("DIA_Grim_INEXTREMO_Info", "void|none");
    if (!G1CP_IsInfoInst("IE_397_Announcer_ANNOUNCE")) || (!G1CP_GetInfo("IE_397_Announcer_ANNOUNCE"))
    || (!G1CP_IsInfoInst("DIA_Grim_INEXTREMO"))        || (!G1CP_GetInfo("DIA_Grim_INEXTREMO"))
    || (fncDiaGrimId == -1) {
        MEM_Info("Necessary dialogs not found");
        return FALSE;
    };

    // Now confirm the content of some functions
    var int bytes[3];
    var int matches;
    var int count;
    var int addr;
    var int val;
    var int good;

    // Check that the content of "B_InsertInExtremo" is as expected
    var int fncInsrtNpcId; fncInsrtNpcId = MEM_GetFuncID(Wld_InsertNpc);
    addr = G1CP_GetFuncStart(fncInsertId);
    good = TRUE;
    repeat(i, GRIM); var int i; // All NPCs but Grim
        if (MEM_ReadByte(addr) != zPAR_TOK_PUSHINT)        { good = FALSE; }; addr += 1;
        if (MEM_ReadInt( addr) != MEM_ReadStatArr(npc, i)) { good = FALSE; }; addr += 4;
        if (MEM_ReadByte(addr) != zPAR_TOK_PUSHVAR)        { good = FALSE; }; addr += 1+4;
        if (MEM_ReadByte(addr) != zPAR_TOK_CALLEXTERN)     { good = FALSE; }; addr += 1;
        if (MEM_ReadInt( addr) != fncInsrtNpcId)           { good = FALSE; }; addr += 4;
    end;
    if (MEM_ReadByte(addr) != zPAR_TOK_RET)                { good = FALSE; };
    if (!good) {
        MEM_Info("Content of function 'B_InsertInExtremo' not as expected");
        return FALSE;
    };

    // Check that the content of "B_KillInExtremo" is as expected
    var int fncExgRtnOff; fncExgRtnOff = G1CP_GetCallableOffsetI(fncExgRtnId);
    addr = G1CP_GetFuncStart(fncRemoveId);
    good = TRUE;
    repeat(i, ALL); // All NPCs including Grim
        if (MEM_ReadByte(addr) != zPAR_TOK_PUSHINT)        { good = FALSE; }; addr += 1;
        if (MEM_ReadInt( addr) != MEM_ReadStatArr(npc, i)) { good = FALSE; }; addr += 4;
        if (MEM_ReadByte(addr) != zPAR_TOK_PUSHVAR)        { good = FALSE; }; addr += 1+4;
        if (MEM_ReadByte(addr) != zPAR_TOK_CALL)           { good = FALSE; }; addr += 1;
        if (MEM_ReadInt( addr) != fncExgRtnOff)            { good = FALSE; }; addr += 4;
    end;
    if (MEM_ReadByte(addr) != zPAR_TOK_RET)                { good = FALSE; };
    if (!good) {
        MEM_Info("Content of function 'B_KillInExtremo' not as expected");
        return FALSE;
    };

    // Check that the content of "B_InExtremoStartMusic" is as expected
    var int fncSndTrggrId; fncSndTrggrId = MEM_GetFuncID(Wld_SendTrigger);
    addr = G1CP_GetFuncStart(fncStrtMsId);
    good = TRUE;
    if (MEM_ReadByte(addr) != zPAR_TOK_PUSHVAR)            { good = FALSE; }; addr += 5;
    if (MEM_ReadByte(addr) != zPAR_TOK_CALLEXTERN)         { good = FALSE; }; addr += 1;
    if (MEM_ReadInt( addr) != fncSndTrggrId)               { good = FALSE; }; addr += 4;
    if (MEM_ReadByte(addr) != zPAR_TOK_PUSHVAR)            { good = FALSE; }; addr += 5;
    if (MEM_ReadByte(addr) != zPAR_TOK_CALLEXTERN)         { good = FALSE; }; addr += 1;
    if (MEM_ReadInt( addr) != fncSndTrggrId)               { good = FALSE; }; addr += 4;
    val = MEM_ReadInt(addr+1);
    if (MEM_ReadByte(addr) == zPAR_TOK_PUSHVAR) {
        val = G1CP_GetIntI(val, 0, 0);
    } else if (MEM_ReadByte(addr) != zPAR_TOK_PUSHINT)     { good = FALSE; }; addr += 1;
    if (val == 0)                                          { good = FALSE; }; addr += 4;
    if (MEM_ReadByte(addr) != zPAR_TOK_PUSHVAR)            { good = FALSE; }; addr += 1;
    if (MEM_ReadInt( addr) != varPlyingId)                 { good = FALSE; }; addr += 4;
    if (MEM_ReadByte(addr) != zPAR_OP_IS)                  { good = FALSE; }; addr += 1;
    if (MEM_ReadByte(addr) != zPAR_TOK_RET)                { good = FALSE; };
    if (!good) {
        MEM_Info("Content of function 'B_InExtremoStartMusic' not as expected");
        return FALSE;
    };

    // Check that the content of "B_InExtremoStopMusic" is as expected
    var int fncUnSndTrgId; fncUnSndTrgId = MEM_GetFuncID(Wld_SendUnTrigger);
    addr = G1CP_GetFuncStart(fncStopMsId);
    good = TRUE;
    if (MEM_ReadByte(addr) != zPAR_TOK_PUSHVAR)            { good = FALSE; }; addr += 5;
    if (MEM_ReadByte(addr) != zPAR_TOK_CALLEXTERN)         { good = FALSE; }; addr += 1;
    if (MEM_ReadInt( addr) != fncUnSndTrgId)               { good = FALSE; }; addr += 4;
    if (MEM_ReadByte(addr) != zPAR_TOK_PUSHVAR)            { good = FALSE; }; addr += 5;
    if (MEM_ReadByte(addr) != zPAR_TOK_CALLEXTERN)         { good = FALSE; }; addr += 1;
    if (MEM_ReadInt( addr) != fncUnSndTrgId)               { good = FALSE; }; addr += 4;
    val = MEM_ReadInt(addr+1);
    if (MEM_ReadByte(addr) == zPAR_TOK_PUSHVAR) {
        val = G1CP_GetIntI(val, 0, 1);
    } else if (MEM_ReadByte(addr) != zPAR_TOK_PUSHINT)     { good = FALSE; }; addr += 1;
    if (val != 0)                                          { good = FALSE; }; addr += 4;
    if (MEM_ReadByte(addr) != zPAR_TOK_PUSHVAR)            { good = FALSE; }; addr += 1;
    if (MEM_ReadInt( addr) != varPlyingId)                 { good = FALSE; }; addr += 4;
    if (MEM_ReadByte(addr) != zPAR_OP_IS)                  { good = FALSE; }; addr += 1;
    if (MEM_ReadByte(addr) != zPAR_TOK_RET)                { good = FALSE; };
    if (!good) {
        MEM_Info("Content of function 'B_InExtremoStopMusic' not as expected");
        return FALSE;
    };

    // Check that the content of "DIA_Grim_INEXTREMO_Info" is as expected: Change of routine
    bytes[0] = zPAR_TOK_CALLEXTERN<<24;
    bytes[1] = MEM_GetFuncID(Npc_ExchangeRoutine);
    matches = G1CP_FindInFunc(fncDiaGrimId, _@(bytes)+3, 5);
    count = MEM_ArraySize(matches);
    if (count == 1) {
        addr = MEM_ArrayRead(matches, 0);
    };
    MEM_ArrayFree(matches);
    if (count != 1) {
        MEM_Info("Content of function 'DIA_Grim_INEXTREMO_Info' not as expected (no 'Npc_ExchangeRoutine')");
        return FALSE;
    };
    val = MEM_ReadInt(addr-4);
    if (!Hlp_StrCmp(G1CP_GetStringI(val, 0, ""), "InExtremo")) {
        MEM_Info("Content of function 'DIA_Grim_INEXTREMO_Info' not as expected (no 'InExtremo' routine)");
        return FALSE;
    };

    // Check that the function "B_InsertInExtremo" is not called anywhere
    bytes[0] = zPAR_TOK_CALL<<24;
    bytes[1] = G1CP_GetCallableOffsetI(fncInsertId);
    matches = G1CP_FindInCode(0, 0, _@(bytes)+3, 5, 0);
    count = MEM_ArraySize(matches);
    MEM_ArrayFree(matches);
    if (count != 0) {
        MEM_Info("Function 'B_InsertInExtremo' referenced in the scripts");
        return FALSE;
    };

    // Check that the variable "InExtremoPlaying" is not set anywhere else
    bytes[0] = zPAR_TOK_PUSHVAR<<24;
    bytes[1] = varPlyingId;
    bytes[2] = zPAR_OP_IS;
    count = 0;
    matches = G1CP_FindInCode(0, 0, _@(bytes)+3, 6, 0);
    repeat(i, MEM_ArraySize(matches));
        var int offset; offset = MEM_ArrayRead(matches, i) - MEM_Parser.stack_stack;
        var int funcId; funcId = MEM_GetFuncIDByOffset(offset);
        if (funcId != fncStrtMsId) && (funcId != fncStopMsId) {
            count = 1;
            break;
        };
    end;
    MEM_ArrayFree(matches);
    if (count != 0) {
        MEM_Info("Variable 'InExtremoPlaying' referenced in the scripts");
        return FALSE;
    };

    // Finally check if the music file exists
    // No recyclable call necessary: This function here is only called once
    const int _vdf_fexists                      = 7713838; //0x75B42E
    const int zFILE_VDFS__LockCriticalSection   = 4485568; //0x4471C0
    const int zFILE_VDFS__UnlockCriticalSection = 4485600; //0x4471E0
    CALL__cdecl(zFILE_VDFS__LockCriticalSection);
    CALL_IntParam(1); // Only check VDF_VIRTUAL (no physical files)
    CALL_PutRetValTo(_@(good));
    CALL_cStringPtrParam("\_WORK\DATA\SOUND\SFX\CS_INEXTREMO.WAV");
    CALL__cdecl(_vdf_fexists);
    CALL__cdecl(zFILE_VDFS__UnlockCriticalSection);
    if (good) {
        return TRUE;
    } else {
        MEM_Info("Music file 'CS_INEXTREMO.WAV' not found");
        return FALSE;
    };
};


/*
 * One-time initialization in world
 */
func int G1CP_055_ReactivateInExtremo_InitWorld() {
    // Use the music zones as proxy to check for the correct world
    var int vobPtr; vobPtr = MEM_SearchVobByName("INEXTREMO_MUSIK");
    if (!vobPtr) || (!MEM_SearchVobByName("INEXTREMO_IE")) {
        return -1; // Try again next time
    };

    // Check the music file
    var int soundNameAddr; soundNameAddr = vobPtr + sizeof_zCVob + 4;
    if (MEM_ReadInt(soundNameAddr) != zString__vtbl) {
        MEM_Info("Sound VOB 'INEXTREMO_MUSIK' corrupt");
        return FALSE;
    }
    if (!Hlp_StrCmp(MEM_ReadString(soundNameAddr), "CS_INEXTREMO")) {
        MEM_Info("Sound VOB 'INEXTREMO_MUSIK' has incorrect sound file");
        return FALSE;
    };

    // Assume now, we are in the correct world. Check for each and every way point. If even only one does not exist,
    // this fix will be marked to never be applied
    if (!G1CP_GetWaypoint("OCR_IE_PYMONTE"))
    || (!G1CP_GetWaypoint("OCR_IE_FLAIL"))
    || (!G1CP_GetWaypoint("OCR_IE_THOMAS"))
    || (!G1CP_GetWaypoint("OCR_IE_UNICORN"))
    || (!G1CP_GetWaypoint("OCR_IE_PFEIFFER"))
    || (!G1CP_GetWaypoint("OCR_IE_LUTTER"))
    || (!G1CP_GetWaypoint("OCR_IE_FLEX"))
    || (!G1CP_GetWaypoint("OCR_AUDIENCE_01"))
    || (!G1CP_GetWaypoint("OCR_AUDIENCE_02"))
    || (!G1CP_GetWaypoint("OCR_AUDIENCE_03"))
    || (!G1CP_GetWaypoint("OCR_CROWD_01"))
    || (!G1CP_GetWaypoint("OCR_CROWD_02"))
    || (!G1CP_GetWaypoint("OCR_CROWD_03"))
    || (!G1CP_GetWaypoint("OCR_CROWD_04")) {
        MEM_Info("Necessary waypoints not found");
        return FALSE;
    };

    // All confirmed, let's create the story hook
    HookDaedalusFuncS("B_Kapitelwechsel", "G1CP_055_ReactivateInExtremoHook");

    // Success, all good: Never come here again
    return TRUE;
};


/*
 * Apply the changes
 */
func int G1CP_055_ReactivateInExtremo() {
    // On first call, do some general checks
    const int sessionOkay = -1;
    if (sessionOkay == -1) {
        sessionOkay = G1CP_055_ReactivateInExtremo_InitSession();
    };

    // Requirements are not met, never apply this fix
    if (!sessionOkay) {
        return FALSE;
    };

    // On first call in the correct world, do some general checks
    const int worldOkay = -1;
    if (worldOkay == -1) {
        worldOkay = G1CP_055_ReactivateInExtremo_InitWorld();
    };

    // Either not checked yet or requirements not met
    if (worldOkay < 1) {
        return FALSE;
    };

    // Get the symbol indices only once (no need to check anything: they exist, see function above)
    const int ANNOUNCER   = 11;
    const int GRIM        = 13;
    const int npc[14]     = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
    const int fncStrtMsId = -2; // -1 = invalid, -2 = non-initialized
    const int infoGrimsId = -1;
    const int infoStartId = -1;
    const int fncGrimRtId = -1;
    const int varChaptrId = -1;
    const int varPlyingId = -1;
    const int oCNpc_daily_routine_offset = 536;
    if (fncStrtMsId == -2) {
        fncStrtMsId = G1CP_GetFuncID("B_InExtremoStartMusic", "void|none");
        fncGrimRtId = G1CP_GetFuncID("Rtn_Start_580", "void|none");
        infoGrimsId = G1CP_GetInfoInstID("DIA_Grim_INEXTREMO");
        infoStartId = G1CP_GetInfoInstID("IE_397_Announcer_ANNOUNCE");
        varChaptrId = G1CP_GetIntVarID("Kapitel", 0);
        varPlyingId = G1CP_GetIntVarID("InExtremoPlaying", 0);
        npc[0]      = G1CP_GetNpcInstID("InExtremo_DrPymonte");
        npc[1]      = G1CP_GetNpcInstID("InExtremo_TheFlail");
        npc[2]      = G1CP_GetNpcInstID("InExtremo_ThomasTheForger");
        npc[3]      = G1CP_GetNpcInstID("InExtremo_Unicorn");
        npc[4]      = G1CP_GetNpcInstID("InExtremo_YellowPfeiffer");
        npc[5]      = G1CP_GetNpcInstID("InExtremo_Lutter");
        npc[6]      = G1CP_GetNpcInstID("InExtremo_Flex");
        npc[7]      = G1CP_GetNpcInstID("IEFan1");
        npc[8]      = G1CP_GetNpcInstID("IEFan2");
        npc[9]      = G1CP_GetNpcInstID("IEFan3");
        npc[10]     = G1CP_GetNpcInstID("IEFan4");
        npc[11]     = G1CP_GetNpcInstID("IE_397_Announcer");
        npc[12]     = G1CP_GetNpcInstID("Charlotte");
        npc[13]     = G1CP_GetNpcInstID("Vlk_580_Grim");
    };

    // All insert way points (should also work without)
    const string wp[13] = {
        "OCR_IE_PYMONTE",
        "OCR_IE_FLAIL",
        "OCR_IE_THOMAS",
        "OCR_IE_UNICORN",
        "OCR_IE_PFEIFFER",
        "OCR_IE_LUTTER",
        "OCR_IE_FLEX",
        "OCR_CROWD_01",
        "OCR_CROWD_02",
        "OCR_CROWD_03",
        "OCR_CROWD_04",
        "OCR_AUDIENCE_02",
        "OCR_AUDIENCE_03"
    };

    // Everything below is executed every time the function is called

    // Check chapter
    if (G1CP_GetIntVarI(varChaptrId, 0, 0) != 2)  {
        return FALSE;
    };

    // Safety first: How could that ever happen?
    if (G1CP_GetIntVarI(varPlyingId, 0, 0))  {
        return FALSE;
    };

    // All checks through: Let's party

    // Check if the concert start by the told status of the announcer
    var int playing; playing = Npc_KnowsInfo(hero, infoStartId);

    // Start the music
    if (playing) {
        MEM_CallById(fncStrtMsId);
    };

    // Insert the NPCs or reinstate their daily routine of everyone (except Grim)
    var C_Npc slf;
    repeat(i, GRIM); var int i;
        var int id; id = MEM_ReadStatArr(npc, i);
        slf = Hlp_GetNpc(id);
        if (!Hlp_IsValidNpc(slf)) {
            Wld_InsertNpc(id, MEM_ReadStatStringArr(wp, i));
            slf = Hlp_GetNpc(id);
        };
        // The announcer and Charlotte have a separate routine
        if (i < ANNOUNCER) || (playing) {
            Npc_ExchangeRoutine(slf, "CONCERT");
        } else {
            Npc_ExchangeRoutine(slf, "ANNOUNCE");
        };
    end;

    // Update Grim's routine (only if it is his default - might have been changed)
    if (playing) {
        if (Npc_KnowsInfo(hero, infoGrimsId)) {
            slf = Hlp_GetNpc(npc[GRIM]);
            if (Hlp_IsValidNpc(slf)) {
                var int rtnId; rtnId = MEM_ReadInt(_@(slf)+oCNpc_daily_routine_offset); // Read func as integer
                if (rtnId == fncGrimRtId) {
                    Npc_ExchangeRoutine(slf, "INEXTREMO");
                };
            };
        };
    };

    // Hope that does it!
    return TRUE;
};


/*
 * Revert the changes
 */
func int G1CP_055_ReactivateInExtremoRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(55)) {
        return FALSE;
    };

    // Get the symbol indices only once
    const int GRIM        = 13;
    const int npc[14]     = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
    const int symbPtr[13] = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
    const int fncStopMsId = -2; // -1 = invalid, -2 = non-initialized
    const int fncGrimRtId = -1;
    const int varChaptrId = -1;
    const int varPlyingId = -1;
    const int oCNpc_daily_routine_offset = 536;
    if (fncStopMsId == -2) {
        fncStopMsId = G1CP_GetFuncID("B_InExtremoStopMusic", "void|none");
        fncGrimRtId = G1CP_GetFuncID("Rtn_InExtremo_580", "void|none");
        varChaptrId = G1CP_GetIntVarID("Kapitel", 0);
        varPlyingId = G1CP_GetIntVarID("InExtremoPlaying", 0);
        npc[0]      = G1CP_GetNpcInstID("InExtremo_DrPymonte");
        npc[1]      = G1CP_GetNpcInstID("InExtremo_TheFlail");
        npc[2]      = G1CP_GetNpcInstID("InExtremo_ThomasTheForger");
        npc[3]      = G1CP_GetNpcInstID("InExtremo_Unicorn");
        npc[4]      = G1CP_GetNpcInstID("InExtremo_YellowPfeiffer");
        npc[5]      = G1CP_GetNpcInstID("InExtremo_Lutter");
        npc[6]      = G1CP_GetNpcInstID("InExtremo_Flex");
        npc[7]      = G1CP_GetNpcInstID("IEFan1");
        npc[8]      = G1CP_GetNpcInstID("IEFan2");
        npc[9]      = G1CP_GetNpcInstID("IEFan3");
        npc[10]     = G1CP_GetNpcInstID("IEFan4");
        npc[11]     = G1CP_GetNpcInstID("IE_397_Announcer");
        npc[12]     = G1CP_GetNpcInstID("Charlotte");
        npc[13]     = G1CP_GetNpcInstID("Vlk_580_Grim");
        symbPtr[0]  = MEM_GetSymbol("InExtremo_DrPymonte");
        symbPtr[1]  = MEM_GetSymbol("InExtremo_TheFlail");
        symbPtr[2]  = MEM_GetSymbol("InExtremo_ThomasTheForger");
        symbPtr[3]  = MEM_GetSymbol("InExtremo_Unicorn");
        symbPtr[4]  = MEM_GetSymbol("InExtremo_YellowPfeiffer");
        symbPtr[5]  = MEM_GetSymbol("InExtremo_Lutter");
        symbPtr[6]  = MEM_GetSymbol("InExtremo_Flex");
        symbPtr[7]  = MEM_GetSymbol("IEFan1");
        symbPtr[8]  = MEM_GetSymbol("IEFan2");
        symbPtr[9]  = MEM_GetSymbol("IEFan3");
        symbPtr[10] = MEM_GetSymbol("IEFan4");
        symbPtr[11] = MEM_GetSymbol("IE_397_Announcer");
        symbPtr[12] = MEM_GetSymbol("Charlotte");
    };

    // We need to properly de-register the NPCs from their MOBs before removing them. Construct an engine call for that
    var int npcPtr;
    var int mobPtr;
    const int oCMobInter__InterruptInteraction = 6812512; //0x67F360
    const int call = 0;
    if (!call) {
        CALL_Open();
        CALL_PtrParam(_@(npcPtr));
        CALL__thiscall(_@(mobPtr), oCMobInter__InterruptInteraction);
        call = CALL_Close();
    };

    // De-register mob users and remove all NPCs (except for Grim)
    var oCNpc slf;
    repeat(i, GRIM); var int i;
        var int id; id = MEM_ReadStatArr(npc, i);
        slf = Hlp_GetNpc(id);
        if (Hlp_IsValidNpc(slf)) {
            if (slf.interactMob) {
                npcPtr = _@(slf);
                mobPtr = slf.interactMob;
                ASM_Run(call);
            };
        };

        Wld_RemoveNpc(id);

        // Removing an NPC like that doesn't cut it here. We need to remove the reference of the instance
        MEM_WriteInt(MEM_ReadStatArr(symbPtr, i) + zCParSymbol_offset_offset, 0);
    end;

    // Special case saving and loading: Do not stop the actual sound of the music
    //if (G1CP_GetIntVarI(varChaptrId, 0, 0) == 2) {
    if (FALSE) {
        // Although this is working as intended, there is no longer any way to reliably determine that the sound is
        // actually running now. Consequently, the sound will start a second time when re-applying the fix.
        // For now, just stop the music and then restart it on re-applying (see else-block)

        var int vobPtr;
        var int bitfieldAddr;
        var int bitfield;
        const int zCVobSound__bitfield_offset = sizeof_zCVob + 4 + 20 + 4 + 4; //288
        const int zCVobSound_isPlaying = 1 << 1;
        const int zCVobSound_enabled   = 1 << 5;

        // Set playing status of sound VOB for saving (sound continues now)
        vobPtr = MEM_SearchVobByName("INEXTREMO_MUSIK");
        if (vobPtr) {
            bitfieldAddr = vobPtr + zCVobSound__bitfield_offset;
            bitfield = MEM_ReadByte(bitfieldAddr);
            MEM_WriteByte(bitfieldAddr, bitfield & ~(zCVobSound_isPlaying | zCVobSound_enabled));
        };

        // Set the status of the music zone
        vobPtr = MEM_SearchVobByName("INEXTREMO_IE");
        if (vobPtr) {
            bitfieldAddr = vobPtr + zCVobSound__bitfield_offset;
            bitfield = MEM_ReadByte(bitfieldAddr);
            MEM_WriteByte(bitfieldAddr, bitfield & ~(zCVobSound_isPlaying | zCVobSound_enabled));
        };

        // Set the variable
        G1CP_SetIntVarI(varPlyingId, 0, FALSE);
    } else {
        // Turn off the music
        MEM_CallById(fncStopMsId);
    };

    // Cannot assume Grim's daily routine is unchanged! Only change it if it is set to "InExtremo"
    slf = Hlp_GetNpc(npc[GRIM]);
    if (Hlp_IsValidNpc(slf)) {
        var int rtnId; rtnId = MEM_ReadInt(_@(slf)+oCNpc_daily_routine_offset); // Read as func as integer
        if (rtnId == fncGrimRtId) {
            Npc_ExchangeRoutine(slf, "START");
        };
    };

    // Silence
    return TRUE;
};


/*
 * Hook after "B_Kapitelwechsel" to enable/disable the InExtremo concert
 */
func void G1CP_055_ReactivateInExtremoHook(var int chapterNum) {
    G1CP_ReportFuncToSpy();

    var int chapterBefore; chapterBefore = G1CP_GetIntVar("Kapitel", 0, 0);

    // First call the original function
    PassArgumentI(chapterNum);
    ContinueCall();

    var int chapterNow; chapterNow = G1CP_GetIntVar("Kapitel", 0, 0);

    // Sanity check
    if (chapterNow == chapterBefore) || (chapterNow != chapterNum) {
        return;
    };

    // Apply/revert fix (call all to update the lookup table properly)
    if (chapterNow == 2) {
        // Enter chapter two: start concert
        MEM_Call(G1CP_GamesaveFixes_Apply);
    } else if (chapterBefore == 2) {
        // Leave chapter two: stop concert but reapply any other fixes
        MEM_Call(G1CP_GamesaveFixes_Revert);
        MEM_Call(G1CP_GamesaveFixes_Apply);
    };
};

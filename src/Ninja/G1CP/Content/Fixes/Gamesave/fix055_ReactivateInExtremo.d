/*
 * #55 Reactivate In Extremo concert
 */

/*
 * One time initialization
 */
func int G1CP_055_ReactivateInExtremo_InitSession() {
    // Check essential functions
    if (!G1CP_IsFunc("B_InsertInExtremo", "void|none"))                          { return FALSE; };
    if (!G1CP_IsFunc("B_KillInExtremo", "void|none"))                            { return FALSE; };
    if (!G1CP_IsFunc("B_InExtremoStartMusic", "void|none"))                      { return FALSE; };
    if (!G1CP_IsFunc("B_InExtremoStopMusic", "void|none"))                       { return FALSE; };
    if (!G1CP_IsFunc("B_Kapitelwechsel", "void|int"))                            { return FALSE; };
    if (!G1CP_IsFunc("B_ExchangeRoutine", "void|int|string"))                    { return FALSE; };

    // Check variables
    if (!G1CP_IsIntVar("InExtremoPlaying", 0))                                   { return FALSE; };
    if (!G1CP_IsIntVar("Kapitel", 0))                                            { return FALSE; };

    // Check NPCs (including fans)
    // Make no exceptions: We are only re-enabling it, not re-creating it
    const int npc[14] = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
    npc[0]  = G1CP_GetNpcInstID("InExtremo_DrPymonte");       if (npc[0]  == -1) { return FALSE; };
    npc[1]  = G1CP_GetNpcInstID("InExtremo_TheFlail");        if (npc[1]  == -1) { return FALSE; };
    npc[2]  = G1CP_GetNpcInstID("InExtremo_ThomasTheForger"); if (npc[2]  == -1) { return FALSE; };
    npc[3]  = G1CP_GetNpcInstID("InExtremo_Unicorn");         if (npc[3]  == -1) { return FALSE; };
    npc[4]  = G1CP_GetNpcInstID("InExtremo_YellowPfeiffer");  if (npc[4]  == -1) { return FALSE; };
    npc[5]  = G1CP_GetNpcInstID("InExtremo_Lutter");          if (npc[5]  == -1) { return FALSE; };
    npc[6]  = G1CP_GetNpcInstID("InExtremo_Flex");            if (npc[6]  == -1) { return FALSE; };
    npc[7]  = G1CP_GetNpcInstID("IE_397_Announcer");          if (npc[7]  == -1) { return FALSE; };
    npc[8]  = G1CP_GetNpcInstID("Charlotte");                 if (npc[8]  == -1) { return FALSE; };
    npc[9]  = G1CP_GetNpcInstID("IEFan1");                    if (npc[9]  == -1) { return FALSE; };
    npc[10] = G1CP_GetNpcInstID("IEFan2");                    if (npc[10] == -1) { return FALSE; };
    npc[11] = G1CP_GetNpcInstID("IEFan3");                    if (npc[11] == -1) { return FALSE; };
    npc[12] = G1CP_GetNpcInstID("IEFan4");                    if (npc[12] == -1) { return FALSE; };
    npc[13] = G1CP_GetNpcInstID("Vlk_580_Grim");              if (npc[13] == -1) { return FALSE; };

    // Check daily routines
    if (!G1CP_IsFunc("Rtn_Start_580", "void|none"))                              { return FALSE; };
    if (!G1CP_IsFunc("Rtn_InExtremo_580", "void|none"))                          { return FALSE; };
    if (!G1CP_IsFunc("Rtn_announce_397", "void|none"))                           { return FALSE; };
    if (!G1CP_IsFunc("Rtn_announce_398", "void|none"))                           { return FALSE; };
    if (!G1CP_IsFunc("Rtn_concert_390", "void|none"))                            { return FALSE; };
    if (!G1CP_IsFunc("Rtn_concert_391", "void|none"))                            { return FALSE; };
    if (!G1CP_IsFunc("Rtn_concert_392", "void|none"))                            { return FALSE; };
    if (!G1CP_IsFunc("Rtn_concert_393", "void|none"))                            { return FALSE; };
    if (!G1CP_IsFunc("Rtn_concert_394", "void|none"))                            { return FALSE; };
    if (!G1CP_IsFunc("Rtn_concert_395", "void|none"))                            { return FALSE; };
    if (!G1CP_IsFunc("Rtn_concert_396", "void|none"))                            { return FALSE; };
    if (!G1CP_IsFunc("Rtn_concert_397", "void|none"))                            { return FALSE; };
    if (!G1CP_IsFunc("Rtn_concert_398", "void|none"))                            { return FALSE; };
    if (!G1CP_IsFunc("Rtn_concert_399", "void|none"))                            { return FALSE; };
    if (!G1CP_IsFunc("Rtn_concert_400", "void|none"))                            { return FALSE; };
    if (!G1CP_IsFunc("Rtn_concert_401", "void|none"))                            { return FALSE; };
    if (!G1CP_IsFunc("Rtn_concert_402", "void|none"))                            { return FALSE; };
    if (!G1CP_IsFunc("Rtn_off_390", "void|none"))                                { return FALSE; };
    if (!G1CP_IsFunc("Rtn_off_391", "void|none"))                                { return FALSE; };
    if (!G1CP_IsFunc("Rtn_off_392", "void|none"))                                { return FALSE; };
    if (!G1CP_IsFunc("Rtn_off_393", "void|none"))                                { return FALSE; };
    if (!G1CP_IsFunc("Rtn_off_394", "void|none"))                                { return FALSE; };
    if (!G1CP_IsFunc("Rtn_off_395", "void|none"))                                { return FALSE; };
    if (!G1CP_IsFunc("Rtn_off_396", "void|none"))                                { return FALSE; };
    if (!G1CP_IsFunc("Rtn_off_397", "void|none"))                                { return FALSE; };
    if (!G1CP_IsFunc("Rtn_off_398", "void|none"))                                { return FALSE; };
    if (!G1CP_IsFunc("Rtn_off_399", "void|none"))                                { return FALSE; };
    if (!G1CP_IsFunc("Rtn_off_400", "void|none"))                                { return FALSE; };
    if (!G1CP_IsFunc("Rtn_off_401", "void|none"))                                { return FALSE; };
    if (!G1CP_IsFunc("Rtn_off_402", "void|none"))                                { return FALSE; };

    // Check Grim's dialog
    if (!G1CP_IsInfoInst("DIA_Grim_INEXTREMO"))                                  { return FALSE; };
    if (!G1CP_GetInfo("DIA_Grim_INEXTREMO"))                                     { return FALSE; };

    // Check that the content of "B_InsertInExtremo" is as expected
    var int funcId1; funcId1 = MEM_GetSymbolIndex("B_InsertInExtremo");
    var int funcId2; funcId2 = MEM_GetFuncID(Wld_InsertNpc);
    var int addr; addr = G1CP_GetFuncStart(funcId1);
    repeat(i, 13); var int i; // All NPCs but Grim
        if (MEM_ReadByte(addr) != zPAR_TOK_PUSHINT)                              { return FALSE; }; addr += 1;
        if (MEM_ReadInt( addr) != MEM_ReadStatArr(npc, i))                       { return FALSE; }; addr += 4;
        if (MEM_ReadByte(addr) != zPAR_TOK_PUSHVAR)                              { return FALSE; }; addr += 1+4;
        if (MEM_ReadByte(addr) != zPAR_TOK_CALLEXTERN)                           { return FALSE; }; addr += 1;
        if (MEM_ReadInt( addr) != funcId2)                                       { return FALSE; }; addr += 4;
    end;
    if (MEM_ReadByte(addr) != zPAR_TOK_RET)                                      { return FALSE; };

    // Check that the content of "B_KillInExtremo" is as expected
    var int funcId3; funcId3 = G1CP_GetCallableOffset("B_ExchangeRoutine");
    addr = G1CP_GetCallableStart("B_KillInExtremo");
    repeat(i, 14); var int i; // All NPCs including Grim
        if (MEM_ReadByte(addr) != zPAR_TOK_PUSHINT)                              { return FALSE; }; addr += 1;
        if (MEM_ReadInt( addr) != MEM_ReadStatArr(npc, i))                       { return FALSE; }; addr += 4;
        if (MEM_ReadByte(addr) != zPAR_TOK_PUSHVAR)                              { return FALSE; }; addr += 1+4;
        if (MEM_ReadByte(addr) != zPAR_TOK_CALL)                                 { return FALSE; }; addr += 1;
        if (MEM_ReadInt( addr) != funcId3)                                       { return FALSE; }; addr += 4;
    end;
    if (MEM_ReadByte(addr) != zPAR_TOK_RET)                                      { return FALSE; };

    // Check that the content of "B_InExtremoStartMusic" is as expected
    var int val;
    var int funcId5; funcId5 = MEM_GetSymbolIndex("B_InExtremoStartMusic");
    var int funcId6; funcId6 = MEM_GetFuncID(Wld_SendTrigger);
    addr = G1CP_GetCallableStartI(funcId5);
    var int varId; varId = MEM_GetSymbolIndex("InExtremoPlaying");
    if (MEM_ReadByte(addr) != zPAR_TOK_PUSHVAR)                                  { return FALSE; }; addr += 5;
    if (MEM_ReadByte(addr) != zPAR_TOK_CALLEXTERN)                               { return FALSE; }; addr += 1;
    if (MEM_ReadInt( addr) != funcId6)                                           { return FALSE; }; addr += 4;
    if (MEM_ReadByte(addr) != zPAR_TOK_PUSHVAR)                                  { return FALSE; }; addr += 5;
    if (MEM_ReadByte(addr) != zPAR_TOK_CALLEXTERN)                               { return FALSE; }; addr += 1;
    if (MEM_ReadInt( addr) != funcId6)                                           { return FALSE; }; addr += 4;
    val = MEM_ReadInt(addr+1);
    if (MEM_ReadByte(addr) == zPAR_TOK_PUSHVAR) {
        val = G1CP_GetIntI(val, 0, 0);
    } else if (MEM_ReadByte(addr) != zPAR_TOK_PUSHINT)                           { return FALSE; }; addr += 1;
    if (val == 0)                                                                { return FALSE; }; addr += 4;
    if (MEM_ReadByte(addr) != zPAR_TOK_PUSHVAR)                                  { return FALSE; }; addr += 1;
    if (MEM_ReadInt( addr) != varId)                                             { return FALSE; }; addr += 4;
    if (MEM_ReadByte(addr) != zPAR_OP_IS)                                        { return FALSE; }; addr += 1;
    if (MEM_ReadByte(addr) != zPAR_TOK_RET)                                      { return FALSE; };

    // Check that the content of "B_InExtremoStopMusic" is as expected
    var int funcId7; funcId7 = MEM_GetSymbolIndex("B_InExtremoStopMusic");
    var int funcId8; funcId8 = MEM_GetFuncID(Wld_SendUnTrigger);
    addr = G1CP_GetCallableStartI(funcId7);
    if (MEM_ReadByte(addr) != zPAR_TOK_PUSHVAR)                                  { return FALSE; }; addr += 5;
    if (MEM_ReadByte(addr) != zPAR_TOK_CALLEXTERN)                               { return FALSE; }; addr += 1;
    if (MEM_ReadInt( addr) != funcId8)                                           { return FALSE; }; addr += 4;
    if (MEM_ReadByte(addr) != zPAR_TOK_PUSHVAR)                                  { return FALSE; }; addr += 5;
    if (MEM_ReadByte(addr) != zPAR_TOK_CALLEXTERN)                               { return FALSE; }; addr += 1;
    if (MEM_ReadInt( addr) != funcId8)                                           { return FALSE; }; addr += 4;
    val = MEM_ReadInt(addr+1);
    if (MEM_ReadByte(addr) == zPAR_TOK_PUSHVAR) {
        val = G1CP_GetIntI(val, 0, 1);
    } else if (MEM_ReadByte(addr) != zPAR_TOK_PUSHINT)                           { return FALSE; }; addr += 1;
    if (val != 0)                                                                { return FALSE; }; addr += 4;
    if (MEM_ReadByte(addr) != zPAR_TOK_PUSHVAR)                                  { return FALSE; }; addr += 1;
    if (MEM_ReadInt( addr) != varId)                                             { return FALSE; }; addr += 4;
    if (MEM_ReadByte(addr) != zPAR_OP_IS)                                        { return FALSE; }; addr += 1;
    if (MEM_ReadByte(addr) != zPAR_TOK_RET)                                      { return FALSE; };

    // Check that the content of "DIA_Grim_INEXTREMO_Info" is as expected: change of routine
    var int funcId9; funcId9 = MEM_GetSymbolIndex("DIA_Grim_INEXTREMO_Info");
    const int bytes[3] = {-1, -1, -1};
    bytes[0] = zPAR_TOK_CALLEXTERN<<24;
    bytes[1] = MEM_GetFuncID(Npc_ExchangeRoutine);
    var int matches; matches = G1CP_FindInFunc(funcId9, _@(bytes)+3, 5);
    var int count; count = MEM_ArraySize(matches);
    if (count == 1) {
        addr = MEM_ArrayRead(matches, 0);
    };
    MEM_ArrayFree(matches);
    if (count != 1) {
        return FALSE;
    };
    varId = MEM_ReadInt(addr-4);
    if (!Hlp_StrCmp(G1CP_GetStringI(varId, 0, ""), "InExtremo")) {
        return FALSE;
    };

    // Check that the function "B_InsertInExtremo" is not called anywhere
    bytes[0] = zPAR_TOK_CALL<<24;
    bytes[1] = G1CP_GetCallableOffsetI(funcId1);
    matches = G1CP_FindInCode(0, 0, _@(bytes)+3, 5, 0);
    count = MEM_ArraySize(matches);
    MEM_ArrayFree(matches);
    if (count != 0) {
        return FALSE;
    };

    // Check that the variable "InExtremoPlaying" is not set anywhere else
    bytes[0] = zPAR_TOK_PUSHVAR<<24;
    bytes[1] = MEM_GetSymbolIndex("InExtremoPlaying");
    bytes[2] = zPAR_OP_IS;
    count = 0;
    matches = G1CP_FindInCode(0, 0, _@(bytes)+3, 6, 0);
    repeat(i, MEM_ArraySize(matches));
        var int offset; offset = MEM_ArrayRead(matches, i) - MEM_Parser.stack_stack;
        var int funcId; funcId = MEM_GetFuncIDByOffset(offset);
        if (funcId != funcId5) && (funcId != funcId7) {
            count = 1;
            break;
        };
    end;
    MEM_ArrayFree(matches);
    if (count != 0) {
        return FALSE;
    };

    // Everything in order!
    return TRUE;
};


/*
 * One time initialization in world
 */
func int G1CP_055_ReactivateInExtremo_InitWorld() {
    return FALSE;
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

    // Check now to apply the fix

    return FALSE;
};


/*
 * Revert the changes
 */
func int G1CP_055_ReactivateInExtremoRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(55)) {
        return FALSE;
    };

    return FALSE;
};

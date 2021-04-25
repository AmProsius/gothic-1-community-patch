/*
 * #58 Player can decelerate falls by fight actions in mid-air
 */
func int G1CP_058_BlockFall() {
    const int oCAIHuman__PC_ActionMove_fightMode = 6373181; //0x613F3D
    const int oCAIHuman__PC_ActionMove_skipped   = 6373243; //0x613F7B

    if (G1CP_CheckBytes(oCAIHuman__PC_ActionMove_fightMode, "8B 8D 2C 01 00 00") == 1) // Must not be hooked
    && (G1CP_CheckBytes(oCAIHuman__PC_ActionMove_skipped,   "8B 4C 24 34")       == 1) {

        // Skip fight action handling when falling by checking "playerAI.aboveFloor > Gil_Values.STEP_HEIGHT"
        const int back = oCAIHuman__PC_ActionMove_fightMode+6;
        const int skip = oCAIHuman__PC_ActionMove_skipped;
        ASM_Open(31+1);
        ASM_2(36235); ASM_4(300);                 // mov    ecx, [ebp+0x12c]
        ASM_2(34265); ASM_4(132);                 // fld    [ebp+0x84]
        ASM_3(2907608);                           // fcomp  [ebp+0x2c]
        ASM_2(57567);                             // fnstsw ax
        ASM_3(4310262);                           // test   ah, 0x41
        ASM_2(33807); ASM_4(skip-ASM_Here()-4);   // jz     skip
        ASM_1(233); ASM_4(back-ASM_Here()-4);     // jmp    back

        // Hook just before the conditional jump
        MemoryProtectionOverride(oCAIHuman__PC_ActionMove_fightMode, 6);
        MEM_WriteByte(oCAIHuman__PC_ActionMove_fightMode, ASMINT_OP_jmp);
        MEM_WriteInt(oCAIHuman__PC_ActionMove_fightMode+1, ASM_Close() - oCAIHuman__PC_ActionMove_fightMode - 5);
        MEM_WriteByte(oCAIHuman__PC_ActionMove_fightMode+5, ASMINT_OP_nop);

        return TRUE;
    } else {
        return FALSE;
    };
};

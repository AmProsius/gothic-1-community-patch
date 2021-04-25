/*
 * #58 Player can decelerate falls by blocking in mid-air
 */
func int G1CP_058_BlockFall() {
    const int oCAIHuman__FightMelee_keyDown = 6362499; // 0x611583

    if (G1CP_CheckBytes(oCAIHuman__FightMelee_keyDown, "E8 D0 5F 16 00") == 1) { // Must not be hooked

        // Skip blocking action when falling by checking "playerAI.aboveFloor > Gil_Values.STEP_HEIGHT"
        const int __ftol = 7828824; //0x777558
        const int addr = 0;
        ASM_Open(23+1);
        ASM_2(34521); ASM_4(132);                 // fld    [esi+0x84]
        ASM_3(2907864);                           // fcomp  [esi+0x2c]
        ASM_2(57567);                             // fnstsw ax
        ASM_3(4310262);                           // test   ah, 0x41
        ASM_2(34063); ASM_4(__ftol-ASM_Here()-4); // jnz    __ftol
        ASM_2(49201);                             // xor    eax, eax
        ASM_1(195);                               // ret
        addr = ASM_Close();

        // Hook just before the conditional jump
        MemoryProtectionOverride(oCAIHuman__FightMelee_keyDown+1, 4);
        MEM_WriteInt(oCAIHuman__FightMelee_keyDown+1, addr - oCAIHuman__FightMelee_keyDown - 5);

        return TRUE;
    } else {
        return FALSE;
    };
};

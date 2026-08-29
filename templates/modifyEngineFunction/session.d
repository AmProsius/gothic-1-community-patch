/*
 * #@ISSUE_NUM@ @LONGNAME@
 */
func int G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@() {
    const int oCNpc__EngineFunctionXYZ = /*### TODO Define memory address ###*/0; //0x000000

    if (G1CP_CheckBytes(oCNpc__EngineFunctionXYZ, "### TODO Original bytes in hex ###") == 1) { // Must not be hooked

        const int back = /*### TODO Jump back address ###*/oCNpc__EngineFunctionXYZ + 5;
        ASM_Open(/*### Length of assembly code + 1 ###*/10+1);
        ASM_1(ASMINT_OP_nop);                     // nop
        ASM_1(ASMINT_OP_nop);                     // nop
        ASM_1(ASMINT_OP_nop);                     // nop
        ASM_1(ASMINT_OP_nop);                     // nop
        ASM_1(ASMINT_OP_nop);                     // nop
        ASM_1(233); ASM_4(back-ASM_Here()-4);     // jmp    back

        MemoryProtectionOverride(oCNpc__EngineFunctionXYZ, /*### Instruction length to overwrite ###*/5);
        MEM_WriteByte(oCNpc__EngineFunctionXYZ, ASMINT_OP_jmp);
        MEM_WriteInt(oCNpc__EngineFunctionXYZ+1, ASM_Close() - oCNpc__EngineFunctionXYZ - 5);

        return TRUE;
    } else {
        return FALSE;
    };
};

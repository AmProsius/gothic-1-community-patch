/*
 * #110 Weird camera distance when sitting on a bench
 */
func int G1CP_110_MobInteractCamera() {
    const int zCAICamera__CheckKeys_camLadder = 4837169; //0x49CF31
    const int zCAICamera__CheckKeys_camXSpeed = 4838623; //0x49D4DF

    if (G1CP_CheckBytes(zCAICamera__CheckKeys_camLadder, "F7 D8 1B C0 40") == 1) // Not hooked
    && (G1CP_CheckBytes(zCAICamera__CheckKeys_camXSpeed, "80 12 7D 00")    == 1) {

        // Write new instructions to check for MOB camera script instance
        const int zSTRING__Search = 4618064; //0x467750
        const string name = "CAMMODMOB";
        ASM_Open(43+1);
        ASM_2(55543);                        // neg    eax
        ASM_2(49177);                        // sbb    eax, eax
        ASM_1(64);                           // inc    eax
        ASM_2(49285);                        // test   eax, eax
        ASM_1(117); ASM_1(28);               // jnz    .back
        ASM_4(606358669);                    // lea    ecx, [esp+0x24]
        ASM_1(106); ASM_1(1);                // push   0x1
        ASM_1(104); ASM_4(STR_toChar(name)); // push   STR_toChar(name)
        ASM_1(106); ASM_1(0);                // push   0x0
        ASM_1(232); ASM_4(zSTRING__Search-ASM_Here()-4);
        ASM_2(53809);                        // xor    edx, edx
        ASM_3(16775299);                     // cmp    eax, 0xFFFFFFFF
        ASM_3(12752143);                     // setnz  dl
        ASM_2(53385);                        // mov    eax, edx
        // .back:
        ASM_1(104); ASM_4(zCAICamera__CheckKeys_camLadder+5);
        ASM_1(195);                          // ret

        // Hook to insert the above instructions
        MemoryProtectionOverride(zCAICamera__CheckKeys_camLadder, 5);
        MEM_WriteByte(zCAICamera__CheckKeys_camLadder, ASMINT_OP_jmp);
        MEM_WriteInt(zCAICamera__CheckKeys_camLadder+1, ASM_Close() - zCAICamera__CheckKeys_camLadder - 5);

        // Overwrite mouse x-speed for MOB camera (includes ladder, climb and death cam)
        MemoryProtectionOverride(zCAICamera__CheckKeys_camXSpeed, 4);
        MEM_WriteInt(zCAICamera__CheckKeys_camXSpeed, _@(FLOATONE));

        return TRUE;
    } else {
        return FALSE;
    };
};

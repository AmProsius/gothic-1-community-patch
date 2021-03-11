/*
 * #163 Castle gate of the Old Camp cannot close
 *
 * To reliably unblock the gate, the collision function of movers is hooked where VOBs report collisions. If the mover
 * in question is the gate of the castle (determined by its name) the return value is changed to false (no collision).
 * To not impact performance (as the collision function is called every frame for moving movers) the instructions are
 * injected with machine code.
 */
func int G1CP_163_CastleGate() {
    const int zCMover__CanThisCollideWith_true = 6177730; //0x5E43C2

    if (G1CP_CheckBytes(zCMover__CanThisCollideWith_true, "5F B8 01 00 00 00 5E C2 04 00") == 1) { // Not hooked

        // Write new instructions to always return false if the mover is the castle gate
        const int ds_lstrcmpiA = 8192708; //0x7D02C4
        const int addr = 0;
        const string name = "EVT_OC_INNERMAINGATE";
        ASM_Open(32+1);
        ASM_3(1066893);                       // lea    eax, [edi+0x10]
        ASM_3(555147);                        // mov    edi, [eax+0x8]
        ASM_2(65413);                         // test   edi, edi
        ASM_1(184);  ASM_4(1);                // mov    eax, 0x1
        ASM_1(116);  ASM_1(12);               // jz     .back
        ASM_1(87);                            // push   edi
        ASM_1(104);  ASM_4(STR_toChar(name)); // push   STR_toChar(name)
        ASM_2(5631); ASM_4(ds_lstrcmpiA);     // call   [ds:lstrcmpiA]
        // .back:
        ASM_1(95);                            // pop    edi
        ASM_1(94);                            // pop    esi
        ASM_3(1218);                          // ret    0x4
        addr = ASM_Close();

        // Hook the end of the collision check to insert the above instructions
        MemoryProtectionOverride(zCMover__CanThisCollideWith_true, 10);
        MEM_WriteByte(zCMover__CanThisCollideWith_true, ASMINT_OP_jmp);
        MEM_WriteInt(zCMover__CanThisCollideWith_true+1, addr - zCMover__CanThisCollideWith_true - 5);
        MEM_WriteInt(zCMover__CanThisCollideWith_true+5, -1869574000); // nop 4 times
        MEM_WriteByte(zCMover__CanThisCollideWith_true+9, ASMINT_OP_nop);

        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * #176 The text of items with no value is incomplete in the inventory
 */
func int G1CP_176_InvItemTextValue() {
    const int oCItemContainer__DrawItemInfo_showText = 6714592; //0x6674E0

    if (G1CP_CheckBytes(oCItemContainer__DrawItemInfo_showText, "8D 44 24 34 50") == 1) // Must not be hooked
    && (G1CP_IsStringConst("NAME_Value", 0)) {

        // Write new instructions to skip display if count is zero and text corresponds to "NAME_Value"
        const string str = ""; str = G1CP_GetStringConst("NAME_Value", 0, str);
        const int ds_lstrcmpiA = 8192708; //0x7D02C4
        const int backAddr = oCItemContainer__DrawItemInfo_showText + 5;
        const int addr = 0;
        ASM_Open(52+1);
        ASM_4(874792077);                    // lea    eax, [esp+0x34]
        ASM_1(80);                           // push   eax
        ASM_1(81);                           // push   ecx
        ASM_1(82);                           // push   edx
        ASM_2(65413);                        // test   edi, edi
        ASM_2(8565);                         // jnz    back
        ASM_3(542859);                       // mov    ecx, [eax+0x8]
        ASM_2(51589);                        // test   ecx, ecx
        ASM_2(6772);                         // jz     back
        ASM_3(553215);                       // push   [eax+0x8]
        ASM_1(104); ASM_4(STR_toChar(str));  // push   STR_toChar(value)
        ASM_2(5631); ASM_4(ds_lstrcmpiA);    // call   [ds:lstrcmpiA]
        ASM_2(49285);                        // test   eax, eax
        ASM_2(2165);                         // jnz    back
        ASM_4(136594631); ASM_4(_@s(""));    // mov    [esp+0x8], _@s("")
        // back:
        ASM_1(90);                           // pop    edx
        ASM_1(89);                           // pop    ecx
        ASM_1(104); ASM_4(backAddr);         // push   oCItemContainer__DrawItemInfo_showText+5
        ASM_1(195);                          // ret
        addr = ASM_Close();

        // Hook just before drawing the left hand side text
        MemoryProtectionOverride(oCItemContainer__DrawItemInfo_showText, 5);
        MEM_WriteByte(oCItemContainer__DrawItemInfo_showText, ASMINT_OP_jmp);
        MEM_WriteInt(oCItemContainer__DrawItemInfo_showText+1, addr - oCItemContainer__DrawItemInfo_showText - 5);

        return TRUE;
    } else {
        return FALSE;
    };
};

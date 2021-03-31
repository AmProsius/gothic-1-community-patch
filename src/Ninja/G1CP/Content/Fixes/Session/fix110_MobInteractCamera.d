/*
 * #110 Weird camera distance when sitting on a bench
 */
func int G1CP_110_MobInteractCamera() {
    const int zCAICamera__CheckKeys_camLadder = 4837145; //0x49CF19
    const string orig = "68 9C 9F 86 00 8D 48 04 C7 84 24 D0 00 00 00 04 00 00 00 E8 0F AB F7 FF F7 D8 1B C0 40";
    if (G1CP_CheckBytes(zCAICamera__CheckKeys_camLadder, orig) == 1) {
        const int bytes[4] = {-1869574000, -1869574000, -1869574000, -1869574000}; // nop 16 times
        var int byteAddr; byteAddr = _@(bytes);
        MemoryProtectionOverride(zCAICamera__CheckKeys_camLadder,   29);
        MEM_CopyBytes(byteAddr, zCAICamera__CheckKeys_camLadder,    16);
        MEM_CopyBytes(byteAddr, zCAICamera__CheckKeys_camLadder+16, 13);
        HookEngineF(zCAICamera__CheckKeys_camLadder, 29, G1CP_110_MobInteractCamera_Hook);
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This hook unlocks the mouse input for all MOB camera instances
 */
func int G1CP_110_MobInteractCamera_Hook() {
    var string curcam; curcam = MEM_ReadString(EAX);
    return (Hlp_StrCmp(curcam, "CAMMODMOBLADDER")) || (STR_IndexOf(curcam, "CAMMODMOB") != -1);
};

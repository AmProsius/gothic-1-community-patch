/*
 * Add G1CP version number in the main menu
 */
func int G1CP_MenuVersionNumber() {
    const int zCMenu__ScreenInit_version = 5047863; //0x4D0637
    const int zCMenu__ScreenInit_modinfo = 5047976; //0x4D06A8

    var string show; show = MEM_GetGothOpt("INTERNAL", "menuShowVersion");
    if (G1CP_CheckBytes(zCMenu__ScreenInit_version, "6A 01 8D 4C 24 20"))
    && (G1CP_CheckBytes(zCMenu__ScreenInit_modinfo, "8B F8") == 1)
    && ((Hlp_StrCmp(show, "TRUE")) || (Hlp_StrCmp(show, "1"))) { // Make sure it will actually be displayed
        HookEngineF(zCMenu__ScreenInit_version, 6, G1CP_MenuVersionNumber_Hook);
        MemoryProtectionOverride(zCMenu__ScreenInit_modinfo, 2); // Remove mod info
        MEM_WriteByte(zCMenu__ScreenInit_modinfo,    49); // xor edi, edi
        MEM_WriteByte(zCMenu__ScreenInit_modinfo+1, 255);
        return TRUE;
    } else {
        return FALSE;
    };
};
func void G1CP_MenuVersionNumber_Hook() {
    // Obtain position
    const int versionPosX_addr = 5047846; //0x4D0626
    const int versionPosY_addr = 5047841; //0x4D0621
    var int x; x = MEM_ReadInt(versionPosX_addr);
    var int y; y = MEM_ReadInt(versionPosY_addr);

    // Arrange on the opposite side of the app version
    var int this; this = MEM_ReadInt(ESI+3104);
    var zCView v; v = _^(this);
    var int xDiff; xDiff = Print_ToVirtual(Print_GetStringWidthPtr(MEM_ReadString(ESP+24), v.font), v.psizex);
    x = PS_VMax - (x + xDiff);

    // Build version string
    var string version; version = G1CP_GetVersionString(TRUE, FALSE, FALSE);
    var int textPtr; textPtr = _@s(version);

    // Place it on the menu
    const int zCView__Print = 7339696; //0x6FFEB0
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(textPtr));
        CALL_IntParam(_@(y));
        CALL_IntParam(_@(x));
        CALL__thiscall(_@(this), zCView__Print);
        call = CALL_End();
    };
};

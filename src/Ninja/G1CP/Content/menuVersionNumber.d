/*
 * Add G1CP version number in the main menu
 */
func void Ninja_G1CP_MenuVersionNumber() {
    const int zCMenu__ScreenInit_version = 5047863; //0x4D0637
    HookEngineF(zCMenu__ScreenInit_version, 6, Ninja_G1CP_MenuVersionNumber_Hook);
};
func void Ninja_G1CP_MenuVersionNumber_Hook() {
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
    var int minor; minor =  Ninja_G1CP_Version % 100;
    var int major; major = (Ninja_G1CP_Version % 10000)   /   100;
    var int  base;  base = (Ninja_G1CP_Version % 1000000) / 10000;
    var string version; version = "G1CP ";
    version = ConcatStrings(version, IntToString(base));
    version = ConcatStrings(version, ".");
    version = ConcatStrings(version, IntToString(major));
    if (minor != 0) {
        version = ConcatStrings(version, ".");
        version = ConcatStrings(version, IntToString(minor));
    };
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
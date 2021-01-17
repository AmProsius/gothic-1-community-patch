/*
 * Initial pre-menu splash screen
 *
 * This file is part of the Gothic 1 Community Patch.
 * https://github.com/AmProsius/gothic-1-community-patch
 */
func void Ninja_G1CP_MenuSplash() {
    MEM_Info("Drawing splash view");

    // Create black screen
    var int viewPtr; viewPtr = ViewPtr_Create(0, 0, PS_VMax, PS_VMax);
    ViewPtr_SetTexture(viewPtr, "DEFAULT.TGA"); // Possibly add a picture here
    ViewPtr_SetColor(viewPtr, COL_BLACK);       // And remove this line
    ViewPtr_SetAlpha(viewPtr, 0);
    ViewPtr_Open(viewPtr);
    ViewPtr_Top(viewPtr);
    var zCView v; v = _^(viewPtr);

    // Add text
    Print_GetScreenSize();
    var int y; y = PS_VMax/2 - Print_ToVirtual(Print_GetFontHeight("FONT_OLD_20_WHITE.TGA")/2, PS_Y);
    Ninja_ViewPtr_AddText(viewPtr, 0, y, "Gothic 1 Community Patch", "FONT_OLD_20_WHITE.TGA", COL_White);
    ViewPtr_AlignText(viewPtr, ALIGN_CENTER);
    var zCViewText vt; vt = _^(MEM_ReadInt(v.textLines_next));
    PrintPtr_SetAlpha(_@(vt), 0);

    // Create fade code
    const int sysEvent                          = 5204672; //0x4F6AC0
    const int CGameManager__InitScreen_Menu     = 4346672; //0x425330
    const int zCInput_Win32__ProcessInputEvents = 5016480; //0x4C8BA0
    const int zCInput_Win32__AnyKeyPressed      = 5015504; //0x4C87D0
    const int mouseState_buttonPressedRight     = 8834240; //0x86CCC0
    const int frame = 0;
    var int timer;
    var int keyPress;
    CALL_Open();
    CALL_PutRetValTo(_@(timer));
    CALL__cdecl(sysGetTimePtr);
    CALL__cdecl(sysEvent);
    CALL__thiscall(MEMINT_gameMan_Pointer_address, CGameManager__InitScreen_Menu);
    CALL__thiscall(zCInput_zinput, zCInput_Win32__ProcessInputEvents);
    CALL_PutRetValTo(_@(keyPress));
    CALL__thiscall(zCInput_zinput, zCInput_Win32__AnyKeyPressed);
    frame = CALL_Close();

    // Time constants
    const int fadeTime  = 1000; // Time for fading in and for fading out
    const int holdTime  =  750; // Time to hold at black screen
    const int pauseTime =  250; // Time at end before returning to program
    const int totalTime = fadeTime + holdTime + fadeTime + pauseTime;

    // Counter variables
    var int start;
    var int stop;
    var int velo;
    var int velo0;

    var int moveVelo;
    var int moveStart;
    var int moveStop;

    // Velocity of view transparency
    start = 0;
    stop = 255;
    velo = fracf(2*(stop - start), (fadeTime*fadeTime));
    velo0 = mulf(velo, mkf(fadeTime));
    velo = negf(velo);

    // Velocity of text movement
    moveStart = vt.posx+150;
    moveStop = vt.posx-100;
    moveVelo = fracf(moveStop-moveStart, totalTime);

    // Start time
    var int t; t = 0;
    var int lastTimer; lastTimer = sysGetTime();

    // Do animation
    while((t<totalTime) && (!keyPress) && (!MEM_ReadInt(mouseState_buttonPressedRight)));
        var int alphaV; var int alphaT;
        var int tf;
        if (t < fadeTime) {
            tf = mkf(t);
        } else if (t >= fadeTime + holdTime) && (t < fadeTime + holdTime + fadeTime) {
            tf = mkf((fadeTime + holdTime + fadeTime) - t);
        };

        // Borrowed from LeGo_Anim8
        alphaV = start + roundf(addf(mulf(mulf(velo,  FLOATHALF), sqrf(tf)), mulf(velo0, tf))); // Slow end
        alphaT = start + roundf(mulf(mulf(negf(velo), FLOATHALF), sqrf(tf)));                   // Slow start
        if (alphaV < 0) { alphaV = 0; } else if (alphaV > 255) { alphaV = 255; };
        if (alphaT < 0) { alphaT = 0; } else if (alphaT > 255) { alphaT = 255; };
        v.alpha = alphaV;
        vt.color = ChangeAlpha(vt.color, alphaT);

        // Add movement to text
        vt.posx = moveStart + roundf(mulf(moveVelo, mkf(t)));

        // Render frame
        ASM_Run(frame);

        // Frame-lock the animation
        t += (timer - lastTimer);
        lastTimer = timer;
    end;

    // Clean up
    ViewPtr_Delete(viewPtr);
    MEM_Info("Drawing splash view DONE");
};

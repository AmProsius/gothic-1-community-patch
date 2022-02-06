/*
 * Set the lens flare effect of a light VOB by its name
 */
func int G1CP_VobLightSetLensflare(var int vobPtr, var string name) {
    if (!Hlp_Is_zCVobLight(vobPtr)) {
        return FALSE;
    };

    // Special case to remove the lens flare by providing an empty string
    if (Hlp_StrCmp(name, "")) {
        var zCVobLight vob; vob = _^(vobPtr);
        vob.lensFlareFXNo = -1;
        vob.lensFlareFX = 0;
        return TRUE;
    };

    const int zCVobLightData__SetLensFlareFXByName = 6147184; //0x5DCC70
    const int zCVobLight_lightData_offset = 256; //0x100
    vobPtr += zCVobLight_lightData_offset;

    const int strPtr = 0;
    const int call = 0;
    if (CALL_Begin(call)) {
        strPtr = _@s(name);
        CALL_PtrParam(_@(strPtr));
        CALL_PutRetValTo(_@(success));
        CALL__thiscall(_@(vobPtr), zCVobLightData__SetLensFlareFXByName);
        call = CALL_End();
    };

    var int success;
    return +success;
};

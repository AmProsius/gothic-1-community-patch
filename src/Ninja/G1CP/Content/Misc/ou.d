/*
 * Get the pointer to an output unit by its script identifier
 */
func int G1CP_GetOu(var string name) {
    const int zCCSManager__LibValidateOU = 4308560; //0x41BE50
    const int zCCsManager__LibGet = 4307504; //0x41BA30
    const int csManPtr = 0;
    const int strPtr = 0;
    const int call = 0;
    if (CALL_Begin(call)) {
        csManPtr = MEM_Game._zCSession_csMan;
        strPtr = _@s(name);
        CALL_PtrParam(_@(strPtr));
        CALL_PutRetValTo(_@(ret));
        CALL__thiscall(_@(csManPtr), zCCSManager__LibValidateOU);
        CALL_PtrParam(_@(ret));
        CALL_PutRetValTo(_@(ret));
        CALL__thiscall(_@(csManPtr), zCCsManager__LibGet);
        call = CALL_End();
    };

    var int ret;
    return +ret;
};


/*
 * Get the pointer of the event message command of an output unit (provided by its pointer)
 */
func int G1CP_GetOuMsg(var int blockPtr) {
    if (!blockPtr) {
        return 0;
    };

    const int zCCSBlock_blockArray_offset = 36; //0x24
    const int zCCSBlockPosition_block_offset = 8; //0x08
    const int zCCSAtomicBlock_command_offset = 44; //0x2C

    var int array; array = MEM_ReadInt(blockPtr + zCCSBlock_blockArray_offset);
    var int atomicBlock; atomicBlock = MEM_ReadInt(array + zCCSBlockPosition_block_offset);
    var int evtMsg; evtMsg = MEM_ReadInt(atomicBlock + zCCSAtomicBlock_command_offset);

    return +evtMsg;
};


/*
 * Replace the text or filename of an output unit (provided by its pointer). The function returns TRUE if the needle
 * matches the current text/filename, i.e. when the replacement was successful.
 * This function is rather internal. Use the functions below.
 */
func int G1CP_ReplaceOuMsgStrP(var int ouPtr, var int strOffset, var string needle, var string replace) {
    var int msgPtr; msgPtr = G1CP_GetOuMsg(ouPtr);
    if (!msgPtr) { // Caution: Expects msgPtr to point to a oCMsgConversation!
        return FALSE;
    };

    // Find string address
    var int msgStrPtr; msgStrPtr = msgPtr + strOffset;

    // Paranoid
    if (MEM_ReadInt(msgStrPtr) != zString__vtbl) {
        return FALSE;
    };

    // Check if matching the needle
    if (STR_Compare(MEM_ReadString(msgStrPtr), needle) == STR_EQUAL) {
        MEM_WriteString(msgStrPtr, replace);
        return TRUE;
    } else {
        return FALSE;
    };
};


/*
 * Replace the text of an output unit
 */
func int G1CP_ReplaceOuTextP(var int ouPtr, var string needle, var string replace) {
    const int oCMsgConversation_text_offset = 68; //0x44
    return G1CP_ReplaceOuMsgStrP(ouPtr, oCMsgConversation_text_offset, needle, replace);
};
func int G1CP_ReplaceOuText(var string ouName, var string needle, var string replace) {
    return G1CP_ReplaceOuTextP(G1CP_GetOu(ouName), needle, replace);
};


/*
 * Replace the filename of an output unit (untested if that will take effect and if the new file will play!)
 */
func int G1CP_ReplaceOuFilenameP(var int ouPtr, var string needle, var string replace) {
    const int oCMsgConversation_name_offset = 88; //0x58
    return G1CP_ReplaceOuMsgStrP(ouPtr, oCMsgConversation_name_offset, needle, replace);
};
func int G1CP_ReplaceOuFilename(var string ouName, var string needle, var string replace) {
    return G1CP_ReplaceOuFilenameP(G1CP_GetOu(ouName), needle, replace);
};

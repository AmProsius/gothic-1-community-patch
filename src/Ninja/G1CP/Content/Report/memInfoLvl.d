/*
 * Extended (but simpler) MEM_Info with more zSpy levels
 */
func void Ninja_G1CP_MEM_InfoLvl(var string text, var int level) {
    const int zerr          = 8821208; //0x8699D8
    const int zERROR_Report = 4489808; //0x448250

    text = ConcatStrings("Q: ", text); // Author tag required to be shown

    var int null;
    var int ptr; ptr = _@s(text);

    const int call  = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(null));   //char * function
        CALL_PtrParam(_@(null));   //char * file
        CALL_IntParam(_@(null));   //int line
        CALL_IntParam(_@(null));   //uint flags
        CALL_IntParam(_@(level));  //uint level
        CALL_PtrParam(_@(ptr));    //zString * message
        CALL_PtrParam(_@(null));   //int errorID (useless)
        CALL_PtrParam(_@(zERR_TYPE_INFO)); //zERROR_TYPE errorType

        CALL_PutRetValTo(0);
        CALL__thiscall(_@(zerr), zERROR_Report);

        call = CALL_End();
    };
};

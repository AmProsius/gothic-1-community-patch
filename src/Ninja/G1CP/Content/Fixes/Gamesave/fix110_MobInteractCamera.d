/*
 * #110 Weird camera distance when sitting on a bench
 */
func int G1CP_110_MobInteractCamera() {
    // Create the instance function detour once per session
    const int inst          = -1;
    const int camParser     =  0;
    const int indicatorAddr =  0;
    if (!indicatorAddr) {
        const int cameraParserPointerAddress = 8823264; //0x86A1E0
        camParser = MEM_ReadInt(cameraParserPointerAddress);
        if (!camParser) {
            return FALSE;
        };

        // Get instance function stack position from symbol
        inst = G1CP_GetAnySymbolIndex(camParser, "CAMMODMOBBENCH");
        var int symbPtr; symbPtr = G1CP_GetAnySymbol(camParser, "CAMMODMOBBENCH");
        if (!symbPtr) || (inst == -1) {
            return FALSE;
        };
        var zCPar_Symbol symb; symb = _^(symbPtr);
        var int instancePos; instancePos = symb.content;
        if (!instancePos) {
            return FALSE;
        };

        // Get content address of the indicator constant
        symbPtr = G1CP_GetAnySymbol(camParser, "G1CP_CAMMODMOBBENCH_APPLIED");
        if (!symbPtr) {
            return FALSE;
        };
        indicatorAddr = symbPtr + zCParSymbol_content_offset;

        // Retrieve the symbol indices
        var int indicatorId; indicatorId = G1CP_GetAnySymbolIndex(camParser, "G1CP_CAMMODMOBBENCH_APPLIED");
        var int bestRangeId; bestRangeId = G1CP_GetAnySymbolIndex(camParser, "CCAMSYS.BESTRANGE");
        var int minRangeId;  minRangeId  = G1CP_GetAnySymbolIndex(camParser, "CCAMSYS.MINRANGE");
        var int maxRangeId;  maxRangeId  = G1CP_GetAnySymbolIndex(camParser, "CCAMSYS.MAXRANGE");

        var int ptr; ptr = MEM_Alloc(18*5 + 11*1);
        MEMINT_OverrideFunc_Ptr = ptr;

        MEMINT_OFTokPar(zPAR_TOK_CALL,    instancePos);

        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, 0);
        MEMINT_OFTokPar(zPAR_TOK_PUSHVAR, indicatorId);
        MEMINT_OFTok(zPAR_OP_IS);

        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, castToIntf(1.20000000));
        MEMINT_OFTokPar(zPAR_TOK_PUSHVAR, bestRangeId);
        MEMINT_OFTok(zPAR_OP_EQUAL);
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, castToIntf(0.500000000));
        MEMINT_OFTokPar(zPAR_TOK_PUSHVAR, minRangeId);
        MEMINT_OFTok(zPAR_OP_EQUAL);
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, castToIntf(1.900000000));
        MEMINT_OFTokPar(zPAR_TOK_PUSHVAR, maxRangeId);
        MEMINT_OFTok(zPAR_OP_EQUAL);
        MEMINT_OFTok(zPAR_OP_AND);
        MEMINT_OFTok(zPAR_OP_AND);
        MEMINT_OFTokPar(zPAR_TOK_JUMPF,   (MEMINT_OverrideFunc_Ptr+44) - MEM_ReadInt(camParser+zCParser_stack_offset));

        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, 1);
        MEMINT_OFTokPar(zPAR_TOK_PUSHVAR, indicatorId);
        MEMINT_OFTok(zPAR_OP_IS);

        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, castToIntf(2.20000000));
        MEMINT_OFTokPar(zPAR_TOK_PUSHVAR, bestRangeId);
        MEMINT_OFTok(zPAR_TOK_ASSIGNFLOAT);
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, castToIntf(1.500000000));
        MEMINT_OFTokPar(zPAR_TOK_PUSHVAR, minRangeId);
        MEMINT_OFTok(zPAR_TOK_ASSIGNFLOAT);
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, castToIntf(2.900000000));
        MEMINT_OFTokPar(zPAR_TOK_PUSHVAR, maxRangeId);
        MEMINT_OFTok(zPAR_TOK_ASSIGNFLOAT);

        MEMINT_OFTok(zPAR_TOK_RET);

        // Change the instance function address in the symbol
        symb.content = ptr - MEM_ReadInt(camParser+zCParser_stack_offset);
    };

    // Call the camera instance function once to check if it worked
    const int objPtr = 0;
    const int call = 0;
    if (CALL_Begin(call)) {
        objPtr = MEM_Alloc(23*4); // Size of CCamSys
        CALL_IntParam(_@(objPtr));
        CALL_IntParam(_@(inst));
        CALL__thiscall(_@(camParser), zCParser__CreateInstance);
        call = CALL_End();
    };

    // Read the indicator constant from the camera scripts
    return MEM_ReadInt(indicatorAddr);
};

/*
 * This function is not necessary but kept for completeness
 */
func int G1CP_110_MobInteractCameraRevert() {
    return TRUE; // Set to reverted!
};

/*
 * #188 Cor Kalom can be told that the weed was delivered multiple times
 *
 * The quest "Taking Weeds to Gomez" is set to LOG_SUCCESS, the variable Kalom_DeliveredWeed is set to TRUE and the
 * condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_188() {
    // Define possibly missing symbols locally
    const int LOG_SUCCESS = 2;

    // Check status of the test
    var int passed; passed = TRUE;

    // Find the dialog condition function
    var int funcId; funcId = MEM_GetSymbolIndex("Info_Kalom_KrautboteBACK_Condition");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Dialog condition 'Info_Kalom_KrautboteBACK_Condition' not found");
        passed = FALSE;
    };

    // Obtain symbol
    var int deliveredWeedPtr; deliveredWeedPtr = MEM_GetSymbol("Kalom_DeliveredWeed");
    if (!deliveredWeedPtr) {
        G1CP_TestsuiteErrorDetail("Variable 'Kalom_DeliveredWeed' not found");
        passed = FALSE;
    };
    deliveredWeedPtr += zCParSymbol_content_offset;

    // Obtain log topic
    if (G1CP_IsFixApplied(24)) {
        var int krautbotePtr; krautbotePtr = MEM_GetSymbol("Kalom_Krautbote");
        if (!krautbotePtr) {
            G1CP_TestsuiteErrorDetail("Variable 'Kalom_Krautbote' not found");
            passed = FALSE;
        };
    } else {
        var int krautbotePtr; krautbotePtr = MEM_GetSymbol("Kalom_DrugMonopol");
        if (!krautbotePtr) {
            G1CP_TestsuiteErrorDetail("Variable 'Kalom_DrugMonopol' not found");
            passed = FALSE;
        };
    };
    krautbotePtr += zCParSymbol_content_offset;

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Back up the values
    var int deliveredWeedBak; deliveredWeedBak = MEM_ReadInt(deliveredWeedPtr);
    var int krautboteBak;     krautboteBak     = MEM_ReadInt(krautbotePtr);

    // Set the variables
    MEM_WriteInt(deliveredWeedPtr, TRUE);
    MEM_WriteInt(krautbotePtr,     LOG_SUCCESS);

    // Backup self and other
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set self and other
    self  = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore self and other
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Restore the variables
    MEM_WriteInt(deliveredWeedPtr, deliveredWeedBak);
    MEM_WriteInt(krautbotePtr, krautboteBak);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};

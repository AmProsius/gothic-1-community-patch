/*
 * #32 Gorn attacks the player in the Free Mine
 */
func int Ninja_G1CP_032_GornAttackFreeMine() {
    if (MEM_FindParserSymbol("B_ReactToMemory")     != -1)
    && (MEM_FindParserSymbol("B_AssessAndMemorize") != -1) {
        HookDaedalusFuncS("B_ReactToMemory", "Ninja_G1CP_032_GornAttackFreeMine_GettingAwayWithMurder");
        HookDaedalusFuncS("B_AssessAndMemorize", "Ninja_G1CP_032_GornAttackFreeMine_PeekMemorize");
        return TRUE;
    };
    return FALSE;
};

/*
 * Intercept "B_ReactToMemory" to selectively delete news and their reaction
 */
func void Ninja_G1CP_032_GornAttackFreeMine_GettingAwayWithMurder() {
    // Define possibly missing symbols locally
    const int NEWS_MURDER       = 200;
    const int NEWS_ATTACK       = 195;
    const int NEWS_DEFEAT       = 185;
    const int NEWS_HASDEFEATED  = 170;
    const int GIL_GRD           = 2;
    const int GIL_STT           = 3;
    const int GIL_VLK           = 5;

    // Update the
    const int updated = FALSE;
    if (!updated) {
        Ninja_G1CP_GetIntVar("NEWS_MURDER", 0, NEWS_MURDER);
        Ninja_G1CP_GetIntVar("NEWS_ATTACK", 0, NEWS_ATTACK);
        Ninja_G1CP_GetIntVar("NEWS_DEFEAT", 0, NEWS_DEFEAT);
        Ninja_G1CP_GetIntVar("NEWS_HASDEFEATED", 0, NEWS_HASDEFEATED);
        Ninja_G1CP_GetIntVar("GIL_GRD", 0, GIL_GRD);
        Ninja_G1CP_GetIntVar("GIL_STT", 0, GIL_STT);
        Ninja_G1CP_GetIntVar("GIL_VLK", 0, GIL_VLK);
        updated = TRUE;
    };

    // Interested in Gorn (Free Mine) only
    if (Hlp_GetInstanceID(self) == MEM_FindParserSymbol("PC_FighterFM")) {
        var int murderNews; murderNews = Npc_HasNews(self, NEWS_MURDER, NULL, NULL);
        if (murderNews) {
            var C_Npc vic; vic = Npc_GetNewsVictim(self, murderNews);
            if (vic.guild == GIL_VLK)
            || (vic.guild == GIL_STT)
            || (vic.guild == GIL_GRD) {
                // And that, kids, is how you get away with murder
                MEM_InfoBox("Got away with murder"); // DEBUG
                Npc_DeleteNews(self, murderNews);
            };
        };


        // ---------
        //  Testing
        // vvvvvvvv

        if (self.aivar[AIV_BEENATTACKED]) {
            MEM_InfoBox("Been attacked!");
        };

        var int defeatNews; defeatNews = Npc_HasNews(self, NEWS_DEFEAT, NULL, NULL);
        if (defeatNews) {
            var C_Npc defVic; defVic = Npc_GetNewsVictim(self, defeatNews);
            var C_Npc defOff; defOff = Npc_GetNewsOffender(self, defeatNews);

            var int s; s = SB_New();
            SB("vic: ");
            if (Hlp_IsValidNpc(defVic)) {
                SB(defVic.name);
            } else {
                SB("None");
            };
            SBc(10); SBc(13);
            SB("off: ");
            if (Hlp_IsValidNpc(defOff)) {
                SB(defOff.name);
            } else {
                SB("None");
            };
            MEM_InfoBox(SB_ToString());
            SB_Destroy();
        };

        // ^^^^^^^^^
        //  Testing
        // ---------

    };

    // Continue with original function
    ContinueCall();
};

/*
 * Peek into "B_AssessAndMemorize" for tracing the origin of news
 */
func void Ninja_G1CP_032_GornAttackFreeMine_PeekMemorize(var int newsid, var int source, var C_Npc witness,
                                                         var C_Npc offender, var C_Npc vict) {

    var int fighterId; fighterId = MEM_FindParserSymbol("PC_FighterFM");

    // if (newsid == NEWS_MURDER) {
        if (Hlp_GetInstanceID(witness) == fighterId)
        || (Hlp_GetInstanceID(offender) == fighterId)
        || (Hlp_GetInstanceID(vict) == fighterId) {

            // Get the origin of the call
            var int callerID; callerID = MEM_GetFuncIDByOffset(MEM_GetCallerStackPos());
            var string callerName; callerName = MEM_ReadString(MEM_GetSymbolByIndex(callerID));

            // Build message
            var int s; s = SB_New();
            SB("nId: "); SBi(newsid); SBc(10); SBc(13);
            SB("src: "); SBi(source); SBc(10); SBc(13);
            SB("wit: ");
            if (Hlp_IsValidNpc(witness)) {
                SB(witness.name);
            } else {
                SB("None");
            };
            SBc(10); SBc(13);
            SB("off: ");
            if (Hlp_IsValidNpc(offender)) {
                SB(offender.name);
            } else {
                SB("None");
            };
            SBc(10); SBc(13);
            SB("vic: ");
            if (Hlp_IsValidNpc(vict)) {
                SB(vict.name);
            } else {
                SB("None");
            };
            SBc(10); SBc(13);
            SB("fnc: "); SB(callerName);
            MEM_InfoBox(SB_ToString());
            MEM_Info(SB_ToString());
            SB_Destroy();
        };
    // };

    // Call the original function
    PassArgumentI(newsid);
    PassArgumentI(source);
    PassArgumentN(witness);
    PassArgumentN(offender);
    PassArgumentN(vict);
    ContinueCall();
};

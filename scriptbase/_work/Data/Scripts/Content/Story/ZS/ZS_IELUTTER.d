/*******************************************
*          Extremo spielt Drumscheit       *
*******************************************/

func void ZS_IELUTTER ()
{
    PrintDebugNpc	(PD_TA_FRAME,"ZS_IELUTTER");
    
	AI_SetWalkmode	(self,NPC_WALK);	
	AI_GotoWP		(self, self.wp);
	AI_AlignToWP	(self);
};

func int ZS_IELUTTER_Loop ()
{
    PrintDebugNpc(PD_TA_LOOP,"ZS_IELUTTER_Loop");

	if	InExtremoPlaying
	{
		// Intro
		AI_UseMob (self, "MDRUMSCHEIT", 1);		// 1
	                                                // 2
		AI_UseMob (self, "MDRUMSCHEIT", 2);      // 3
	                                                // 4
		AI_UseMob (self, "MDRUMSCHEIT", 1);      // 5
	                                                // 6
		AI_UseMob (self, "MDRUMSCHEIT", 2);      // 7
	                                                // 8
		// Verse 1                                          
		AI_UseMob (self, "MDRUMSCHEIT", 1);      // 1
	                                                // 2
		AI_UseMob (self, "MDRUMSCHEIT", 2);      // 3
	                                                // 4
		AI_UseMob (self, "MDRUMSCHEIT", 1);      // 5
	                                                // 6
		AI_UseMob (self, "MDRUMSCHEIT", 2);      // 7
	                                                // 8
		// Refrain	                                        
		AI_UseMob (self, "MDRUMSCHEIT", 3);      // 1
	                                                // 2
		AI_UseMob (self, "MDRUMSCHEIT", 2);      // 3
	                                                // 4
		AI_UseMob (self, "MDRUMSCHEIT", 3);      // 5
	                                                // 6
		AI_UseMob (self, "MDRUMSCHEIT", 2);      // 7
	                                                // 8
		// Bridge                                           
		AI_UseMob (self, "MDRUMSCHEIT", 1);      // 1
	                                                // 2
		// Verse 2                                          
		AI_UseMob (self, "MDRUMSCHEIT", 2);      // 1
	                                                // 2
		AI_UseMob (self, "MDRUMSCHEIT", 1);      // 3
	                                                // 4
		AI_UseMob (self, "MDRUMSCHEIT", 2);      // 5
	                                                // 6
		AI_UseMob (self, "MDRUMSCHEIT", 1);      // 7
	                                                // 8
		// Refrain	                                        
		AI_UseMob (self, "MDRUMSCHEIT", 2);      // 1
	                                                // 2
		AI_UseMob (self, "MDRUMSCHEIT", 3);      // 3
	                                                // 4
		AI_UseMob (self, "MDRUMSCHEIT", 2);      // 5
	                                                // 6
		AI_UseMob (self, "MDRUMSCHEIT", 3);      // 7
	                                                // 8
		// Bridge2                                          
		AI_UseMob (self, "MDRUMSCHEIT", 2);      // 1
	                                                // 2
		AI_UseMob (self, "MDRUMSCHEIT", 3);      // 3
	                                                // 4
		// Verse 3                                          
		AI_UseMob (self, "MDRUMSCHEIT", 2);      // 1
	                                                // 2
		AI_UseMob (self, "MDRUMSCHEIT", 1);      // 3
	                                                // 4
		AI_UseMob (self, "MDRUMSCHEIT", 2);      // 5
	                                                // 6
		AI_UseMob (self, "MDRUMSCHEIT", 1);      // 7
	                                                // 8
		// Refrain                                          
		AI_UseMob (self, "MDRUMSCHEIT", 2);      // 1
	                                                // 2
		AI_UseMob (self, "MDRUMSCHEIT", 3);      // 3
	                                                // 4
		AI_UseMob (self, "MDRUMSCHEIT", 2);      // 5
	                                                // 6
		AI_UseMob (self, "MDRUMSCHEIT", 3);      // 7
	                                                // 8
		// Refrain                                          
		AI_UseMob (self, "MDRUMSCHEIT", 2);      // 1
	                                                // 2
		AI_UseMob (self, "MDRUMSCHEIT", 3);      // 3
	                                                // 4
		AI_UseMob (self, "MDRUMSCHEIT", 2);      // 5
	                                                // 6
		AI_UseMob (self, "MDRUMSCHEIT", 3);      // 7
	                                                // 8
		// Refrain                                          
		AI_UseMob (self, "MDRUMSCHEIT", 2);      // 1
	                                                // 2
		AI_UseMob (self, "MDRUMSCHEIT", 3);      // 3
	                                                // 4
		AI_UseMob (self, "MDRUMSCHEIT", 2);      // 5
	                                                // 6
		AI_UseMob (self, "MDRUMSCHEIT", 3);      // 7
		AI_UseMob		(self, "MDRUMSCHEIT", -1);		// ENDE
	};
	
	return LOOP_CONTINUE;
};

func void ZS_IELUTTER_End ()
{
	AI_UseMob		(self, "MDRUMSCHEIT", -1);		// ENDE
	PrintDebugNpc	(PD_TA_FRAME,"ZS_IELUTTER_End");
};

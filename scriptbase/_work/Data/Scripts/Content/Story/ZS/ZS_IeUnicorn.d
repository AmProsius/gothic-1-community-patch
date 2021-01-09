

/*******************************************
*           Extremo spielt Laute           *
*******************************************/

func void ZS_IEUNICORN ()
{
    PrintDebugNpc	(PD_TA_FRAME,"ZS_IEUNICORN");
    
	AI_SetWalkmode 	(self,NPC_WALK);	
	AI_GotoWP 		(self, self.wp);
	AI_AlignToWP	(self);


};

func int ZS_IEUNICORN_Loop ()
{
    PrintDebugNpc(PD_TA_LOOP,"ZS_IEUNICORN_Loop");

	if	InExtremoPlaying
	{
		// Intro
		AI_UseMob (self, "MLUTE", 1);		// 1
	                                            // 2
		AI_UseMob (self, "MLUTE", 2);        // 3
	                                            // 4
		AI_UseMob (self, "MLUTE", 1);        // 5
	                                            // 6
		AI_UseMob (self, "MLUTE", 2);        // 7
	                                            // 8
		// Verse 1                                      
		AI_UseMob (self, "MLUTE", 1);        // 1
	                                            // 2
		AI_UseMob (self, "MLUTE", 2);        // 3
	                                            // 4
		AI_UseMob (self, "MLUTE", 1);        // 5
	                                            // 6
		AI_UseMob (self, "MLUTE", 2);        // 7
	                                            // 8
		// Refrain	                                    
		AI_UseMob (self, "MLUTE", 2);        // 1
	                                            // 2
	                                            // 3
	                                            // 4
		AI_UseMob (self, "MLUTE", 3);        // 5
	                                            // 6
	                                            // 7
	                                            // 8
		// Bridge                                       
		AI_UseMob (self, "MLUTE", 2);        // 1
	                                            // 2
		// Verse 2                                      
		AI_UseMob (self, "MLUTE", 1);        // 1
	                                            // 2
		AI_UseMob (self, "MLUTE", 2);        // 3
	                                            // 4
		AI_UseMob (self, "MLUTE", 1);        // 5
	                                            // 6
		AI_UseMob (self, "MLUTE", 2);        // 7
	                                            // 8
		// Refrain	                                    
		AI_UseMob (self, "MLUTE", 1);        // 1
	                                            // 2
		AI_UseMob (self, "MLUTE", 2);        // 3
	                                            // 4
		AI_UseMob (self, "MLUTE", 3);        // 5
	                                            // 6
	                                            // 7
	                                            // 8
		// Bridge2                                      
		AI_UseMob (self, "MLUTE", 2);        // 1
	                                            // 2
	                                            // 3
	                                            // 4
		// Verse 3                                      
		AI_UseMob (self, "MLUTE", 3);        // 1
	                                            // 2
	                                            // 3
	                                            // 4
		AI_UseMob (self, "MLUTE", 2);        // 5
	                                            // 6
	                                            // 7
	                                            // 8
		// Refrain                                      
		AI_UseMob (self, "MLUTE", 3);        // 1
	                                            // 2
	                                            // 3
	                                            // 4
		AI_UseMob (self, "MLUTE", 2);        // 5
	                                            // 6
	                                            // 7
	                                            // 8
		// Refrain                                      
		AI_UseMob (self, "MLUTE", 1);        // 1
	                                            // 2
		AI_UseMob (self, "MLUTE", 2);        // 3
	                                            // 4
	    AI_UseMob (self, "MLUTE", 1);        // 5
	                                            // 6
		AI_UseMob (self, "MLUTE", 2);        // 7
	                                            // 8
		// Refrain                                      
		AI_UseMob (self, "MLUTE", 3);        // 1
	                                            // 2
	                                            // 3
	                                            // 4
		AI_UseMob (self, "MLUTE", 1);        // 5
	                                            // 6
		AI_UseMob (self, "MLUTE", 2);        // 7
		AI_UseMob(self, "MLUTE", -1);
	};
	
	return LOOP_CONTINUE;
};


func void ZS_IEUNICORN_End ()
{
	PrintDebugNpc	(PD_TA_FRAME,"ZS_IEUNICORN_End");
	AI_UseMob		(self, "MLUTE", -1);
};

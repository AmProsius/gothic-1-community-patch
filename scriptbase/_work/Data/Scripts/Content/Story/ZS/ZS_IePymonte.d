/*******************************************
*           Extremo spielt Harfe           *
*******************************************/

func void ZS_IEPYMONTE ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_IEPYMONTE");
    
	AI_SetWalkmode (self,NPC_WALK);	
	AI_GotoWP (self, self.wp);
	AI_AlignToWP	(self);
};

func int ZS_IEPYMONTE_Loop ()
{
    PrintDebugNpc(PD_TA_LOOP,"ZS_IEPYMONTE_Loop");

	if	InExtremoPlaying
	{
		// Intro
		AI_UseMob (self, "MHARP", 1);		// 1
	                                            // 2
	                                            // 3
	                                            // 4
		AI_UseMob (self, "MHARP", 2);       // 5
	                                            // 6
	                                            // 7
	                                            // 8
		AI_UseMob (self, "MHARP", 1);       	// 1
	                                            // 2
	                                            // 3
	                                            // 4
		AI_UseMob (self, "MHARP", 2);       // 5
	                                            // 6
	                                            // 7
	                                            // 8
		AI_UseMob (self, "MHARP", 1);       	// 1
	                                            // 2
	                                            // 3
	                                            // 4
		AI_UseMob (self, "MHARP", 2);       // 5
	                                            // 6
	                                            // 7
	                                            // 8
		AI_UseMob (self, "MHARP", 3);       	// 1
	                                            // 2
			                                  		// 1
		AI_UseMob (self, "MHARP", 2);       // 2
	                                            // 3
	                                            // 4
	                                            // 5
	    AI_UseMob (self, "MHARP", 3);       // 6
		                                        // 7
	    		                                // 8
		AI_UseMob (self, "MHARP", 4);       	// 1
		                                        // 2
	                                            // 3
	                                            // 4
	    AI_UseMob (self, "MHARP", 3);       // 5
		                                        // 6
	                                            // 7
	    		                                // 8
		AI_UseMob (self, "MHARP", 2);       	// 1
		                                        // 2
	                                            // 3
	    AI_UseMob (self, "MHARP", 1);       // 4
		                                        	// 1
	                                            // 2
	                                            // 3
	    AI_UseMob (self, "MHARP", 2);       // 4
		                                        // 5
	                                            // 6
	                                            // 7
	    AI_UseMob (self, "MHARP", 3);       // 8
		                                        	// 1
	    	                                    // 2
		AI_UseMob (self, "MHARP", 4);     	// 3
		                                        // 4
	                                            // 5
	                                            // 6
	    AI_UseMob (self, "MHARP", 3);       // 7
		                                        // 8
	                                            	// 1
	                                  		    // 2
	    AI_UseMob (self, "MHARP", 4);		// 3
		                                        // 4
	                                            // 5
	    AI_UseMob (self, "MHARP", 5);       // 6
		                                        // 7
	                                            // 8
	           								       	// 1
		AI_UseMob (self, "MHARP", 4);		// 2
	           									// 3                                 
		      									// 4
		AI_UseMob (self, "MHARP", 3);	    // 5
	                                            // 6
	          									// 7
	          									// 8
		AI_UseMob (self, "MHARP", -1);	// ENDE
	};
	
	return LOOP_CONTINUE;
};

func void ZS_IEPYMONTE_End ()
{	
	AI_UseMob (self, "MHARP", -1);	// ENDE
	PrintDebugNpc(PD_TA_FRAME,"ZS_IEPYMONTE_End");
};

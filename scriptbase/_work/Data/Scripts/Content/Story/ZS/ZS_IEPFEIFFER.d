/*******************************************
*          Extremo spielt Dudelsack        *
*******************************************/

func void ZS_IEPFEIFFER ()
{	
    PrintDebugNpc(PD_TA_FRAME,"ZS_IEPFEIFFER");
    
	AI_SetWalkmode (self,NPC_WALK);	
	AI_GotoWP (self, self.wp);
	AI_AlignToWP	(self);
};

func int ZS_IEPFEIFFER_Loop ()
{
    PrintDebugNpc(PD_TA_LOOP,"ZS_IEPFEIFFER_Loop");

	if	InExtremoPlaying
	{
		AI_UseMob (self, "MPIPE", 1);
	
		// Intro
		AI_UseMob (self, "MPIPE", 1);	    // 1
	                                            // 2
						    // 3
	                                            // 4
		AI_UseMob (self, "MPIPE", 2);	    // 5
	                                            // 6
						    // 7
	                                            // 8
		// Verse 1                                      
		AI_UseMob (self, "MPIPE", 1);	    // 1
	                                            // 2
						    // 3
	                                            // 4
		AI_UseMob (self, "MPIPE", 2);	    // 5
	                                            // 6
						    // 7
	                                            // 8
		// Refrain	                                    
		AI_UseMob (self, "MPIPE", 3);		    // 1
		AI_UseMob (self, "MPIPE", 4);	       // 2
		AI_UseMob (self, "MPIPE", 3);		    // 1
		AI_UseMob (self, "MPIPE", 4);	       // 2
		AI_UseMob (self, "MPIPE", 3);		    // 1
		AI_UseMob (self, "MPIPE", 4);	       // 2
		AI_UseMob (self, "MPIPE", 3);		    // 1
		AI_UseMob (self, "MPIPE", 4);	       // 2
		// Bridge                                       
		AI_UseMob (self, "MPIPE", 3);		    // 1
		AI_UseMob (self, "MPIPE", 4);	       // 2
		// Verse 2                                      
		AI_UseMob (self, "MPIPE", 5);		    // 1
	                                            // 2
	    AI_UseMob (self, "MPIPE", 4);           // 3
	                                            // 4
		AI_UseMob (self, "MPIPE", 5);	     	// 5
	                                            // 6
		AI_UseMob (self, "MPIPE", 4);           // 7
												// 8
		// Refrain	                                    
		AI_UseMob (self, "MPIPE", 3);		    // 1
		AI_UseMob (self, "MPIPE", 4);	       // 2
		AI_UseMob (self, "MPIPE", 3);		    // 1
		AI_UseMob (self, "MPIPE", 4);	       // 2
		AI_UseMob (self, "MPIPE", 3);		    // 1
		AI_UseMob (self, "MPIPE", 4);	       // 2
		AI_UseMob (self, "MPIPE", 3);		    // 1
		AI_UseMob (self, "MPIPE", 4);	       // 2
	
		// Bridge2                                      
		AI_UseMob (self, "MPIPE", 6);
		// Verse 3                                      
		AI_UseMob (self, "MPIPE", 5);
	                                            // 2
		AI_UseMob (self, "MPIPE", 6);           // 3
	                                            // 4
		AI_UseMob (self,"MPIPE",7);     		 // 5
		AI_UseMob (self,"MPIPE",6);			      // 6
		AI_UseMob (self,"MPIPE",7); 		   // 7
	                                            // 8
		// Refrain                                      
		AI_UseMob (self, "MPIPE",2);
		// Refrain                                      
		AI_UseMob (self, "MPIPE",3);      // 1
	                                            // 2
	                                            // 3
	                                            // 4
		AI_UseMob (self, "MPIPE",2);      // 5
	                                            // 6
	                                            // 7
	                                            // 8
		// Refrain                                      
		AI_UseMob (self, "MPIPE",3);      // 1
	                                            // 2
	                                            // 3
	                                            // 4
		AI_UseMob (self, "MPIPE",2);       // 5
	                                            // 6
		
		AI_UseMob (self, "MPIPE", 3);
		AI_UseMob (self, "MPIPE", -1);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_IEPFEIFFER_End ()
{
	AI_UseMob (self, "MPIPE", -1);
	
	PrintDebugNpc(PD_TA_FRAME,"ZS_IEPFEIFFER_End");
};
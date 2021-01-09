/*******************************************
*          Extremo spielt Dudelsack        *
*******************************************/

func void ZS_IEFLEX ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_IEFLEX");
    
	AI_SetWalkmode 	(self,NPC_WALK);	
	AI_GotoWP 		(self, self.wp);
	AI_UseMob 		(self, "MPIPE", 1);
};

func int ZS_IEFLEX_Loop ()
{
    PrintDebugNpc	(PD_TA_LOOP,"ZS_IEFLEX_Loop");

	if	InExtremoPlaying
	{
		// Intro
		AI_UseMob (self, "MPIPE", 3);		// 1		
	                                            // 2        
	                                            // 3        
	                                            // 4        
		AI_UseMob (self, "MPIPE", 2);      // 5        
	                                            // 6        
	                                            // 7        
	                                            // 8        
		// Verse 1                                              
		AI_UseMob (self, "MPIPE", 3);      // 1        
	                                            // 2        
	                                            // 3        
	                                            // 4        
		AI_UseMob (self, "MPIPE", 4);       // 5        
	                                            // 6        
		AI_UseMob (self, "MPIPE", 5);      // 7        
	                                            // 8        
		// Refrain	                                            
		AI_UseMob (self, "MPIPE", 6);       // 1        
		AI_UseMob (self, "MPIPE", 7);       // 2        
		AI_UseMob (self, "MPIPE", 6);    // 3        
	                                            // 4        
		AI_UseMob (self, "MPIPE", 5);      // 5        
	                                            // 6        
		AI_UseMob (self, "MPIPE", 4);           // 7        
	                                            // 8        
		// Bridge                                               
		AI_UseMob (self, "MPIPE", 5);    // 1        
	                                            // 2        
		// Verse 2                                              
		AI_UseMob (self, "MPIPE", 6);      // 1        
	                                            // 2        
	                                            // 3        
	                                            // 4        
		AI_UseMob (self, "MPIPE", 4);      // 5        
	                                            // 6        
	                                            // 7        
	                                            // 8        
		// Refrain	                                            
		AI_UseMob (self, "MPIPE", 6);    // 1        
	                                            // 2        
												// 3        
		AI_UseMob (self, "MPIPE", 8);      // 4        
	                                            // 5        
		AI_UseMob (self, "MPIPE", 7);      // 6        
	    AI_UseMob (self, "MPIPE", 6);        // 7        
		AI_UseMob (self, "MPIPE", 7);       // 8        
		// Bridge2                                              
		AI_UseMob (self, "MPIPE", 6);      // 1        
		AI_UseMob (self, "MPIPE", 7);      // 2        
		AI_UseMob (self, "MPIPE", 6);    // 3        
	                                            // 4        
		// Verse 3                                              
		AI_UseMob (self, "MPIPE", 5);      // 1        
	                                            // 2        
	    AI_UseMob (self, "MPIPE", 6);           // 3        
	                                            // 4        
		AI_UseMob (self, "MPIPE", 5);      // 5        
	                                            // 6        
	                                            // 7        
	                                            // 8        
		// Refrain                                              
											      // 1        
		AI_UseMob (self, "MPIPE", 3);       		// 2        
		AI_UseMob (self, "MPIPE", 4);			// 3        
		AI_UseMob (self, "MPIPE", 3);         // 4        
		AI_UseMob (self, "MPIPE", 4);	    // 5        
	                                            // 6        
		AI_UseMob (self, "MPIPE", 5);          // 7        
	                                            // 8        
		// Refrain                                              
		AI_UseMob (self, "MPIPE", 6);      // 1        
	                                            // 2        
	                                            // 3        
	                                            // 4        
		AI_UseMob (self, "MPIPE", 4);      // 5        
	                                            // 6        
	                                            // 7        
	                                            // 8        
		// Refrain	                                            
		AI_UseMob (self, "MPIPE", 6);      // 1        
	                                            // 2        
	                                            // 3        
	                                            // 4        
		AI_UseMob (self, "MPIPE", 4);       // 5        
	                                            // 6    
		AI_UseMob (self, "MPIPE", 5);    // 7
		AI_UseMob		(self, "MPIPE", -1);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_IEFLEX_End ()
{
    PrintDebugNpc	(PD_TA_FRAME,"ZS_IEFLEX_End");
	AI_UseMob		(self, "MPIPE", -1);
};

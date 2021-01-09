/*******************************************
*           Extremo spielt Cello           *
*******************************************/

func void ZS_IETHOMAS ()
{
    PrintDebugNpc	(PD_TA_FRAME,"ZS_IETHOMAS");
    
	AI_SetWalkmode	(self,NPC_WALK);	
	AI_GotoWP		(self, self.wp);
	AI_AlignToWP	(self);
};
                                     
func int ZS_IETHOMAS_Loop ()
{
    PrintDebugNpc(PD_TA_LOOP,"ZS_IETHOMAS_Loop");
	
	if	InExtremoPlaying
	{
	
		//AI_PlayAni (self, "T_STAND_2_IECELLO");
			
		AI_UseMob (self, "MCELLO", 1);
	
		// Intro
		AI_UseMob (self, "MCELLO", 2);		// 1
	                                            // 2
		AI_UseMob (self, "MCELLO", 1);       // 3
	                                            // 4
		AI_UseMob (self, "MCELLO", 2);       // 5
	                                            // 6
		AI_UseMob (self, "MCELLO", 1);       // 7
	                                            // 8
		// Verse 1                                      
		AI_UseMob (self, "MCELLO", 2);       // 1
	                                            // 2
		AI_UseMob (self, "MCELLO", 1);       // 3
	                                            // 4
		AI_UseMob (self, "MCELLO", 2);       // 5
	                                            // 6
		AI_UseMob (self, "MCELLO", 1);       // 7
	                                            // 8
		// Refrain	                                    
		AI_UseMob (self, "MCELLO", 2);       // 1
		AI_UseMob (self, "MCELLO", 3);       // 2
		AI_UseMob (self, "MCELLO", 2);       // 3
		AI_UseMob (self, "MCELLO", 3);       // 4
		AI_UseMob (self, "MCELLO", 2);       // 5
		AI_UseMob (self, "MCELLO", 3);       // 6
		AI_UseMob (self, "MCELLO", 2);       // 7
		AI_UseMob (self, "MCELLO", 3);       // 8
		// Bridge                                       
		AI_UseMob (self, "MCELLO", 2);       // 1
		AI_UseMob (self, "MCELLO", 3);       // 2
		// Verse 2                                      
		AI_UseMob (self, "MCELLO", 2);       // 1
	                                            // 2
		AI_UseMob (self, "MCELLO", 1);       // 3
	                                            // 4
		AI_UseMob (self, "MCELLO", 2);       // 5
	                                            // 6
		AI_UseMob (self, "MCELLO", 1);       // 7
	                                            // 8
		// Refrain	                                    
		AI_UseMob (self, "MCELLO", 2);       // 1
		AI_UseMob (self, "MCELLO", 3);       // 2
		AI_UseMob (self, "MCELLO", 2);       // 3
		AI_UseMob (self, "MCELLO", 3);       // 4
		AI_UseMob (self, "MCELLO", 2);       // 5
		AI_UseMob (self, "MCELLO", 3);       // 6
		AI_UseMob (self, "MCELLO", 2);       // 7
		AI_UseMob (self, "MCELLO", 3);       // 8
		// Bridge2                                      
		AI_UseMob (self, "MCELLO", 2);       // 1
		AI_UseMob (self, "MCELLO", 3);       // 2
		AI_UseMob (self, "MCELLO", 2);       // 3
		                                        // 4
		// Verse 3                                      
		AI_UseMob (self, "MCELLO", 1);       // 1
	                                            // 2
		AI_UseMob (self, "MCELLO", 2);       // 3
	                                            // 4
		AI_UseMob (self, "MCELLO", 1);       // 5
	                                            // 6
		AI_UseMob (self, "MCELLO", 2);       // 7
	                                            // 8
		// Refrain                                      
		AI_UseMob (self, "MCELLO", 1);       // 1
	                                            // 2
		AI_UseMob (self, "MCELLO", 2);       // 3
	                                            // 4
		AI_UseMob (self, "MCELLO", 1);       // 5
	                                            // 6
		AI_UseMob (self, "MCELLO", 2);       // 7
	                                            // 8
		// Refrain                                      
		AI_UseMob (self, "MCELLO", 3);       // 1
		AI_UseMob (self, "MCELLO", 2);       // 2
		AI_UseMob (self, "MCELLO", 3);       // 3
		AI_UseMob (self, "MCELLO", 2);       // 4
		AI_UseMob (self, "MCELLO", 3);       // 5
		AI_UseMob (self, "MCELLO", 2);       // 6
		AI_UseMob (self, "MCELLO", 3);       // 7
		AI_UseMob (self, "MCELLO", 2);       // 8
		// Refrain                                                
		AI_UseMob (self, "MCELLO", 1);       // 1
	                                            // 2
		AI_UseMob (self, "MCELLO", 2);       // 3
	                                            // 4
		AI_UseMob (self, "MCELLO", 3);       // 5
		AI_UseMob (self, "MCELLO", 2);       // 6
		AI_UseMob (self, "MCELLO", 3);       // 7
		AI_UseMob (self, "MCELLO", 2);       // 8
	
		AI_UseMob (self,"MCELLO", -1);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_IETHOMAS_End ()                                          
{
	AI_UseMob (self,"MCELLO", -1);
	
	PrintDebugNpc(PD_TA_FRAME,"ZS_IETHOMAS_End");
};                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
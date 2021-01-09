/****************************************************
*               NSC sucht PREACH-FP                 *
*          (Basis für personalisierte TAs)          *
****************************************************/

func void ZS_Preach ()
{	
    PrintDebugNpc(PD_TA_FRAME,"ZS_Preach");
    
	B_SetPerception (self);    
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand 
	if !(Npc_IsOnFP(self,"PREACH"))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	if (Wld_IsFPAvailable (self, "PREACH"))
	{
		AI_GotoFP (self,"PREACH");         
		AI_AlignToFP( self );				//Richte Dich aus
	};  
	
    
};

func void ZS_Preach_Loop ()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_Preach_Loop");
		
	AI_Wait(self,1);
	//AI_AlignToFP(self);
};

func void ZS_Preach_End ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_Preach_End");
};


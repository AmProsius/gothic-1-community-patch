func void ZS_Orepile()
{
    B_SetPerception (self);
    
	PrintDebugNpc (PD_TA_FRAME,"ZS_Orepile");	
	
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
	AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	
	AI_AlignToWP (self);
};

func void ZS_Orepile_Loop()
{
	PrintDebugNpc (PD_TA_LOOP,"ZS_Orepile_Loop");
	
	if (Hlp_StrCmp (Npc_GetNearestWP (self) ,"NC_PATH_TO_PIT_03"))
	{
		AI_GotoWP(self, "NC_PATH_AROUND_PIT_02"); 
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self) ,"NC_PATH_AROUND_PIT_02"))
	{
		AI_GotoWP(self, "NC_PATH_AROUND_PIT_04"); 
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self) ,"NC_PATH_AROUND_PIT_04"))
	{
		AI_GotoWP(self, "NC_PATH_AROUND_PIT_06"); 
	}
	else if (Hlp_StrCmp (Npc_GetNearestWP (self) ,"NC_PATH_AROUND_PIT_06"))
	{
		AI_GotoWP(self, "NC_PATH_TO_PIT_03"); 
	};
	
	AI_SetWalkmode (self,NPC_WALK);
	
	AI_AlignToWP (self);
	
	AI_LookAt(self, "FP_OREPILE_CENTER");
	C_StopLookAt(self);
	//AI_PlayAni (self,"R_SCRATCHHEAD");
	
	AI_Wait(self,3);
};	

func void ZS_Orepile_End ()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_Orepile");	
};
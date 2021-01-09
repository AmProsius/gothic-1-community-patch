func void ZS_TestBully()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_TestBully");
	
	B_SetPerception (self);    
	AI_SetWalkmode (self,NPC_WALK);	// Walkmode für den Zustand
	if !(Npc_IsOnFP(self,"BULLY"))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	self.aivar[AIV_ITEMSTATUS] = TA_IT_NONE;
	if (Wld_IsFPAvailable (self, "BULLY_A_"))
	{
		AI_GotoFP (self,"BULLY_A_");
	}
	else if (Wld_IsFPAvailable (self, "BULLY_B_"))
	{
		AI_GotoFP (self,"BULLY_B_");
	}
	else if (Wld_IsFPAvailable (self, "BULLY_C_"))
	{
		AI_GotoFP (self,"BULLY_C_");
	};
	if (Npc_IsOnFP(self,"BULLY"))	
	{
		B_ChooseApple(self);
	};
	
 
};

func int ZS_TestBully_Loop()
{
	PrintDebugNpc (PD_TA_LOOP,"ZS_TestBully_Loop");
	
	var int multireaktion;
	multireaktion = Hlp_Random(1000);

	B_PlayItemRandoms(self);
	
	AI_Wait(self,1);
	AI_AlignToFP(self);
};

func void ZS_TestBully_End ()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_TestBully_End");

	B_ClearItem(self);
};



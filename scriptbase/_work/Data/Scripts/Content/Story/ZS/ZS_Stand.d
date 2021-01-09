func void ZS_Stand()
{
	GuardPerception ();
	Npc_PercEnable  (self,	PERC_ASSESSPLAYER, 	B_AssessSC);
	
	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);
	AI_GotoWP		(self, self.wp);
	
	if (Wld_IsFPAvailable(self,"FP_STAND"))
	{																	
		AI_GotoFP (self, "FP_STAND");
		AI_AlignToFP (self);
	}
	else
	{
		AI_AlignToWP	(self);
	};
	
    AI_PlayAni (self,"T_STAND_2_LGUARD");
};

func void ZS_Stand_loop()
{
	var int zufall;
	zufall = Hlp_Random(100);
	
	if (zufall >= 95)
	{
		//AI_PlayAni (self,"T_LGUARD_2_STAND");
		//AI_PlayAni (self,"T_STAND_2_LGUARD");
	}
	else if (zufall >= 90)
	{
		AI_PlayAni (self,"T_LGUARD_SCRATCH");
	}
	else if (zufall >= 80)
	{
		AI_PlayAni (self,"T_LGUARD_STRETCH");
	}
	else if (zufall >= 70)
	{
		AI_PlayAni (self,"T_LGUARD_CHANGELEG");
	};
	
	AI_Wait		(self, 1);
};

func void ZS_Stand_end()
{
	AI_PlayAni (self,"T_LGUARD_2_STAND");	
};

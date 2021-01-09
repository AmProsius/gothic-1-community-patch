func void ZS_Boss()
{	
	GuardPerception ();
	Npc_PercEnable  (self,	PERC_ASSESSPLAYER, 	B_AssessSC);
	
	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);
	AI_GotoWP		(self, self.wp);
	
	if (Wld_IsFPAvailable(self,"FP_STAND"))
	{																	
		AI_GotoFP (self, "FP_STAND");
		AI_AlignToFP( self );				//Richte Dich aus
	}
	else
	{
		AI_AlignToWP	(self);
	};
	
    AI_PlayAni (self,"T_STAND_2_HGUARD");
};

func void ZS_Boss_loop()
{
	var int zufall;
	zufall = Hlp_Random(1000);
	
	if (zufall >= 950)
    {
    	AI_PlayAni (self,"T_HGUARD_2_STAND");
    	AI_PlayAni (self,"T_STAND_2_HGUARD");
    }
    else if (zufall >= 600)
    {
    	AI_PlayAni (self,"T_HGUARD_LOOKAROUND");
    };
};

func void ZS_Boss_end()
{
    AI_PlayAni (self,"T_HGUARD_2_STAND");
};	



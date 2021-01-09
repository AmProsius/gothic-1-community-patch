func void ZS_TestGotoWP ()
{
	Npc_PercEnable  ( self, PERC_CATCHTHIEF,		ZS_CatchThief );		
	Npc_PercEnable  ( self, PERC_MOVEMOB			,	B_MoveMob			);			
	Npc_PercEnable  ( self,	PERC_ASSESSWARN			,	B_AssessWarn 		);		
	PrintDebugS ("ZS_TestGoto");
	AI_GotoWP (self, self.wp);
};	

func void ZS_TestGotoWP_Loop ()
{
	var C_NPC	player;
	//player	=	 Hlp_GetNpc	( hero);
	//Print 	(player.name);
	Npc_SetTarget 	( self, hero);
	PrintGlobals	(PD_ZS_FRAME);
	
	Npc_GetTarget	( self);	
	AI_GotoNpc		( self, other/*player*/);
	
	AI_Wait	( self, 3);
	return;
};

func void ZS_TestGotoWP_End ()
{
};
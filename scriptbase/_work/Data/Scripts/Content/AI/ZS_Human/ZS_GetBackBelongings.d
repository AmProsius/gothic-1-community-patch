func void ZS_GetBackBelongings ()
// 25.5.00 B_ eingeführt um Designkomform zu sein 3.5.00 Ist umgesetzt wie Design, nur das der ZS in zwei aufgeteilt wurde
{	
	PrintDebugNpc( PD_ZS_FRAME, "ZS_GetBackBelongings" );			
	C_ZSInit();
	
	Npc_PercEnable  ( self, PERC_ASSESSENEMY		,	B_AssessEnemy);
	Npc_PercEnable  ( self,	PERC_ASSESSFIGHTER		,	B_AssessFighter);
	Npc_PercEnable  ( self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage);
	Npc_PercEnable  ( self, PERC_ASSESSMAGIC		,	B_AssessMagic);
	Npc_PercEnable  ( self,	PERC_ASSESSWARN			, 	B_AssessWarn );
	Npc_PercEnable  ( self,	PERC_ASSESSMURDER		,	ZS_AssessMurder);
	Npc_PercEnable  ( self,	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat);
	Npc_PercEnable  ( self,	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound);
	Npc_PercEnable  ( self,	PERC_CATCHTHIEF			,	ZS_CatchThief );
	Npc_PercEnable  ( self, PERC_ASSESSTALK			,	B_RefuseTalkAngry );
	Npc_PercEnable  ( self,	PERC_ASSESSITEM			,	B_GetBackItem_Seen );	
	
	if (C_AmIStronger (self,other))
	{
		PrintDebugNpc( PD_ZS_CHECK, "...NSC is stronger" );
		B_Say 			( self, other, "$IWILLTEACHYOURESPECTFORFOREIGNPROPERTY");
		Npc_SetTarget 	( self, other);
		AI_StartState 	( self, ZS_Attack, 0, "");
	}
	else 
	{
		PrintDebugNpc	( PD_ZS_CHECK, "...NSC is weaker");
		B_Say		 	( self, other, "$GIVEITTOME");
		AI_StartState 	( self, ZS_GetBackBelongingsWait, 0, "");
	};
};

func void  ZS_GetBackBelongingsWait ()
{
	PrintDebugNpc	( PD_ZS_FRAME, "ZS_GetBackBelongingsWait" );			
	Npc_PercEnable  ( self, PERC_ASSESSENEMY		,	B_AssessEnemy		);
	Npc_PercEnable  ( self,	PERC_ASSESSFIGHTER		,	B_AssessFighter		);
	Npc_PercEnable  ( self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage	);
	Npc_PercEnable  ( self, PERC_ASSESSMAGIC		,	B_AssessMagic		);
	Npc_PercEnable  ( self,	PERC_ASSESSWARN			, 	B_AssessWarn 		);
	Npc_PercEnable  ( self,	PERC_ASSESSMURDER		,	ZS_AssessMurder		);
	Npc_PercEnable  ( self,	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat		);
	Npc_PercEnable  ( self,	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable  ( self,	PERC_CATCHTHIEF			,	ZS_CatchThief 		);
	Npc_PercEnable  ( self, PERC_ASSESSTALK			,	B_RefuseTalkAngry 	);
	Npc_PercEnable  ( self,	PERC_ASSESSITEM			,	B_GetBackItem_Seen 	);
	Npc_PercEnable  ( self, PERC_DRAWWEAPON			,	B_GetBackBelongingsThreat);
	Npc_PercEnable  ( self,	PERC_ASSESSTHREAT		,	B_GetBackBelongingsThreat);		
};	

func void  ZS_GetBackBelongingsWait_Loop ()
{
	PrintDebugNpc( PD_ZS_LOOP, "ZS_GetBackBelongingsWait_Loop" );			
	if (Npc_GetDistToNpc ( self, other) > PERC_DIST_INTERMEDIAT)
	{
		PrintDebugNpc( PD_ZS_CHECK, "...Dieb weiter weg!" );			
		B_Say ( self, other, "$YOUCANKEEPTHECRAP");
		self.aivar [AIV_PCISSTRONGER] = 1;
		if (Npc_GetPermAttitude (self,other) != ATT_HOSTILE )
		{
			PrintDebugNpc( PD_ZS_CHECK, "...NSC nicht HOSTILE zum Dieb!" );			
			Npc_SetTempAttitude ( self, ATT_ANGRY);
			AI_ContinueRoutine 	( self);
			return;
		};
		AI_ContinueRoutine ( self);
		return;
	};
	return;
};

func void  ZS_GetBackBelongingsWait_End ()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_GetBackBelongingsWait_End" );				
};

func void B_GetBackBelongingsThreat ()
{	
	PrintDebugNpc( PD_ZS_FRAME, "B_GetBackBelongingsThreat" );				
	B_Say 				( self, other, "$OKAYKEEPIT");
	self.aivar [AIV_PCISSTRONGER] = 1;
	AI_ContinueRoutine 	( self);
};




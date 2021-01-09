//////////////////////////////////////////////////////////////////////////
//	ZS_FollowPC
//	===========
//	Tagesablauf-Zustand: menschlicher NSC folgt dem Spieler in einigem
//	Abstand überall hin.
//////////////////////////////////////////////////////////////////////////
func void ZS_FollowPC()
{
	PrintDebugNpc		(PD_TA_FRAME,	"ZS_FollowPC");
	
	//  Wahrnehmungen aktiv 
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy		);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_FollowPC_AssessSC	);
	Npc_SetPercTime		(self,	1);
	self.senses =		SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage	);
	Npc_PercEnable  	(self,	PERC_ASSESSCASTER		,	B_AssessCaster	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic		);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder		);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat		);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 		);
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob			);			
};

func int ZS_FollowPC_Loop()
{
	PrintDebugNpc		(PD_TA_LOOP,	"ZS_FollowPC_Loop");
	PrintGlobals		(PD_MST_DETAIL);

	//-------- SC-Meister folgen ! --------
	if (Npc_GetDistToNpc(self,hero) > HAI_DIST_FOLLOWPC)
	{
		if	!C_BodyStateContains(self, BS_SWIM)
		{	
			AI_SetWalkmode	(self,	NPC_RUN);
		};
		AI_GotoNpc		(self,	hero);
	}
	else
	{
		B_SmartTurnToNpc(self,	hero);
	};
	
	AI_Wait				(self,	1);
	return				LOOP_CONTINUE;
};

func void ZS_FollowPC_End()
{
	PrintDebugNpc		(PD_TA_FRAME,	"ZS_FollowPC_End");

	self.senses =		hero.senses;

};


func void B_FollowPC_AssessSC()
{
	PrintDebugNpc		(PD_TA_FRAME,	"B_FollowPC_AssessSC");
	
	if (Npc_GetDistToNpc(self,hero) < HAI_DIST_FOLLOWPC)
	{
		PrintDebugNpc	(PD_TA_CHECK,	"...SC-Meister jetzt nahe genug!");
		B_FullStop		(self);
	};

	if (Npc_CheckInfo(self,1))
	{
		PrintDebugNpc	(PD_TA_CHECK,	"...wichtige Info zu vergeben!");
		hero.aivar		[AIV_IMPORTANT] = TRUE; // Dialog KOMMT aufgrund einer Important-Info zustande
		B_FullStop		(other);
		B_FullStop		(self);
		AI_StartState	(self,	ZS_Talk, 0, "");
		return;
	};
};

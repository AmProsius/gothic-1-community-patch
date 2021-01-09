//////////////////////////////////////////////////////////////////////////
//	B_GuidePC_AssessPlayer
//	======================
//	Checkt während dem Laufen die Distanz zum Spieler.
//////////////////////////////////////////////////////////////////////////
func void B_GuidePC_AssessPlayer ()
{
	PrintDebugNpc		(PD_TA_CHECK,	"B_GuidePC_AssessPlayer");
	PrintGlobals		(PD_TA_CHECK);
	
	if (Npc_GetDistToNpc(self, hero) > PERC_DIST_DIALOG)
	{
		PrintDebugNpc	(PD_TA_CHECK,	"...Spieler zu weit entfernt!");
		B_FullStop		(self);
		B_SmartTurnToNpc(self,	hero);
	}
	else if (Npc_CanSeeNpc(self, hero))
	{
		B_AssessSC();
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_GuidePC_AssessCall
//	====================
//	Spielt einfach eine Heran-Wink-Animation ab.
//////////////////////////////////////////////////////////////////////////
func void B_GuidePC_AssessCall ()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"B_GuidePC_AssessCall");		

	AI_TurnToNpc		(self,	other);
	AI_PlayAni			(self,	"T_COMEOVERHERE");
};

//////////////////////////////////////////////////////////////////////////
//	ZS_GuidePC
//	==========
//	Ein TA-Zustand, der zum angegebenen Waypoint geht, aber auf den SC
//	wartet, falls dieser zu weit zurückfällt.
//////////////////////////////////////////////////////////////////////////
func void ZS_GuidePC ()
{
	PrintDebugNpc		(PD_TA_FRAME,	"ZS_GuidePC");
	
	//  Wahrnehmungen aktiv 
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy				);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_GuidePC_AssessPlayer		);
	Npc_SetPercTime		(self,	1);
	self.senses_range	 = HAI_DIST_ASSESS_MONSTER;
	self.senses			 = SENSE_SMELL|SENSE_SEE|SENSE_HEAR;
	
	// Wahrnehmungen passiv
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage			);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic				);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder				);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat				);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound			);
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 					);
	Npc_PercEnable  	(self, 	PERC_ASSESSCALL			,	B_GuidePC_AssessCall		);
};

func int ZS_GuidePC_Loop ()
{	
	PrintDebugNpc		(PD_TA_LOOP,	"ZS_GuidePC_Loop");
	PrintGlobals		(PD_TA_CHECK);

	//-------- Spieler zu weit entfernt ! --------
	if (Npc_GetDistToNpc(self, hero) > PERC_DIST_DIALOG)
	{
		B_GuidePC_AssessPlayer();
	}
	
	//-------- Ziel zu weit entfernt ! --------
	else if (Npc_GetDistToWP(self,self.wp) > PERC_DIST_DIALOG)
	{
		PrintDebugNpc	(PD_TA_CHECK,	"...Ziel noch zu weit entfernt!");
		if	!C_BodyStateContains(self, BS_SWIM)
		{
			AI_SetWalkmode	(self,	NPC_RUN);
		};
		AI_StopLookAt	(self);
		AI_GotoWP		(self,	self.wp);
	}
	
	//-------- Ziel erreicht ! --------
	else
	{
		B_SmartTurnToNpc(self,	hero);
	};

	AI_Wait				(self,	1);		
	return				LOOP_CONTINUE;
};
	
func int ZS_GuidePC_End ()
{	
	PrintDebugNpc		(PD_TA_FRAME,	"ZS_GuidePC_End");

	//-------- aktive Wahrnehmungen wieder auf Default zurückstellen -------
	self.senses_range	 = hero.senses_range;
	self.senses			 = hero.senses;
};



























FUNC VOID B_RefuseTalk()
{
	PrintDebugNpc	(PD_ZS_FRAME,"B_RefuseTalk");
	B_SmartTurnToNpc(self,other);
	B_Say			(self,other,"$NOTNOW");
	C_StopLookAt	(self);
};

// **********************************************************

FUNC void ZS_Talk ()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Talk");
	
	//-------- Verhindern von Mehrfachansprechen der NSCs --------
	if (other.aivar[AIV_INVINCIBLE]==TRUE)
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...SC spricht schon!");
		AI_ContinueRoutine	(self);
		return;				
	};
	
	C_ZSInit();	
	B_SetFaceExpression(self, other); //Attitüde bestimmt Gesichtsausdruck

	self.aivar[AIV_INVINCIBLE]=TRUE;
	other.aivar[AIV_INVINCIBLE]=TRUE;

	//Npc_PercEnable  (self, PERC_ASSESSDAMAGE 		,ZS_ReactToDamage	);
	//Npc_PercEnable  (self, PERC_ASSESSMAGIC		,B_AssessMagic		);
	//Npc_PercEnable  (self, PERC_ASSESSSURPRISE	,ZS_AssessSurprise	);
	//Npc_PercEnable  (self, PERC_ASSESSENEMY		,B_AssessEnemy		);
	//Npc_PercEnable  (self, PERC_ASSESSFIGHTER		,B_AssessFighter	);
	//Npc_PercEnable  (self, PERC_ASSESSTHREAT		,B_AssessFighter	);
	//Npc_PercEnable  (self, PERC_ASSESSWARN		,B_AssessWarn 		);
	//Npc_PercEnable  (self, PERC_ASSESSMURDER		,ZS_AssessMurder	);
	//Npc_PercEnable  (self, PERC_ASSESSDEFEAT		,ZS_AssessDefeat	);
	//Npc_PercEnable  (self, PERC_ASSESSFIGHTSOUND	,B_AssessFightSound	);
	//Npc_PercEnable  (self, PERC_CATCHTHIEF		,ZS_CatchThief 		);
	//Npc_PercEnable  (self, PERC_ASSESSTHEFT		,B_AssessTheft 		);

	// SC zu nah dran
	if (Npc_GetDistToNpc(other,self) < 80) 
	{
		AI_Dodge 		(other);
	};

	// KEIN DIALOG: NSC ist feindlich
	if	(Npc_GetTempAttitude(self,other) == ATT_HOSTILE)
	&&	(self.aivar[AIV_TALKBEFOREATTACK] == FALSE)
	{
		Npc_SetTarget 	(self,	other);
		B_AssessEnemy	();		
	};
	
	// AMBIENT-INFOS werden nur Ambient-NSCs (Nicht-Main-NSCs) zugeordnet, 
	// die KEINE anderen Infos/Aufträge haben
	//if ( (self.npctype != npctype_main) && (self.npctype != npctype_friend) && (!NPC_CheckInfo(self,0)) && (!Npc_CheckInfo(self,1)) )
	//{
	//	B_AssignAmbientInfos (self);
	//};
	
	// SC labert NSC an
	if ( C_BodystateContains(self,BS_WALK) || C_BodystateContains(self,BS_RUN) )
	{
		B_Say (other,self,"$SC_HEYWAITASECOND");
	}
	else if (!Npc_CanSeeNpc(self, hero))
	{
		B_Say (other,self,"$SC_HEYTURNAROUND");
	}
	else
	{
		// nix sagen
	};
	
	// DIALOG geht los, NSC dreht sich zu dir
	if ( (!C_BodystateContains(self, BS_SIT)) || (!Npc_CanSeeNpc(self, hero)) )
	{
		AI_StandUp		(self);
		AI_TurnToNpc	(self,	hero);
	};
	
	B_FullStop			(hero);
	AI_TurnToNpc		(hero,	self); // SC dreht sich zum Npc
				
	// NSC begrüßt dich, wenn der Spieler ihn angesprochen hat
	if (!hero.aivar[AIV_IMPORTANT])
	{
		B_GuildGreetings ();
	};
	
	// Equipment gestohlen?
	B_CheckStolenEquipment ();
	
	// KenneSC-Flag auf TRUE setzen, wenn Main-NSC. (SC-Verkleidung dabei EGAL)
	if ( (self.npctype == npctype_main) || (self.npctype == npctype_friend) )
	{
		Npc_SetKnowsPlayer(self,other);
	};
	
	// NEWS checken, wenn der Spieler ihn angesprochen hat
	if (!hero.aivar[AIV_IMPORTANT])
	{
		B_ReactToMemory ();
	};
		
	//AMBIENT INFOS
	B_AssignAmbientInfos(self);
	
	// Kenne SC (wird für FindNSC-Infos gebraucht)
	self.aivar[AIV_FINDABLE] = TRUE; 
	
	// START Multiple Choice Dialog
	AI_ProcessInfos(self);
};

FUNC INT ZS_Talk_Loop ()
{
    PrintDebugNpc(PD_ZS_LOOP,"ZS_Talk_Loop");
    
   	if (C_BodyStateContains(self,BS_SIT))
	{
   		if (self.aivar[AIV_HANGAROUNDSTATUS] <= 1) //sitzt auf Boden, NICHT auf Bank, etc.
   		{
   			AI_LookAtNpc		(self, other);
   		};
   	};
   	
   	if ( InfoManager_HasFinished() )
   	{
		PrintDebugNpc(PD_ZS_CHECK,"...InfoManager beendet!");
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		//AI_StopLookAt(self); // sitzende NSCs glotzen dem SC nach dem Dialog nach.
		B_ResetFaceExpression(self);
		return LOOP_END;
   	};

   	return LOOP_CONTINUE;
};

FUNC VOID ZS_Talk_End ()
{
    PrintDebugNpc(PD_ZS_FRAME,"ZS_Talk_End");
};



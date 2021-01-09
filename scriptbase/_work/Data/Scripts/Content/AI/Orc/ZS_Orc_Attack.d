func void ZS_Orc_Attack ()
{
	PrintDebugNpc	(PD_ORC_FRAME, "Orc_Attack!" );

	Npc_SetTarget	(self, other );

	Npc_PercEnable	(self,	PERC_ASSESSMAGIC,  	B_AssessMagic); 				//selbe Rkt wie Humans
	Npc_PercEnable	(self,	PERC_ASSESSMURDER,	B_Orc_AssessMurder );
	Npc_PercEnable	(self,	PERC_ASSESSDEFEAT,	B_Orc_AssessDefeat );


	AI_StandUp		(self);
	AI_SetWalkmode 	(self,	NPC_RUN);

	if ( !Npc_HasReadiedWeapon( self ) )
	{
		AI_EquipBestMeleeWeapon( self );
		AI_DrawWeapon( self );
	};
};

func int ZS_Orc_Attack_Loop ()
{
	if ( !Hlp_IsValidNpc( other ))
	{
		PrintDebugNpc	(PD_ORC_CHECK, "Orc_Attack_Loop: ...Ziel ungültig!" );
		return 			LOOP_END;		//Abbruch
	};

	if ( C_NpcIsDown( other ) )
	{	
		PrintDebugNpc	(PD_ORC_CHECK, "Orc_Attack_Loop: Gegner tot" );
		return 			LOOP_END;
	};
		
	if (Npc_GetTarget(self) && !C_NpcIsDown(other)) //other = target
	{
		PrintDebugNpc	(PD_ORC_LOOP, "...Ziel vorhanden!");
		if (C_BodystateContains(other,BS_RUN))
		{
			PrintDebugNpc	(PD_ORC_LOOP, "...Ziel läuft!");
			if (Npc_GetStateTime (self) > 10) // x Sekunden verfolgen
			{
				PrintDebugNpc(PD_ORC_CHECK, "...Ziel schon zu lange verfolgt!");
				AI_PointAtNpc( self, other );
				B_Say( self, other, "$RUNCOWARD" );
				AI_StopPointAt( self );
				return LOOP_END;
			};
		}
		else if (C_BodystateContains(other,BS_SWIM) || C_BodystateContains(other,BS_DIVE))
		{		
				return LOOP_END;
		}
		else
		{
			Npc_SetStateTime (self,0);
		};
		
		AI_Attack		(self); 
	
	}
	else // GetTarget = FALSE
	{
		Npc_PerceiveAll		(self);		// nötig, da Npc_IsNextTargetAvailable() und Npc_GetNextTarget() auf der Liste der zuletzt Wahrgenommenen VOBs beruht
		if (Npc_IsNextTargetAvailable (self))	
		{	
			if (C_NpcIsDown(other))
			{
				return LOOP_END;
			}
			else
			{
				Npc_GetNextTarget (self); 	//target und other werden initialisiert
			};
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Orc_Attack_End ()
{
	PrintDebugNpc	(PD_ORC_FRAME, "ZS_MM_Attack_End");

	Npc_ClearAIQueue(self);
	AI_StandUp		(self);
	AI_PlayAni		(self,	"T_WARN"); //nochmal zum Abschied Drohen
	AI_Wait			(self,	1); 			 //SC hat die Chance, weiter weg zu kommen als AttackRange
	//heir noch SVM
	AI_RemoveWeapon( self );
	AI_ContinueRoutine( self );
};

// **********************************************************************************************


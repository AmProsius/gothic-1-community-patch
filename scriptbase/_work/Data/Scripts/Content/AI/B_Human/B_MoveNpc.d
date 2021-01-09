func void B_MoveNpc ()
{
	PrintDebugNpc		(PD_ZS_DETAIL,	"B_MoveNpc");
	
	if (other.aivar[AIV_INVINCIBLE]==FALSE) //sonst ignorieren!	
	{	
		if (Npc_IsInCutscene(self) || Npc_IsInCutscene(other))									// Befindet sich der Blockierer in einer Cutscene?
		{	
			PrintDebugNpc	(PD_ZS_DETAIL, "...Blockierender oder Blockierter in Cutscene!!!" );				
			return;														//... dann verzeihen wir ihm natürlich -> Abbruch des Checks
		};
	
		if (C_NpcIsDown(other))	// ist der Blockierende kampfunfähig!
		{	
			PrintDebugNpc	(PD_ZS_DETAIL, "...Blockierender ist kampfunfähig!" );				
			return;														//... dann verzeihen wir ihm ebenfalls -> Abbruch des Checks
		};
	
		if (C_NpcTypeIsFriend(self, other))								// Entschärfung von story-kritischen NSCs 
		{
			PrintDebugNpc	(PD_ZS_DETAIL, "...Blockierender ist Freund!" );				
			return;
		};
	
		if (other.aivar[AIV_INVINCIBLE])								// keine Reaktion, wenn der Blockierer gerade im Dialog ist 
		{
			PrintDebugNpc	(PD_ZS_DETAIL, "...Blockierender ist in ZS_Talk!" );				
			return;
		};
	
		if	!C_BodyStateContains(other, BS_STAND)
		{
			PrintDebugNpc	(PD_ZS_DETAIL, "...Blockierender ist in Bewegung!" );				
			return;
		};
	
		if (Npc_GetAttitude (self, other) == ATT_HOSTILE)
		{
			//-------- Blockierender ist feindlich! --------
			PrintDebugNpc	(PD_ZS_DETAIL, "...Blockierender ist feindlich!" );				
			B_AssessEnemy	();
			return;
		}
		else if (!Npc_IsPlayer(other))
		{
			//-------- Blockierender ist kein Spieler! --------
			PrintDebugNpc	(PD_ZS_DETAIL, "...Blockierender ist kein Spieler!" );				
			if (self.level>other.level || (self.level==other.level && self.id>other.id))
			{
				//PrintDebugNpc(PD_ZS_CHECK, "...ich habe Vorfahrt!" );				
				//AI_Dodge(other);		// den anderen aus dem Weg gehen lassen!
				//return;
			}
			else
			{
	/*
				B_FullStop 	(self);
				B_FullStop 	(other);
				AI_Dodge	(other);
				return;
	*/
			};
		}
		else if (C_NpcIsWorker(self))
		{
			//-------- Geblockter ist in unwichtiger Gilde! --------
			PrintDebugNpc	(PD_ZS_DETAIL, "...ich bin unwichter NSC!" );				
			B_FullStop		(self);
			B_SmartTurnToNpc(self,	other);
			AI_StartState 	(self, ZS_MoveNpcFriendlyWait, 0, "");
			return;
		}
		else if	(Npc_GetAttitude ( self, other) == ATT_ANGRY || Npc_GetAttitude ( self, other) == ATT_NEUTRAL )
		&& 		C_AmIStronger(self, other)
		&& 		!C_NpcIsGuard(self)
		&& 		!C_NpcIsGuardArcher(self)
		{
			B_FullStop 		(self);
			B_SmartTurnToNpc(self,	other);
			B_Say 			(self, other, "$OUTOFMYWAY");
			AI_StartState 	(self,ZS_MoveNpcWait, 0, "");	
			return;
		}
		else
		{
			B_FullStop		(self);
			B_SmartTurnToNpc(self,	other);
			B_Say 			(self, other, "$MAKEWAY");
			AI_StartState 	(self, ZS_MoveNpcFriendlyWait, 0, "");
			return;
		};	
	};
};

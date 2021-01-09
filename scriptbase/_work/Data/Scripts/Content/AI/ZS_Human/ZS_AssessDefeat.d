//////////////////////////////////////////////////////////////////////////
//	ZS_AssessDefeat
//	===============
//	Wird ausschließlich von der aktiven Wahrnehmung
//
//	- PERC_ASSESSDEFEAT
//
//	angesprungen. Folgende Voraussetzungen müssen erfüllt sein:
//
//	- keine
//
//	Macht folgendes:
//	1.	Sieg von Monstern
//		->	ZS_AssessMonster
//	2.	Sieg ohne Monsterbeteiligung
//		->	News-Eintrag generieren
//		->	Wachen, deren Schützlinge besiegt wurden 	-> ZS_ProclaimAndPunish
//		->	NSC nach Defeat-Bewertung HOSTILE			-> B_AssessEnemy
//		->	sonst passenden Kommentar abgeben
//////////////////////////////////////////////////////////////////////////
func void ZS_AssessDefeat ()
{	
	PrintDebugNpc			(PD_ZS_FRAME,	"ZS_AssessDefeat" );

	C_ZSInit				();
	
	Npc_PercEnable  		(self,	PERC_ASSESSENEMY	,	B_AssessEnemy		);

	Npc_PercEnable  		(self,	PERC_ASSESSDAMAGE	,	ZS_ReactToDamage	);	
	Npc_PercEnable  		(self,	PERC_ASSESSMAGIC	,	B_AssessMagic		);	
	Npc_PercEnable  		(self,	PERC_ASSESSMURDER	,	ZS_AssessMurder		);		
	Npc_PercEnable  		(self,	PERC_ASSESSSURPRISE	,  	ZS_AssessSurprise	);

	PrintGlobals			(PD_ZS_CHECK);
	if (Npc_CanSeeNpcFreeLOS( self, other))
	{
	
		//-------- Sieg von Monster ! --------
		if (C_NpcIsMonster(other))
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...Sieg von oder über Monster!");
			AI_StartState		(self,	ZS_AssessMonster,	0,	"");
			return;
		}
		
		//-------- Sieg an Monster ! --------
		else if (C_NpcIsMonster(victim))
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...Sieg an Monster!");
			B_WhirlAround 		(self,	victim);
			return;
		};
		
		//-------- Schauen und Merken ! --------
		B_FullStop				( self);
		AI_TurnToNpc			( self,	other);
		C_LookAtNpc 			( self, other);
		B_AssessAndMemorize		( NEWS_DEFEAT, NEWS_SOURCE_WITNESS, self, other, victim); 
		

	
		//-------- Schützling einer Wache wurde umgehauen ! --------
		if (C_ChargeWasAttacked(self, victim, other))
		{ 
			PrintDebugNpc		(PD_ZS_CHECK,	"...NSC ist Wache und ein Schützling wurde besiegt!" );
			B_DrawWeapon		(self,	other);
			AI_StartState	 	(self,  ZS_ProclaimAndPunish, 0, "");
			return;
		}
		
		//-------- HOSTILE zum Sieger ! --------
		else if (Npc_GetTempAttitude(self, other) == ATT_HOSTILE)
		{
			B_AssessEnemy		();
		}
		
		//-------- ANGRY/HOSTILE zum Opfer ! --------
		else if ((Npc_GetTempAttitude(self, victim) == ATT_ANGRY) || (Npc_GetTempAttitude(self, victim) == ATT_HOSTILE))
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...NSC ist angry/hostile zu Besiegtem!" );
			B_Say				(self,	NULL,	"$HEDESERVEDIT");
			C_StopLookAt		(self);
		}
		
		//-------- FRIENDLY/NEUTRAL zum Sieger ! --------
		else if (Npc_GetTempAttitude(self, other) == ATT_FRIENDLY)
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...NSC ist friendly/neutral zum Sieger!" );
			B_Say 				(self,	other,	"$ITWASAGOODFIGHT");
		}
		
		//-------- Default ! --------
		else
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...Default!" );
			B_Say				(self,	NULL,	"$HEDEFEATEDHIM");
		};
	
		AI_Wait					(self,	1);	
		C_StopLookAt			(self);
	 };
	 
}; 



//////////////////////////////////////////////////////////////////////////
//	ZS_AssessEnemy
//	==============
//	Wird angesprungen durch:
//
//	- B_AssessEnemy
//	- ZS_AssessWarn			(wenn hostile zu dem, vor dem gewarnt wurde)
//	- ZS_CatchThief			(jetzt hostile zum Dieb)
//	- ZS_ReactToDamage		(Angreifer ist ein Mensch)
//	- ZS_Talk				(wenn hostile zum Ansprechenden)
//
//	Vorraussetzungen:
//
//	- Enemy ist ein Mensch!
//
//	Es passiert folgendes:
//
//	1.	Ist der NSC stärkere Wache/Boss/Arbeiter		-> Angriff
//	2.	Ist der NSC schwächere/besiegte Wache/Boss		-> Wachen rufen -> Angriff
//	3.	Ist der NSC ein schwächerer/besiegter Arbeiter	-> Wachen rufen -> Flucht
//
//////////////////////////////////////////////////////////////////////////
//	ToDo
//	----
//	- Neuer Fall "Call Comrades" in ZS_AssessWarn einbauen!
//	- ZS_AssessWarn: von ZS_ auf B_AssessEnemy umbauen!
//	- ZS_CatchThief: von ZS_ auf B_AssessEnemy umbauen!
//////////////////////////////////////////////////////////////////////////
func void ZS_AssessEnemy ()
{		
	PrintDebugNpc			(PD_ZS_FRAME,	"ZS_AssessEnemy");
	C_ZSInit				();

	Npc_PercEnable  		(self,	PERC_ASSESSMAGIC	,	B_AssessMagic				);
	Npc_PercEnable  		(self,	PERC_ASSESSMURDER	,	B_CombatAssessMurder		);
	Npc_PercEnable  		(self,	PERC_ASSESSDEFEAT	,	B_CombatAssessDefeat		);
	Npc_PercEnable  		(self,	PERC_CATCHTHIEF		,	ZS_CatchThief				);
	Npc_PercEnable  		(self, 	PERC_ASSESSSURPRISE	,	ZS_AssessSurprise			);

	B_FullStop 				(self);
	B_WhirlAround			(self,	other);
	
	//######## NSC ist WACHE oder BOSS ########
	if	C_NpcIsGuard(self)
	||	C_NpcIsGuardArcher(self)
	||	C_NpcIsBoss(self)
	||	(self.npctype==NPCTYPE_FRIEND)	//solche dürfen niemals fliehen!
	{
		//---- NSC ruft zusätzlich Hilfe ! ----
		if (C_AmIWeaker(self,other) || (Npc_IsPlayer(other) && self.aivar[AIV_WASDEFEATEDBYSC]) )
		{
			B_CallComrades	();
		};
		
		//---- NSC greift an ! ----
		if (Npc_IsPlayer(other))
		{
			B_DrawWeapon	(self,	other);
			AI_StartState	(self,	ZS_ProclaimAndPunish,	0,	"");
			return;
		}
		else
		{
			Npc_SetTarget	(self,	other);
			AI_StartState	(self,	ZS_Attack,	0,	"");
			return;
		};
	}
	
	//######## NSC ist WORKER ########
	else
	{
		//---- Flucht ? ----
		if ( (Npc_IsPlayer(other) && self.aivar[AIV_WASDEFEATEDBYSC]) || C_AmIWeaker(self,other) )
		{
			B_CallGuards	();
			AI_StartState	(self,	ZS_Flee,	0,	"");
			return;
		}

		//---- NSC kämpft ! ----
		else 
		{
			if (Npc_IsPlayer(other))
			{
				B_DrawWeapon(self,	other);
				AI_StartState(self,	ZS_ProclaimAndPunish,	0,	"");
				return;
			}
			else
			{
				Npc_SetTarget(self,	other);
				AI_StartState(self,	ZS_Attack,	0,	"");
				return;
			};
		};
	};	
};





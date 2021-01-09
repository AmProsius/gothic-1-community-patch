//////////////////////////////////////////////////////////////////////////
//
//	ZS_ReactToDamage
//	================
//	Wird durch:
//
//	- PERC_ASSESSDAMAGE
//	- einige Magiezustände	(nachtragen, welche)
//
//	aufgerufen. Vorraussetzungen:
//
//	- keine
//
//	Es passiert folgendes:
//
//	1.	Angreifer ist ein MENSCH
//		->	FRIENDLY zu SC-Angreifer		-> "Was soll das?"	-> dann ANGRY
//		-> 	NEUTRAL/ANGRY zu SC-Angreifer	-> dann HOSTILE		-> ZS_AssessEnemy
//		->	NSC-Angreifer					-> ZS_AssessEnemy
//	2.	Angreifer ist ein MONSTER
//		-> ZS_AssessMonster	  
//
//////////////////////////////////////////////////////////////////////////
func void ZS_ReactToDamage ()
{	
	PrintDebugNpc		(PD_ZS_FRAME,	"ZS_ReactToDamage" );			
	PrintGlobals		(PD_ZS_CHECK);
	C_ZSInit();	

	Npc_PercEnable		(self,	PERC_ASSESSMAGIC	,	B_AssessMagic			);
	Npc_PercEnable		(self,	PERC_ASSESSMURDER	,	B_CombatAssessMurder	);	
	Npc_PercEnable		(self,	PERC_ASSESSDEFEAT	,	B_CombatAssessDefeat	);
	
	B_WhirlAround 		(self, other);

	//-------- spezielle Reaktionen im Kampf --------
	if (self.aivar[AIV_SPECIALCOMBATDAMAGEREACTION])
	{
		B_SpecialCombatDamageReaction();
	};

	//-------- Merken ob Schaden durch Fernkampfwaffe/Magie verursacht wurde --------
	if (Npc_IsInFightMode(other,FMODE_FAR) || Npc_IsInFightMode(other,FMODE_MAGIC))
	{
		self.aivar[AIV_LASTHITBYRANGEDWEAPON] = TRUE;
	}
	else
	{
		self.aivar[AIV_LASTHITBYRANGEDWEAPON] = FALSE;
	};

	//-------- Angreifer ist Mensch/Ork ! --------
	if (!C_NpcIsMonster(other))		
	{
		if (Npc_IsPlayer(other))
		{
			self.aivar[AIV_BEENATTACKED] = 1;
	
			if ((Npc_GetTempAttitude(self,other)==ATT_FRIENDLY) || (self.npctype==NPCTYPE_FRIEND))
			{
				PrintDebugNpc			(PD_ZS_CHECK,	"...NSC FRIENDLY zum Angreifer");
				C_LookAtNpc 			(self,	other);
				B_Say 					(self,	other,	"WHATAREYOUDOING");
				Npc_SetTempAttitude		(self,	ATT_ANGRY);
				AI_ContinueRoutine		(self);
				return;
			}
			else
			{
				PrintDebugNpc			(PD_ZS_CHECK, "...NSC nicht FRIENDLY zum Angreifer!");
	
				if (Npc_GetPermAttitude(self,other) != ATT_HOSTILE)
				{
					Npc_SetPermAttitude	(self,	ATT_ANGRY);
				};
				Npc_SetTempAttitude		(self,	ATT_HOSTILE);
			};
		};
		
		AI_StartState 				(self,	ZS_AssessEnemy,	0, "" );
	}
	
	//-------- Angreifer ist Monster ! --------
	else		
	{	
		AI_StartState 				(self,	ZS_AssessMonster,	0, "" );
	};
};



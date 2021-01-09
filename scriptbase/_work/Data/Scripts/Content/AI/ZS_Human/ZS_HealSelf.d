//////////////////////////////////////////////////////////////////////////
//	ZS_HealSelf
//	=======
//	Wird angesprungen durch
//
//	- ZS_Attack
//	- ZS_Flee
//	- ZS_Unconscious
//
//	Folgende Voraussetzungen müssen erfüllt sein:
//
//	- (keine)
//
//	Macht folgendes:
//	1.	Heilt den NSC so weit wie möglich und nutzt dabei:
//		- Heiltränke
//		- Nahrungsmittel
//	2.	Regeneriert die Mana so weit wie möglich und nutzt dabei:
//		- Manatränke
//////////////////////////////////////////////////////////////////////////
func void ZS_HealSelf ()
{
	PrintDebugNpc		(PD_ZS_CHECK,	"ZS_HealSelf");

	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy			);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTER		,	B_AssessFighter			);

	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage		);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic			);
	Npc_PercEnable  	(self, 	PERC_ASSESSCASTER		,	B_AssessCaster 			);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHREAT		,	B_AssessFighter			);
	Npc_PercEnable  	(self,	PERC_DRAWWEAPON			, 	B_AssessFighter			);		
	Npc_PercEnable  	(self, 	PERC_ASSESSWARN			, 	B_AssessWarn 		 	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder			);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat			);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound		);
	Npc_PercEnable  	(self, 	PERC_CATCHTHIEF			,	ZS_CatchThief 			);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHEFT		,	B_AssessTheft 			);

	PrintGlobals		(PD_ZS_CHECK);

};


func int ZS_HealSelf_Loop ()
{
	PrintDebugNpc		(PD_ZS_LOOP,	"ZS_HealSelf_Loop");

	if 	(self.attribute[ATR_HITPOINTS] == self.attribute[ATR_HITPOINTS_MAX])
	||	(self.flags == NPC_FLAG_IMMORTAL)
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...vollständig geheilt!");
		return			LOOP_END;
	}
	else if (Npc_HasItems(self,ItFo_Potion_Health_03) >0)
	{
		PrintDebugString(PD_ZS_CHECK,	"...", ItFo_Potion_Health_03.description);
		AI_UseItem		(self,	ItFo_Potion_Health_03);
	}
	
	else if (Npc_HasItems(self,ItFo_Potion_Health_02) >0)
	{
		PrintDebugString(PD_ZS_CHECK,	"...", ItFo_Potion_Health_02.description);
		AI_UseItem		(self,	ItFo_Potion_Health_02);
	}
	
	else if (Npc_HasItems (self,ItFo_Potion_Health_01) >0)
	{
		PrintDebugString(PD_ZS_CHECK,	"...", ItFo_Potion_Health_01.description);
		AI_UseItem		(self,	ItFo_Potion_Health_01);
	}
	
	else if (Npc_GetInvItemBySlot(self, INV_FOOD, 1) > 0)	// Abfrage initialisiert 'item'
	{
		PrintDebugString(PD_ZS_CHECK,	"...", item.description);
		AI_UseItem		(self,	item);
	}
	else
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...keine weiteren Heilmittel vorhanden!");
		return			LOOP_END;				// wenn keine 'Heilmittel' mehr vorhanden -> LOOP abbrechen
	};

	return				LOOP_CONTINUE;
};

func void ZS_HealSelf_End ()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"ZS_HealSelf_End");
	AI_StartState		(self,	ZS_HealSelfMana,	1,	"");
};

func void ZS_HealSelfMana ()
{
	PrintDebugNpc		(PD_ZS_CHECK,	"ZS_HealSelfMana");

	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy			);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTER		,	B_AssessFighter			);

	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage		);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic			);
	Npc_PercEnable  	(self, 	PERC_ASSESSCASTER		,	B_AssessCaster 			);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHREAT		,	B_AssessFighter			);
	Npc_PercEnable  	(self,	PERC_DRAWWEAPON			, 	B_AssessFighter			);		
	Npc_PercEnable  	(self, 	PERC_ASSESSWARN			, 	B_AssessWarn 		 	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder			);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat			);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound		);
	Npc_PercEnable  	(self, 	PERC_CATCHTHIEF			,	ZS_CatchThief 			);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHEFT		,	B_AssessTheft 			);
};

func int ZS_HealSelfMana_Loop ()
{
	PrintDebugNpc		(PD_ZS_LOOP,	"ZS_HealSelfMana_Loop");

	if (self.attribute[ATR_MANA] == self.attribute[ATR_MANA_MAX])
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...Mana voll regeneriert!");
		return			LOOP_END;
	}
	
	else if (Npc_HasItems(self,ItFo_Potion_Mana_03) >0)
	{
		PrintDebugString(PD_ZS_CHECK,	"...", ItFo_Potion_Mana_03.description);
		AI_UseItem		(self,	ItFo_Potion_Mana_03);
	}
	
	else if (Npc_HasItems(self,ItFo_Potion_Mana_02) >0)
	{
		PrintDebugString(PD_ZS_CHECK,	"...", ItFo_Potion_Mana_02.description);
		AI_UseItem		(self,	ItFo_Potion_Mana_02);
	}
	
	else if (Npc_HasItems (self,ItFo_Potion_Mana_01) >0)
	{
		PrintDebugString(PD_ZS_CHECK,	"...", ItFo_Potion_Mana_01.description);
		AI_UseItem		(self,	ItFo_Potion_Mana_01);
	}
	
	else
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...keine 'Mana-Regenerierungs-Mittel' mehr vorhanden!");
		return			LOOP_END;				// wenn keine 'Mana-Regenerierungs-Mittel' mehr vorhanden -> LOOP abbrechen
	};

	AI_Wait				(self,	0.5);
	return				LOOP_CONTINUE;
};

func void ZS_HealSelfMana_End ()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"ZS_HealSelfMana_End");
};



//////////////////////////////////////////////////////////////////////////
//	ZS_Intercept
//	============
//	Dieser 'start_state' wird Menschen/Monstern gegeben, die an
//	signifikanten Stellen auf den Spieler warten und ihn unter ALLEN
//	umständen nochmal mit einer important-Info ansprechen müssen, bevor
//	irgendetwas anderes passiert.
//
//	Wird derzeit verwendet für:
//	- die fünf untoten Orc-Priester im Alten Tempel (bevor sie attackieren)
//	- Xardas im Alten Tempel (bevor er sich wieder wegteleportiert)
//////////////////////////////////////////////////////////////////////////
func void ZS_Intercept()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_Intercept");
	
	//  Wahrnehmungen aktiv 
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy			);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_AssessSC				);
	
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	B_InterceptAssessDamage	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_InterceptAssessMagic	);
	Npc_PercEnable  	(self, 	PERC_ASSESSCASTER		,	B_AssessSC				);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHREAT		,	B_AssessSC				);
	
	Npc_SetPercTime		(self,	0.5);
	
	AI_StandUp			(self);				
	AI_SetWalkmode 		(self,	NPC_WALK);		
	AI_GotoWP			(self,	self.wp);		
	AI_AlignToWP		(self);
};

func int ZS_Intercept_Loop ()
{
	PrintDebugNpc		(PD_TA_LOOP,"ZS_Intercept_Loop");
 	
	AI_Wait				(self,	1);
	
	return 	LOOP_CONTINUE;
};

func void ZS_Intercept_End ()
{
	PrintDebugNpc 		(PD_TA_FRAME,"ZS_Intercept_End");
};


func void B_InterceptAssessDamage ()
{
	PrintDebugNpc 		(PD_TA_FRAME,"B_InterceptAssessDamage");

	//-------- Auf Vergabe von Infos & Missionen checken --------
	if (Npc_CheckInfo(self,1))
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...wichtige Info zu vergeben!");
		hero.aivar		[AIV_IMPORTANT] = TRUE; // Dialog KOMMT aufgrund einer Important-Info zustande
		B_FullStop		(self);
		AI_StartState	(self,	ZS_Talk, 1, "");
		return;
	}
	
	else
	{
		B_FullStop		(self);
		AI_StartState	(self,	ZS_ReactToDamage, 0, "");
	};
};

func void B_InterceptAssessMagic ()
{
	PrintDebugNpc 		(PD_TA_FRAME,"B_InterceptAssessMagic");

	//-------- Auf Vergabe von Infos & Missionen checken --------
	if (Npc_CheckInfo(self,1))
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...wichtige Info zu vergeben!");
		hero.aivar		[AIV_IMPORTANT] = TRUE; // Dialog KOMMT aufgrund einer Important-Info zustande
		B_FullStop		(self);
		AI_StartState	(self,	ZS_Talk, 1, "");
		return;
	}
	
	else
	{
		B_FullStop		(self);
		B_AssessMagic	();
	};
};


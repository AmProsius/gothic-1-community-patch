//////////////////////////////////////////////////////////////////////////
//
//	ZS_TurnAway
//	===========
//	Wird durch:
//
//	- ZS_ProclaimAndPunish
//
//	aufgerufen. Vorraussetzungen:
//
//	- 'self' mu� eine Wache sein
//	- 'other' den SC als Menschen beinhalten (es wird trotzdem 'hero' genommen)
//
//	Es passiert folgendes:
//
//	1.	NSC dreht sich vom Feind 'other' weg und ignoriert folgende SC-Aktionen:
//		->	Angriff eines Sch�tzlings
//		->	Sieg �ber einen Sch�tzling
//		->	Mord an einem Sch�tzling
//		->	Diebstahl
//		->	Betreten einer Sch�tzling/eigenen H�tte
//		->	Herumhantieren an Gilden-MOBs (z.B. T�ren oder Tor-Drehkreuze)
//////////////////////////////////////////////////////////////////////////
func void ZS_TurnAway ()
{	
	PrintDebugNpc		(PD_ZS_FRAME,	"ZS_TurnAway" );			
	C_ZSInit();	

	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy				);

	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage			);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic				);

	B_RemoveWeapon		(self);
	AI_TurnAway			(self,	hero);
	B_Say				(self,	NULL,	"$LookAway");
};

func int ZS_TurnAway_Loop()
{
	PrintDebugNpc		(PD_ZS_LOOP,	"ZS_TurnAway_Loop" );	
	
	if (Npc_GetStateTime(self) > HAI_TIME_TURNAWAY)
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...TurnAway-Zeit abgelaufen!" );	
		return			LOOP_END;
	};	

	AI_Wait				(self,	1);
	AI_TurnAway			(self,	hero);
	return				LOOP_CONTINUE;
};



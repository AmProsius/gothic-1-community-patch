//////////////////////////////////////////////////////////////////////////
//	ZS_AssessFighter
//	================
//	Wird ausschließlich aus:
//
//	- B_AssessFighter
//
//	heraus aufgerufen. Dort wurde festgestellt, daß die gezogene
//	Waffe des SCs eine Bedrohung darstellt!  Diese Funktion muß also
//	auf diese echte Bedrohung reagieren. Was passiert:
//
//	1.	schon mal vom SC besiegt	->	Zurückweichen
//	2.	NSC ist WACHE oder BOSS		->	Aufforderung Waffe/Magie
//										wegzustecken 	
//	3.	NSC ist ARBEITER
//		- stärker als SC			-> 	Aufforderung Waffe/Magie
//										wegzustecken
//		- schwächer als SC			-> 	Zurückweichen
//
//	Bei Aufforderung, Waffe/Zauber wegzustecken, passiert folgendes:
//
//	- Nahkampfwaffe:	weggesteckt					-> B_AssessRemoveWeapon
//						aus HAI_DIST_MELEE raus		-> Abbruch
//	- Fernkampfwaffe:	weggesteckt 				-> B_AssessRemoveWeapon
//						aus HAI_DIST_RANGED raus	-> Abbruch
//	- Zauberspruch:		weggesteckt 				-> B_AssessRemoveWeapon
//						aus HAI_DIST_RANGED raus	-> Abbruch
//	- Wartezeit abgelaufen							-> ZS_Attack
//////////////////////////////////////////////////////////////////////////
func void ZS_AssessFighter ()
{	
	PrintDebugNpc		(PD_ZS_FRAME,	"ZS_AssessFighter");	
	PrintGlobals		(PD_ZS_CHECK);
	
	//-------- Wahrnehmungen --------
	Npc_PercEnable  	(self,	PERC_ASSESSENEMY		,	B_AssessEnemy		);

	Npc_PercEnable	 	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage	);		
	Npc_PercEnable  	(self,	PERC_ASSESSMAGIC 		,	B_AssessMagic		);
	Npc_PercEnable 	 	(self, 	PERC_ASSESSCASTER		,	B_AssessCaster 		);
	Npc_PercEnable		(self,	PERC_ASSESSTHREAT		,	B_AssessThreat		);
	Npc_PercEnable  	(self,	PERC_ASSESSMURDER		,	ZS_AssessMurder		);	
	Npc_PercEnable		(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat		);		
	Npc_PercEnable  	(self,	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable  	(self,	PERC_ASSESSQUIETSOUND	,	B_AssessQuietSound	);
	Npc_PercEnable		(self,	PERC_ASSESSREMOVEWEAPON	,	B_AssessRemoveWeapon);

	self.aivar[AIV_FIGHTSPEACHFLAG] = 0;

	C_ZSInit			();
	B_FullStop 			(self);
	B_WhirlAround		(self,	other);

	//-------- Wird der NSC zurückweichen ? --------
	if (	self.aivar[AIV_WASDEFEATEDBYSC] 					||		// Wurde NSC schon mal besiegt, oder...
			(C_NpcIsWorker(self) && C_AmIWeaker(self, other))		)	// ...ist NSC ein schwächerer WORKER ?
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...NSC wird zurückweichen!");
		
		if (Npc_GetPermAttitude(self,other)!=ATT_HOSTILE)
		{
			B_SayOverlay	(self,	other,	"$YESYES");
		};
		
		if (Npc_GetDistToNpc(self,other)<HAI_DIST_MELEE)
		{
			AI_Dodge	(self);
		};
		
		if (Npc_GetPermAttitude(self,other)!=ATT_HOSTILE)
		{
			AI_Wait			(self,	3);
		};
		
		AI_ContinueRoutine(self);
	}

	//-------- ...KEIN Zurückweichen ! --------
	else
	{
		Npc_PercEnable	(self, 	PERC_ASSESSREMOVEWEAPON	,	B_AssessRemoveWeapon);	// Wahrnehmung erst hier einschalten, damit ein zurückweichender NSC nicht auf ein schnelles Waffenwegstecken des SCs reagiert!
		Npc_PercEnable	(self,	PERC_ASSESSTHREAT		,	B_AssessThreat		);	// dito
		B_DrawWeapon 	(self,	other);
	};
};

func int ZS_AssessFighter_Loop ()
{	
	PrintDebugNpc		(PD_ZS_LOOP,	"ZS_AssessFighter_Loop");	

	//######## SC in Nahkampfdistanz ! ########
	if (Npc_GetDistToNpc(self,other) < HAI_DIST_ABORT_MELEE)
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...SC ist in Nahkampfdistanz!");

		//---- Passender Kommentar ! ----
		if (self.aivar[AIV_FIGHTSPEACHFLAG]==0) 
		{
			if (Npc_IsInFightMode(other, FMODE_MAGIC))
			{
				B_Say 		(self,	other, "$STOPMAGIC");
			}
			else
			{
				B_Say 		(self, other, "$WEAPONDOWN");
			};
			self.aivar		[AIV_FIGHTSPEACHFLAG] = 1;
		};

		//---- Wartezeit abgelaufen ? ----
		if (Npc_GetStateTime(self) > 5)
		{
			PrintDebugNpc	(PD_ZS_CHECK, "...Zeit abgelaufen!");
			AI_StartState 	(self,	ZS_AssessFighterWait,	0 ,	""); 
		};
	}

	//######## SC in Fernkampfdistanz ! ########
	else if (Npc_GetDistToNpc(self,other) < HAI_DIST_ABORT_RANGED)
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...SC ist in Fernkampfdistanz!");
		if (!Npc_IsInFightMode(other, FMODE_FAR) && !Npc_IsInFightMode(other, FMODE_MAGIC) )
		{
			return			LOOP_END;
		};
	}

	//######## SC ist ganz weit weg ! ########
	else
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...SC ist außerhalb Fernkampfdistanz!");
		return				LOOP_END;
	};
	
	//######## Schleife von vorne beginnen ########
	B_SmartTurnToNpc		(self,	other);
	AI_Wait					(self,	0.3);
	return 					LOOP_CONTINUE;
};

func void ZS_AssessFighter_End ()
{	
	//-------- SC hat sich entweder entfernt oder die Waffe weggesteckt ! --------
	PrintDebugNpc		(PD_ZS_FRAME, "ZS_AssessFighter_End" );	
	B_RemoveWeapon		(self);
};





//////////////////////////////////////////////////////////////////////////
//	ZS_AssessFighterWait
//	====================
//	Wird von ZS_AssessFighter aufgerufen, falls der NSC dem SC eine
//	Chance gibt, die Waffe bzw. den Zauberspruch wegzustecken.
//////////////////////////////////////////////////////////////////////////
func void ZS_AssessFighterWait ()
{	
	PrintDebugNpc			(PD_ZS_FRAME, "ZS_AssessFighterWait" );				

	//-------- Wahrnehmungen --------
	Npc_PercEnable  		(self,	PERC_ASSESSENEMY		,	B_AssessEnemy		);

	Npc_PercEnable	 		(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage	);		
	Npc_PercEnable  		(self,	PERC_ASSESSMAGIC 		,	B_AssessMagic		);
	Npc_PercEnable 	 		(self, 	PERC_ASSESSCASTER		,	B_AssessCaster 		);
	Npc_PercEnable			(self,	PERC_ASSESSTHREAT		,	B_AssessThreat		);
	Npc_PercEnable  		(self,	PERC_ASSESSMURDER		,	ZS_AssessMurder		);	
	Npc_PercEnable			(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat		);		
	Npc_PercEnable  		(self,	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable			(self,	PERC_ASSESSREMOVEWEAPON	,	B_AssessRemoveWeapon);

	if (Npc_IsInFightMode(other, FMODE_MAGIC))
	{
		B_Say 				(self,	other, "$ISAIDSTOPMAGIC");
	}
	else
	{
		B_Say 				(self, other, "$ISAIDWEAPONDOWN");
	};

};

func int ZS_AssessFighterWait_Loop	()
{	
	PrintDebugNpc			(PD_ZS_LOOP,	"ZS_AssessFighterWait_Loop" );
				
	//-------- Hat sich der SC mittlerweile entfernt ? -------- 
	if (Npc_GetDistToNpc(self,other) > HAI_DIST_ABORT_MELEE)
	{
		PrintDebugNpc		(PD_ZS_CHECK, "...SC ist außerhalb Nahkampfreichweite!");
		B_AssessRemoveWeapon();
	};

	//-------- Ist die Wartezeit abgelaufen ?  -------- 
	if (Npc_GetStateTime(self) > 5)
	{
		PrintDebugNpc		(PD_ZS_CHECK, "...Wartezeit abgelaufen!");
		Npc_SetTempAttitude	(self,	ATT_HOSTILE);
		Npc_SetTarget		(self,	other);
		B_SayOverlay		(self,	other,	"$YOUASKEDFORIT");
		AI_StartState		(self,	ZS_Attack, 0, "");
	};

	//-------- Schleife fortsetzen ! -------- 
	AI_Wait					(self, 1);
	return 					LOOP_CONTINUE;
};

func void ZS_AssessFighterWait_End ()
{	
	PrintDebugNpc		(PD_ZS_FRAME, "ZS_AssessFighterWait_End");				
};


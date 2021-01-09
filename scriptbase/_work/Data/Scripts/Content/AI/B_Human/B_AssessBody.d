//////////////////////////////////////////////////////////////////////////
//	B_AssessBody
//	============
//	NEU: Diese Funktion wird in der Human-AI nicht mehr durch eine
//	Wahrnehmung, sonder AUSSCHLIEßLICH am Ende eines Kampfes aufgerufen.
//	Nur der "Defeater"/"Murderer" checkt den bewußtlosen/toten Körper
//	seines Opfers. Alle anderen ignorieren den Körper. Folgende Elemente
//	die ohnehin nicht sehr transparent waren, wurden entfernt:
//	- Streit mehrerer NSC um das Plündern des bewußtlosen/toten Körpers
//	- Checken der "Wichtig-Gilden" auf gestohlene Items im/am Körper
//	- Erzeugen einer MURDER-News mit Täter "unbekannt" (bei Leichen)
//	- Bedauern von Toten Kameraden (bei Leichen)
//	- NSCs wecken bewutlose Freunde auf 
//////////////////////////////////////////////////////////////////////////
func void B_AssessBody ()
{
	PrintDebugNpc		(PD_ZS_FRAME, "B_AssessBody" );
	PrintGlobals		(PD_ZS_CHECK);
	
	if (Npc_GetDistToNpc(self,	other) < 1000)
	{
		PrintDebugNpc	(PD_ZS_CHECK, "...Körper näher als 10m!");
		B_FullStop		(self);
		AI_StartState 	(self, ZS_AssessBody, 0, "");
	};
};

//////////////////////////////////////////////////////////////////////////
//	ZS_AssessBody
//	=============
//	Diese Funktion wird von B_AssessBody aufgerufen und führt das
//	Plündern des Körpers 'other' durch.
//	Dabei versucht der NSC möglichst über das 'sichere' Wegnetz zu gehen
//	und nur letzte kleine Stückchen mit freier Wegsuche zurückzulegen
//////////////////////////////////////////////////////////////////////////
func void ZS_AssessBody ()
{
	PrintDebugNpc		(PD_ZS_FRAME, "ZS_AssessBody" );

	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE,		ZS_ReactToDamage);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC,		B_AssessMagic);
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY,		B_AssessEnemy);
	Npc_PercEnable  	(self,	PERC_ASSESSFIGHTER,		B_AssessFighter);
	Npc_PercEnable  	(self,	PERC_ASSESSMURDER,		ZS_AssessMurder);
	Npc_PercEnable  	(self,	PERC_ASSESSDEFEAT,		ZS_AssessDefeat);
	Npc_PercEnable  	(self,	PERC_ASSESSFIGHTSOUND,	B_AssessFightSound);
	Npc_PercEnable  	(self,	PERC_CATCHTHIEF,		ZS_CatchThief );
	Npc_PercEnable  	(self,	PERC_ASSESSTHEFT,		B_AssessTheft );
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK,		B_RefuseTalk );


	//-------- Körper bereits geplündert? --------
	if (other.aivar[AIV_PLUNDERED] == TRUE)
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...Körper bereits geplündert!");
		AI_ContinueRoutine	(self);
	};
		
	//-------- Körper nahe genug dran ? --------
	if (Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT)		// liegt der Körper etwas weiter weg...
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...Körper zu weit weg!");
		AI_ContinueRoutine	(self);				// ... dann Tagesablauf fortsetzen			
	};
};

func int ZS_AssessBody_Loop()
{
	PrintDebugNpc	(PD_ZS_LOOP,	"ZS_AssessBody_Loop");
			
	B_FullStop		(self);
	AI_GotoNpc		(self,	other);
	return			LOOP_END;
};

func void ZS_AssessBody_End()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"ZS_AssessBody_End");

	//-------- Körper bereits geplündert? --------
	// Wiederholung der Abfrage aus der ZS_AssessBody[_Begin], da der
	// Körper vorhin noch nicht, jetzt aber schon geplündert sein könnte
	if (other.aivar[AIV_PLUNDERED] == TRUE)
	{
		AI_ContinueRoutine	(self);
	};
		
	//-------- Plündern --------
	if	(self.fight_tactic != FAI_HUMAN_RANGED)		//Verhindern, daß Fernkampfwachen ihren Posten verlasen
	&&	(self.npctype != NPCTYPE_FRIEND)			//NSC-Freunde plündern nicht
	&&  (C_NpcIsHuman (self))
	{  
		PrintDebugNpc	(PD_ZS_CHECK, "...kein purer Fernkämpfer und kein NSC-Freund!" );
		AI_PlayAni		(self,	"T_PLUNDER");
		if (B_Plunder())
		{
			B_Say		(self,	other, "$ITookYourOre");
		}
		else
		{
			B_Say		(self,	other, "$ShitNoOre");
		};
		other.aivar[AIV_PLUNDERED] = TRUE;
	};

	//-------- nach der evtl. fallengelassenen Waffe suchen --------
	AI_StartState		(self,	ZS_AssessBody_RecoverWeapon,	1,	"");
};

func void ZS_AssessBody_RecoverWeapon ()
{	
	PrintDebugNpc		(PD_ZS_FRAME,	"ZS_AssessBody_RecoverWeapon");

	B_SetPerception		(self);
		
	//-------- nach der evtl. fallengelassenen Waffe suchen --------
	Npc_PerceiveAll		(self);
	if (( Wld_DetectItem	(self,ITEM_KAT_NF) || Wld_DetectItem (self,ITEM_KAT_FF) )
	    && Npc_GetDistToItem(self,item) < 300 )
	{
		PrintDebugNpc	(PD_ZS_CHECK, "...Nah- oder Fernkampfwaffe gefunden!" );
		B_SayOverlay	(self,	NULL, "$ITakeYourWeapon");
		AI_TakeItem		(self,	item);
		AI_EquipBestMeleeWeapon(self);
		AI_EquipBestRangedWeapon(self);
	};

	//-------- Heilen ! --------
	AI_StartState		(self,	ZS_HealSelf,	1,	"");
};
	
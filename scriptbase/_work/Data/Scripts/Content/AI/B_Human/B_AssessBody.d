//////////////////////////////////////////////////////////////////////////
//	B_AssessBody
//	============
//	NEU: Diese Funktion wird in der Human-AI nicht mehr durch eine
//	Wahrnehmung, sonder AUSSCHLIE�LICH am Ende eines Kampfes aufgerufen.
//	Nur der "Defeater"/"Murderer" checkt den bewu�tlosen/toten K�rper
//	seines Opfers. Alle anderen ignorieren den K�rper. Folgende Elemente
//	die ohnehin nicht sehr transparent waren, wurden entfernt:
//	- Streit mehrerer NSC um das Pl�ndern des bewu�tlosen/toten K�rpers
//	- Checken der "Wichtig-Gilden" auf gestohlene Items im/am K�rper
//	- Erzeugen einer MURDER-News mit T�ter "unbekannt" (bei Leichen)
//	- Bedauern von Toten Kameraden (bei Leichen)
//	- NSCs wecken bewutlose Freunde auf 
//////////////////////////////////////////////////////////////////////////
func void B_AssessBody ()
{
	PrintDebugNpc		(PD_ZS_FRAME, "B_AssessBody" );
	PrintGlobals		(PD_ZS_CHECK);
	
	if (Npc_GetDistToNpc(self,	other) < 1000)
	{
		PrintDebugNpc	(PD_ZS_CHECK, "...K�rper n�her als 10m!");
		B_FullStop		(self);
		AI_StartState 	(self, ZS_AssessBody, 0, "");
	};
};

//////////////////////////////////////////////////////////////////////////
//	ZS_AssessBody
//	=============
//	Diese Funktion wird von B_AssessBody aufgerufen und f�hrt das
//	Pl�ndern des K�rpers 'other' durch.
//	Dabei versucht der NSC m�glichst �ber das 'sichere' Wegnetz zu gehen
//	und nur letzte kleine St�ckchen mit freier Wegsuche zur�ckzulegen
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


	//-------- K�rper bereits gepl�ndert? --------
	if (other.aivar[AIV_PLUNDERED] == TRUE)
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...K�rper bereits gepl�ndert!");
		AI_ContinueRoutine	(self);
	};
		
	//-------- K�rper nahe genug dran ? --------
	if (Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT)		// liegt der K�rper etwas weiter weg...
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...K�rper zu weit weg!");
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

	//-------- K�rper bereits gepl�ndert? --------
	// Wiederholung der Abfrage aus der ZS_AssessBody[_Begin], da der
	// K�rper vorhin noch nicht, jetzt aber schon gepl�ndert sein k�nnte
	if (other.aivar[AIV_PLUNDERED] == TRUE)
	{
		AI_ContinueRoutine	(self);
	};
		
	//-------- Pl�ndern --------
	if	(self.fight_tactic != FAI_HUMAN_RANGED)		//Verhindern, da� Fernkampfwachen ihren Posten verlasen
	&&	(self.npctype != NPCTYPE_FRIEND)			//NSC-Freunde pl�ndern nicht
	&&  (C_NpcIsHuman (self))
	{  
		PrintDebugNpc	(PD_ZS_CHECK, "...kein purer Fernk�mpfer und kein NSC-Freund!" );
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
	
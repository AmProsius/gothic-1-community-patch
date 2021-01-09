func int B_StopMagicSleep()
{
	Npc_PercDisable	(self,	PERC_ASSESSDAMAGE);

    Npc_ClearAIQueue(self);		// alle AI Befehle entfernen
	AI_PlayAni		(self, "T_VICTIM_SLE_2_STAND" );
	AI_StandUp		(self);
	B_SayOverlay	(self,	other,	"$WHATSTHAT");     // eigentlich $whatwasthat, aber was ist das ?

	//-------- fallgelassene Waffe aufheben... --------
	//B_RegainDroppedWeapon(self);

	//-------- und wieder dem Zauberer zuwenden... --------
	if	Hlp_IsValidNpc(other)
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...'other' gültig!");
		if	(Npc_GetAttitude(self,other) == ATT_HOSTILE)
		{
			PrintDebugNpc	(PD_ZS_CHECK,	"...'other' hostile!");
			AI_StartState	(self, ZS_AssessEnemy, 0, "");
		};
	};

	AI_ContinueRoutine(self);
};		



func void ZS_MagicSleep()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"ZS_MagicSleep");
	
	// der ZS_MagicSleep beendet sich selbst im loop, daher ist keine perception PERC_ASSESSSTOPMAGIC nötig, und darf
	// auch nicht gesetzt werden, ansonsten wird der diesen zustand aktivierende effekt wenn er beendet ist (z.B. weil
	// der partikeleffekt stirbt) ein assessstopmagic senden, und dadurch illegalerweise vorzeitig den zustand beenden
	// mit anderen worten: der pfx triggert diesen zustand, und der zustand beendet sich selbst
	
	Npc_PercEnable		(self,	PERC_ASSESSDAMAGE, 		B_StopMagicSleep);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC,		B_AssessMagic);
		

// wenn Opfer Schwimmt oder Taucht wird es nicht einschlafen
	if ( C_BodystateContains(self,BS_SWIM) || C_BodystateContains(self,BS_DIVE) )
	{
		AI_ContinueRoutine	( self );
		return;
	};

	if (Npc_WasInState(self, ZS_Unconscious))
	{
		AI_ContinueRoutine	(self);
		return;
	};

	Npc_ClearAIQueue		(self);

	if ( !Npc_HasBodyFlag	(self, BS_FLAG_INTERRUPTABLE) )
	{
		PrintDebugNpc		(PD_MAGIC,	"bodystate not interuptable, standing up...");
		AI_StandUp 			(self);
	};

	//B_DropWeapon			(self);						//SN: macht Probleme!
	AI_PlayAniBS 			(self,	"T_STAND_2_VICTIM_SLE", BS_LIE );
	//Npc_SetTempAttitude		(self,	ATT_HOSTILE);	//SN: macht Probleme!
};


func void ZS_MagicSleep_Loop ()
{	
	PrintDebugNpc		(PD_ZS_LOOP, "MagicSleep Loop" );

	var int time;
	time = Npc_GetStateTime	(self);

	if ( time>SPL_TIME_SLEEP ) 		// nach 30 sekunden wird der zustand beendet. 
	{
		B_StopMagicSleep();
	};

	AI_Wait	(self,	1);
};


func void ZS_MagicSleep_End()
{
	PrintDebugNpc		( PD_ZS_FRAME, "ZS_MagicSleep_End" );
};


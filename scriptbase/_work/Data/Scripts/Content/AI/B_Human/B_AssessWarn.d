func void B_AssessWarn ()
{	
	PrintDebugNpc		(PD_ZS_FRAME, "B_AssessWarn" );	
	PrintGlobals		(PD_ZS_CHECK);	
	PrintAttitudes 		(PD_ZS_CHECK);
	//JP: Warns reiﬂen Leute aus dem Zustand, in dem der Warnende ist
	
	
	//JP: das ist very experimental, aber die Warn reiﬂen immer wieder aus dem Vorgang ( sprich warn warnt vor der sowieso grade bewerteten Situation)
	//JP: Das scheint auch so nicht zu klappen, zumindest beim ersten Warn gibt es da immer noch Probleme
	Npc_PercDisable	(self,	PERC_ASSESSWARN);
	if (! C_NpcIsHuman(other))
	{
		PrintDebugNpc	(PD_ZS_CHECK, "B_AssessWarn Monster" );
		// JP:an dieser Stelle haben sich die Nsc¥s immer weggeh‰ngt und nicht mehr plausibel reagiert, weil jeder an jeden Monster Warns gesendet hat,
		// die dann aber als uninteressant wieder verworfen worden sind, deshalb werde ich hier mal versuchsweise den ZS_AssessMonster aufrufen
		//return;
		AI_StandUp		(self);			// eventuelle Item-Interacts abbrechen
		Npc_SetTarget	(self, other);
		
		Npc_GetTarget	(self);
		AI_StartState	(self, ZS_AssessMonster, 0, "");
	}
	
	else if (!C_NpcIsHuman(victim))
	{
		PrintDebugNpc	(PD_ZS_CHECK, "B_AssessWarn Monster" );
		AI_StandUp		(self);			// eventuelle Item-Interacts abbrechen
		Npc_SetTarget	(self, victim);
		
		Npc_GetTarget	(self);
		AI_StartState	(self, ZS_AssessMonster, 0, "");
	} 
	else 
	{
		PrintDebugNpc	(PD_ZS_CHECK, "B_AssessWarn Human");		
		B_FullStop		(self);
		AI_StartState	(self, ZS_AssessWarn, 0, "");
	};
};

func void ZS_Hunt ()
{
    PrintDebugNpc (PD_TA_FRAME,"ZS_Hunt" );
	B_SetPerception (self);    
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
	AI_GotoWP (self,self.wp);			// Gehe zum Tagesablaufstart
	AI_AlignToWP (self);				//Richte Dich aus
};

func void ZS_Hunt_Loop ()
{
    PrintDebugNpc (PD_TA_LOOP,"ZS_Hunt_Loop" );
    
	if (Wld_DetectNpc   	(self, -1, ZS_MONSTER_Roam, -1))
	{
		Npc_SetTarget 	(self,other);
		
		Npc_GetTarget	( self);
		AI_StartState 	(self,ZS_AssessMonster, 0,"");	// SN: der korrekte Zustand, um Monster zu erkennen ist 'ZS_AssessMonster' -> ich habe das korrigiert! (wenn gelesen, dann Kommentar löschen)
	};
	
	AI_Wait(self,1);
};

func void ZS_Hunt_End ()
{
    PrintDebugNpc (PD_TA_FRAME,"ZS_Hunt_End" );
};

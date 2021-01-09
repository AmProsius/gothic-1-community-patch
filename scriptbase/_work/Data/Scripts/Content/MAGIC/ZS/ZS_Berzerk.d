func void ZS_Berzerk()
{
	PrintDebugNpc			(PD_ZS_FRAME,	"ZS_Berzerk");
	PrintGlobals			(PD_ZS_DETAIL);
	
	B_FullStop	 			(self);
	B_SayOverlay			(self,	NULL,	"$Berzerk");
	AI_PlayAni				(self,	"T_PSI_VICTIM");
	AI_SetWalkmode			(self,	NPC_RUN);
};

func int ZS_Berzerk_Loop()
{
	PrintDebugNpc			(PD_ZS_LOOP,	"ZS_Berzerk_Loop");

	var int random;
	
	if	(Npc_GetStateTime(self) > SPL_TIME_BERZERK)
	{
		//-------- Zeit abgelaufen ! --------
		B_FullStop			(self);
		return				LOOP_END;
	};

	Npc_GetTarget			(self);	
	if (Hlp_IsValidNpc	(other)		// Ziel technisch gültig?
	&&	!C_NpcIsDown	(other) 	// Ziel am Leben?
	&&	!Npc_IsPlayer	(other)	)	// Ziel ein NSC (beim ersten Durchlaufen könnte es der Spieler sein!)	
	{																							
		//-------- Ziel angreifen ! --------
		Npc_GetTarget	(self);									// ...other initialisieren!
		AI_Attack    	(self);									// ...FAI anwerfen!	
		AI_Wait			(self,	0.1);

		if (Hlp_Random(100) < 20)
		{
			B_SayOverlay(self,	other,	"$Berzerk");
		};
		
		return	 		LOOP_CONTINUE;
	}
	else
	{
		//-------- neues Ziel suchen ! --------
	    PrintDebugNpc		(PD_ZS_CHECK,	"...kein gültiges Ziel mehr!");
		
		Npc_PerceiveAll		(self);								// sammelt alle NSC im Umkreis ein...
		if ( Wld_DetectNpcEx( self, -1, NOFUNC, -1, FALSE ) )	// ...und wählt irgendeinen davon aus (aber ignoriert den SC!)
		{
		    PrintDebugNpc	(PD_ZS_CHECK,"...Neues Ziel entdeckt!");
			PrintGlobals	(PD_ZS_DETAIL);
			Npc_SetTarget	(self, other);
			return 			LOOP_CONTINUE;
		}
		else
		{
		    PrintDebugNpc	(PD_ZS_CHECK,"...kein neues Ziel mehr vorhanden!");
			PrintGlobals	(PD_ZS_DETAIL);

			AI_GotoWP 		(self,	Npc_GetNearestWP(self));	// zum nächsten...	
			B_SayOverlay	(self,	NULL,	"$Berzerk");
			AI_PlayAni		(self,	"T_SEARCH");
			AI_GotoWP 		(self,	Npc_GetNextWP 	(self));	// dann zum zweitnächsten Waypoint (beide Messungen bei t=0!)
			B_SayOverlay	(self,	NULL,	"$Berzerk");
			AI_PlayAni		(self,	"T_SEARCH");
		};
	};	

};

func void ZS_Berzerk_End()
{
	PrintDebugNpc			(PD_ZS_FRAME,	"ZS_Berzerk_End");

	B_SayOverlay			(self,	NULL,	"$Berzerk");
	AI_PlayAni				(self,	"T_PSI_VICTIM");
	AI_Wait					(self,	2);
	AI_ContinueRoutine		(self);
};

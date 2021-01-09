//////////////////////////////////////////////////////////////////////////
//	ZS_AlignGuard
//	========
//	Dieser Tagesablauf wird allen NSCs gegeben, die einfach nur
//	imposant herumstehen und Wache halten sollen.
//
//	Es passiert folgendes:
//	1.	Wie in allen Wachzuständen werden nette Posen und Zufalls-
//		Animationen abgespielt.
//////////////////////////////////////////////////////////////////////////
func void ZS_AlignGuard ()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_Guard");
	
	GuardPerception ();
	Npc_PercEnable  (self,	PERC_ASSESSPLAYER, 	B_AssessSC);
	
	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);			// Walkmode für den Zustand
	AI_GotoWP		( self, self.wp	);			// Gehe zum Tagesablaufstart
	AI_AlignToWP		( self );
	B_InitArmor();    
};

func void ZS_AlignGuard_Loop ()
{
	PrintDebugNpc	(PD_TA_LOOP,"ZS_Guard_Loop");

	B_GotoFP		(self, "GUARD");
		
	B_PlayArmor		();
 	
	AI_Wait			(self,	0.5);
};

func void ZS_AlignGuard_End ()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_Guard_End");
	
	B_ExitArmor();  
};





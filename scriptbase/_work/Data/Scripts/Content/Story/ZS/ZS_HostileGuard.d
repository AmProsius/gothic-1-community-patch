//////////////////////////////////////////////////////////////////////////
//	ZS_HostileGuard
//	========
//	Dieser Tagesablauf wird allen NSCs gegeben, die einfach nur
//	imposant herumstehen und Wache halten sollen.
//
//	Es passiert folgendes:
//	1.	Wie in allen Wachzuständen werden nette Posen und Zufalls-
//		Animationen abgespielt.
//////////////////////////////////////////////////////////////////////////
func void ZS_HostileGuard ()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_HostileGuard");
	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );	

	GuardPerception ();
	Npc_PercEnable  (self,	PERC_ASSESSPLAYER, 	B_AssessSC);
	
	self.senses 		= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	self.senses_range	= 2500;

	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);			// Walkmode für den Zustand
	AI_GotoWP		(self, self.wp);			// Gehe zum Tagesablaufstart
	AI_AlignToWP		( self );

	B_InitArmor();    
};

func void ZS_HostileGuard_Loop ()
{
	PrintDebugNpc	(PD_TA_LOOP,"ZS_HostileGuard_Loop");

	B_GotoFP		(self, "GUARD");
		
	B_PlayArmor		();
 	
	AI_Wait			(self,	0.5);
};

func void ZS_HostileGuard_End ()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_HostileGuard_End");
	
	B_ExitArmor();  
};





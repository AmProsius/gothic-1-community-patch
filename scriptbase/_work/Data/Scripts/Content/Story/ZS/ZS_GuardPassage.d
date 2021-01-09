//////////////////////////////////////////////////////////////////////////
//	ZS_GuardPassage
//	===============
//	Dieser Tagesablauf wird allen NSCs gegeben, die einen Durchgang
//	bewachen sollen.
//
//	Es passiert folgendes:
//	1.	Nähert sich der Spieler dem Durchgang, so wird er in einen
//		Dialog gezwungen und ein personalisiertes Skript aufgerufen
//	2.	In diesem Skript wird gecheckt, ob der Spieler passieren darf:
//		->	falls er der gleichen Gilde angehört
//		->	falls er missionsbedingt eine Erlaubnis hat
//		->	Darf er passieren, passiert nichts weiter
//		->	Darf er NICHT passieren und tut es trotzdem, wird er
//			angegriffen und getötet.
//	3.	Wie in allen Wachzuständen werden nette Posen und Zufalls-
//		Animationen abgespielt.
//////////////////////////////////////////////////////////////////////////
func void ZS_GuardPassage ()
{
	PrintDebugNpc (PD_TA_FRAME,	"ZS_GuardPassage");
	
	GuardPerception ();
	Npc_PercEnable  (self,	PERC_ASSESSPLAYER, 		B_AssessSC);
	Npc_PercEnable  (self,	PERC_ASSESSQUIETSOUND, 	B_AssessSC);
	
	Npc_PercDisable	(self, 	PERC_OBSERVEINTRUDER);
	
	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);			// Walkmode für den Zustand
	AI_GotoWP		(self, self.wp);			// Gehe zum Tagesablaufstart
	AI_AlignToWP	(self);
	
	B_InitArmor();    
};

func int ZS_GuardPassage_Loop ()
{
	PrintDebugNpc	(PD_TA_LOOP,	"ZS_GuardPassage_Loop");
	
	if (Npc_GetDistToWP(self,self.wp)>200)
	{
		AI_SetWalkmode 	(self,NPC_RUN);			
		AI_GotoWP		(self, self.wp);		
		return			LOOP_CONTINUE;
	}
	else if (Npc_GetDistToNpc(self,hero) > HAI_DIST_GUARDPASSAGE_ATTENTION)
	{
		AI_AlignToWP	(self);
	};

	B_PlayArmor			();
  	
	AI_Wait				(self,	0.5);
	
	return				LOOP_CONTINUE;
};

func void ZS_GuardPassage_End ()
{
	PrintDebugNpc (PD_TA_FRAME,	"ZS_GuardPassage_End");
	
	B_ExitArmor();  
};





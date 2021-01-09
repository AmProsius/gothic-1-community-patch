/************************************
*    Wächter soll Drehrad bewachen  *
*            dass es zu bleibt      *
************************************/


func void ZS_GuardWheelClosed()
{
	PrintDebugNpc 		(PD_TA_FRAME,"ZS_GuardWheelClosed");	
	
	GuardPerception		();
	
	AI_StandUp			(self);				
	AI_SetWalkmode 		(self,	NPC_WALK);							// Walkmode für den Zustand 
	AI_GotoWP			(self, 	self.wp);             				// Gehe zum Tagesablaufstart

	if (Wld_GetMobState	(self, 	"VWHEEL") == 0)						// Tor offen?
	{
		PrintDebugNpc 	(PD_TA_CHECK,	"...Tor offen!");	
		AI_UseMob		(self, 	"VWHEEL", 1);						// ...dann wieder zumachen!
		AI_UseMob		(self, 	"VWHEEL", -1);                      //und vom Mobsi abmelden
		AI_AlignToWP	(self);
	};
};

func int ZS_GuardWheelClosed_Loop()
{
	PrintDebugNpc 		(PD_TA_LOOP,"ZS_GuardWheelClosed_Loop");

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
			
	AI_Wait				(self,1);	
	return				LOOP_CONTINUE;
};	

func void ZS_GuardWheelClosed_End ()
{
	PrintDebugNpc 		(PD_TA_FRAME,"ZS_GuardWheelClosed_End");	
};
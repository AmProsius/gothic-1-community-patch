/*******************************************
*          NSC benutzt Kochkessel          *
*******************************************/

FUNC VOID ZS_Cook ()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_Cook");
	
	B_SetPerception (self);    

	if (!C_BodyStateContains(self, BS_MOBINTERACT))
	{
		AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
		if ((Hlp_StrCmp(Npc_GetNearestWp (self),self.wp)== 0))
		{
			AI_GotoWP		(self, self.wp);
		};
		AI_UseMob(self,"CAULDRON",1);		// Benutze den Mob einmal bis zum angegebenen State
	};
};

FUNC VOID ZS_Cook_Loop()
{
	PrintDebugNpc (PD_TA_LOOP,"ZS_Cook_Loop"); // Da hier nur eine Ani geloopt wird reicht es diese in Begin und End zu benutzen
	var int randomizer;
 	randomizer = Hlp_Random	(20);
    if (Npc_GetStateTime ( self ) >= 100 + randomizer)
    {
    	B_InterruptMob ("COOK");
    };
	
	AI_Wait(self,1);
};

FUNC VOID ZS_Cook_End()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_Cook_End");
	AI_UseMob (self,"CAULDRON",-1);		//Verlassen sie bitte ihr Mobsi
};


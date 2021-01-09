/*******************************************
*       NSC betet an Schläferstatue an     *
*******************************************/

func void ZS_Pray ()
{
    PrintDebugNpc (PD_TA_FRAME,"ZS_Pray");
    
	B_SetPerception (self);    
	if !(C_BodyStateContains(self,BS_MOBINTERACT))
	{
		AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
		if ((Hlp_StrCmp(Npc_GetNearestWp (self),self.wp)== 0))
		{
			AI_GotoWP	(self, self.wp);
		};
		AI_UseMob (self,"IDOL",1);			// Benutze den Mob einmal bis zum angegebenen State
	};

};

func void ZS_Pray_Loop ()
{
    PrintDebugNpc (PD_TA_LOOP,"ZS_Pray_Loop");
    
	AI_Wait(self,1);
};

func void ZS_Pray_End ()
{
	AI_UseMob (self,"IDOL",-1);			// Nimm den Verlassen State ein
	
	PrintDebugNpc (PD_TA_FRAME,"ZS_Pray_End");
};


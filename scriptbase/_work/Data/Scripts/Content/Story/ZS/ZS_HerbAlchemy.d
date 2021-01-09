/*******************************************
*          NSC benutzt Herbstomper         *
*******************************************/

func void ZS_HerbAlchemy()
{
    PrintDebugNpc (PD_TA_FRAME,"ZS_HerbAlchemy");
    
	B_SetPerception (self);	
	if !(C_BodyStateContains(self,BS_MOBINTERACT))
	{
		AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
		if ((Hlp_StrCmp(Npc_GetNearestWp (self),self.wp)== 0))
		{
			AI_GotoWP	(self, self.wp);
		};
		AI_UseMob (self,"HERB",1);			// Benutze den Mob einmal bis zum angegebenen State
	};

};

func void ZS_HerbAlchemy_Loop ()
{
    PrintDebugNpc (PD_TA_LOOP,"ZS_HerbAlchemy_Loop");
        
	var int randomizer;
 	randomizer = Hlp_Random	(20);
    if (Npc_GetStateTime ( self ) >= 100 + randomizer)
    {
    	B_InterruptMob ("HERB");
    };
	AI_Wait(self,1);
};

func void ZS_HerbAlchemy_End ()
{
	AI_UseMob (self,"HERB",-1);			// Verlasse diesen Mobsi
	
	PrintDebugNpc (PD_TA_FRAME,"ZS_HerbAlchemy_End");
};


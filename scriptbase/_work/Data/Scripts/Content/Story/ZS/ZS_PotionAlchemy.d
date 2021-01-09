/*******************************************
*             NSC braut Trank              *
*******************************************/

func void ZS_PotionAlchemy()
{
    PrintDebugNpc (PD_TA_FRAME,"ZS_PotionAlchemy");
    
	B_SetPerception (self);    

	if !(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
	{
		AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand	
		if ((Hlp_StrCmp(Npc_GetNearestWp (self),self.wp)== 0))
		{
			AI_GotoWP	(self, self.wp);
		};
		AI_UseMob (self,"LAB",1);			// Benutze den Mob einmal bis zum angegebenen State
	};

};

func void ZS_PotionAlchemy_Loop()
{
    PrintDebugNpc (PD_TA_LOOP,"ZS_PotionAlchemy_Loop");
        
    var int randomizer;
 	randomizer = Hlp_Random	(20);
    if (Npc_GetStateTime ( self ) >= 100 + randomizer)
    {
    	B_InterruptMob ("LAB");
    };
	AI_Wait(self,1);
};

func void ZS_PotionAlchemy_End ()
{
	AI_UseMob (self,"LAB",-1);			//Nimm den Verlassen State ein
	
	PrintDebugNpc (PD_TA_FRAME,"ZS_PotionAlchemy_End");
};
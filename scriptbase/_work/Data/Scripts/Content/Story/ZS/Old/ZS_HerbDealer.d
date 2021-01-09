func void ZS_HerbDealer ()
{
    PrintDebugNpc (PD_TA_FRAME,"ZS_HerbDealer");
    
	B_SetPerception (self);    
	if !(C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
		AI_GotoWP (self,self.wp);			// Gehe zum Tagesablaufstart
		AI_AlignToWP (self);				//Richte Dich aus
		AI_UseMob	(self,"CHAIR",1);		// Benutze den Mob einmal bis zum angegebenen State
	};
};

func void ZS_HerbDealer_Loop ()
{
    PrintDebugNpc (PD_TA_LOOP,"ZS_HerbDealer_Loop");
	
	AI_Wait(self,1);
};

func void ZS_HerbDealer_End ()
{
    PrintDebugNpc (PD_TA_FRAME,"ZS_HerbDealer_End");
    
	AI_UseMob (self,"CHAIR",-1);
};

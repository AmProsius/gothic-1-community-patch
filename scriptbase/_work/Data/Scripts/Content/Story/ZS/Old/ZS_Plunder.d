func void ZS_Plunder ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_Plunder");
    
	B_SetPerception (self);    
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
	AI_GotoWP (self,self.wp);			// Gehe zum Tagesablaufstart
	AI_AlignToWP (self);				//Richte Dich aus
};

func void ZS_Plunder_Loop ()
{
    PrintDebugNpc(PD_TA_LOOP,"ZS_Plunder_Loop");
	
	AI_Wait(self,1);
};

func void ZS_Plunder_End ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_Plunder_End");
};
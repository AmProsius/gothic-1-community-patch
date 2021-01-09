func void ZS_SearchPerson ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_SearchPerson");
    
	B_SetPerception (self);    
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode f�r den Zustand
	AI_GotoWP (self,self.wp);			// Gehe zum Tagesablaufstart
	AI_AlignToWP (self);				//Richte Dich aus
};

func void ZS_SearchPerson_Loop ()
{
    PrintDebugNpc(PD_TA_LOOP,"ZS_SearchPerson_Loop");
	
	AI_Wait(self,1);
};

func void ZS_SearchPerson_End ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_SearchPerson_End");
};


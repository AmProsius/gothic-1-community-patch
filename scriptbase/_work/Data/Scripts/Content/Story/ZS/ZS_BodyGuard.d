/*********************************************************
*          NSC sucht BODYGUARD-FP und stellt sich        *
*********************************************************/

func void ZS_BodyGuard	()
{
    PrintDebugNpc		(PD_TA_FRAME,	"ZS_BodyGuard");
    
	B_SetPerception (self);    
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
	if !(Npc_IsOnFP(self,"BODYGUARD"))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	
	if (Wld_IsFPAvailable (self, "BODYGUARD"))
	{
		AI_GotoFP (self,"BODYGUARD");
		AI_AlignToFP( self );				//Richte Dich aus
	};
};

func void ZS_BodyGuard_Loop ()
{
    PrintDebugNpc		(PD_TA_LOOP,	"ZS_BodyGuard_Loop");
	
	AI_Wait(self,1);
	//AI_AlignToFP(self);
};

func void ZS_BodyGuard_End ()
{
    PrintDebugNpc		(PD_TA_FRAME,	"ZS_BodyGuard_End");
};

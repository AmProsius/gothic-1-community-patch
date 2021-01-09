/*****************************************
* NSC läuft immer zwischen FP-WALK_A und *
*         FP-WALK_B hin und her          *            
*****************************************/

FUNC VOID ZS_Walk ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_Walk");
    
	B_SetPerception (self);    
	
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
	if !(Npc_IsOnFP(self,"WALK"))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	if (Wld_IsFPAvailable (self, "WALK_A_"))
	{
		AI_GotoFP (self,"WALK_A_");
	}
	else if (Wld_IsFPAvailable (self, "WALK_B_"))
	{
		AI_GotoFP (self,"WALK_B_");
	};
};

FUNC VOID ZS_Walk_Loop ()
{
    PrintDebugNpc(PD_TA_LOOP,"ZS_Walk_Loop");
    
	if ((Npc_IsOnFP(self,"WALK_A_")) && (Wld_IsFPAvailable (self, "WALK_B_")))
	{
		AI_GotoFP (self,"WALK_B_");
	}
	else if ((Npc_IsOnFP(self,"WALK_B_")) && (Wld_IsFPAvailable (self, "WALK_A_")))
	{
		AI_GotoFP (self,"WALK_A_");
	};
    
    AI_Wait(self,1);
};

FUNC VOID ZS_Walk_End()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_Walk_End");
};


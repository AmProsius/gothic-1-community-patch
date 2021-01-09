// ### Design?
func void ZS_CollectRoots ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_CollectRoots");
    
	B_SetPerception (self);    
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
	if !(Npc_IsOnFP(self,"COLLECTROOTS"))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};				
	if (Wld_IsFPAvailable (self, "COLLECTROOTS"))
	{
		AI_GotoFP (self,"COLLECTROOTS");
		AI_PlayAni (self,"T_PICKUP_LOW");
	};
	
	

};

func void ZS_CollectRoots_Loop ()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_CollectRoots_Loop");
	
	var int picktime;
	picktime = Hlp_Random (100);
	if (picktime <= 10)
	{
		if (Wld_IsFPAvailable (self, "COLLECTROOTS"))
		{
			AI_GotoNextFP (self, "COLLECTROOTS");
			AI_PlayAni (self,"T_PICKUP_LOW");
		};
	};
	AI_Wait(self,1);
};

func void ZS_CollectRoots_End ()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_CollectRoots_End");
};
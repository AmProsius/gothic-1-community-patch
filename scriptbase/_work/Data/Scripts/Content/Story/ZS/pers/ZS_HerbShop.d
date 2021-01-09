// von Mike für Frotuno (im ST hinter Drogenstand)

func void ZS_HerbShop ()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_HerbShop");
	
	B_SetPerception (self);    
	
	AI_SetWalkmode (self,NPC_WALK);	// Walkmode für den Zustand
	if !(Npc_IsOnFP(self,"STAND"))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	
	if (Wld_IsFPAvailable (self, "SHOP"))
	{
		AI_GotoFP (self,"SHOP");
	}

	if (Npc_IsOnFP(self,"SHOP"))
	{
		// Do the Trade thing...
	};
	AI_AlignToFP( self );				//Richte Dich aus
};

func void ZS_HerbShop_Loop()
{
	PrintDebugNpc (PD_TA_LOOP,"ZS_HerbShop_Loop");
};

func void ZS_HerbShop_End ()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_HerbShop_End");
};

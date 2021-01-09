/*******************************************
*             NSC hängt besoffen rum,      *
*               säuft und pinkelt          *
*******************************************/


func void ZS_DrunkandPee ()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_DrunkandPee");
	
	B_SetPerception (self);    
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_RefuseTalk	);		
	
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
	Mdl_ApplyOverlayMds (self, "HUMANS_DRUNKEN.MDS" );
	if !(Npc_IsOnFP(self,"DRUNK"))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	if (Wld_IsFPAvailable (self, "DRUNK_A_"))
	{
		AI_GotoFP (self,"DRUNK_A_");
	}
	else if (Wld_IsFPAvailable (self, "DRUNK_B_"))
	{
		AI_GotoFP (self,"DRUNK_B_");
	};
	if (Npc_IsOnFP(self,"DRUNK"))	
	{
		if (Npc_HasItems (self,ItFoWine) > 0)
		{
			B_ChooseWine(self);
		}
		else if (Npc_HasItems (self,ItFoBeer) > 0)
		{
			B_ChooseBeer(self);
		}
		else 
		{
			B_ChooseBooze(self);
		};
	};
	
	
};

func void ZS_DrunkandPee_Loop ()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_DrunkandPee_Loop");
	
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_RefuseTalk	);
	
	if !(Npc_IsOnFP(self,"DRUNK"))
	{
		if (Wld_IsFPAvailable (self, "DRUNK_A_"))
		{
			AI_GotoFP (self,"DRUNK_A_");
		}
		else if (Wld_IsFPAvailable (self, "DRUNK_B_"))
		{
			AI_GotoFP (self,"DRUNK_B_");
		};
	};
	
	var int drunkreaktion;
	drunkreaktion = Hlp_Random(1000);
	
	if ((drunkreaktion >= 999 ) && (Npc_IsOnFP(self,"DRUNK")) && (self.aivar[AIV_ITEMSTATUS]== TA_IT_NONE))
	{
		if (Npc_HasItems (self,ItFoWine) > 0)
		{
			B_ChooseWine(self);
		}
		else if (Npc_HasItems (self,ItFoBeer) > 0)
		{
			B_ChooseBeer(self);
		}
		else 
		{
			B_ChooseBooze(self);
		};
	};	
	
	if ((drunkreaktion >= 990 ) &&  (self.aivar[AIV_GUARDITERATOR] == 0))
	{
		B_Pee(self);
		AI_ContinueRoutine (self);
	};
	if ((drunkreaktion >= 900 ))
	{
		B_ClearItem(self);
	};
	
	B_PlayItemRandoms(self);
	
	B_ResetIterator (self);
	
	AI_Wait(self,1);
	//AI_AlignToFP(self);
};

func void ZS_DrunkandPee_End ()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_DrunkandPee_End");
	
	B_ClearItem(self);
};


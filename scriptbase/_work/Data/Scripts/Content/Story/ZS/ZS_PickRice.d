/****************************************************
*    NSC nimmt Körbchen, sucht PICKRICE-FP,         *
*  beginnt Reis zu pflücken, wechselt dabei den FP  *
****************************************************/


//Pickrice-Freepoints sind nicht wie normale FPs priorisiert 
//nach A,B,C sondern nach der Reisterasse 1,2,3, so dass NSCs, 
//die auf der obersten Reisterasse (1) beginnen, auch nur
//FPs auf der obersten Terasse aussuchen.
func void ZS_PickRice () 
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_PickRice");
    
	B_SetPerception (self);
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
	
	if !(Npc_IsOnFP(self,"PICKRICE"))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};			
	if (Wld_IsFPAvailable (self, "PICKRICE"))
	{
		AI_GotoFP (self,"PICKRICE");
		AI_AlignToFP( self );				//Richte Dich aus
	};
	
	self.aivar[AIV_ITEMFREQ] = (Hlp_Random (5) + 5);
};

func void ZS_PickRice_Loop ()
{
    PrintDebugNpc(PD_TA_LOOP,"ZS_PickRice_Loop");
	
	if ((Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ]) && (Hlp_Random(2)))
	{
	    PrintDebugNpc(PD_TA_DETAIL,"PickRice Bücken mit Platzwechsel");
		if (Npc_IsOnFP(self,"PICKRICE_1")) && (Wld_IsFPAvailable (self, "PICKRICE_1"))
		{
		    PrintDebugNpc(PD_TA_DETAIL,"Platzwechsel auf Level 1");
			AI_GotoNextFP (self, "PICKRICE_1");
			AI_PlayAni (self,"T_PLUNDER");
			self.aivar[AIV_ITEMFREQ] = (Hlp_Random (5) + 5);
			Npc_SetStateTime (self,0);
		}
		else if (Npc_IsOnFP(self,"PICKRICE_2")) && (Wld_IsFPAvailable (self, "PICKRICE_2"))
		{
		    PrintDebugNpc(PD_TA_DETAIL,"Platzwechsel auf Level 2");
			AI_GotoNextFP (self, "PICKRICE_2");
			AI_PlayAni (self,"T_PLUNDER");
			self.aivar[AIV_ITEMFREQ] = (Hlp_Random (5) + 5);
			Npc_SetStateTime (self,0);
		}
		else if (Npc_IsOnFP(self,"PICKRICE_3")) && (Wld_IsFPAvailable (self, "PICKRICE_3"))
		{
		    PrintDebugNpc(PD_TA_DETAIL,"Platzwechsel auf Level 3");
			AI_GotoNextFP (self, "PICKRICE_3");
			AI_PlayAni (self,"T_PLUNDER");
			self.aivar[AIV_ITEMFREQ] = (Hlp_Random (5) + 5);
			Npc_SetStateTime (self,0);
		}
	
		else if (Npc_IsOnFP(self,"PICKRICE"))
		{
		    PrintDebugNpc(PD_TA_DETAIL,"keinen freien FP gefunden!");
			AI_PlayAni (self,"T_PLUNDER");
			self.aivar[AIV_ITEMFREQ] = (Hlp_Random (5) + 5);
			Npc_SetStateTime (self,0);
		};
		AI_SetWalkmode (self,NPC_WALK);
	}	
	else if (Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ])
	{
	    PrintDebugNpc(PD_TA_DETAIL,"PickRice Bücken");
		if (Npc_IsOnFP(self,"PICKRICE"))
		{
			AI_PlayAni (self,"T_PLUNDER");
			self.aivar[AIV_ITEMFREQ] = (Hlp_Random (5) + 5);
			Npc_SetStateTime (self,0);
		};
		AI_SetWalkmode (self,NPC_WALK);	
	};
	if (!Npc_IsOnFP(self,"PICKRICE") && Wld_IsFPAvailable (self, "PICKRICE"))
	{
	    AI_GotoFP (self, "PICKRICE");
	};
	AI_Wait(self,1);
};

func void ZS_PickRice_End ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_PickRice_End");
};


	
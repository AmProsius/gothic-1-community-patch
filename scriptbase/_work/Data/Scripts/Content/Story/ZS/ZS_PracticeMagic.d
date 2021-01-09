/********************************************************
* NSC sucht PRACTICEMAGIC-FP und beginnt rumzuzaubern   *
********************************************************/

func void ZS_PracticeMagic	()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_PracticeMagic");
    
	B_SetPerception (self);
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand 
	if !(Hlp_StrCmp(self.wp,Npc_GetNearestWP(self)))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	if (Wld_IsFPAvailable (self, "PRACTICEMAGIC"))
	{
		AI_GotoFP (self,"PRACTICEMAGIC");          
		AI_AlignToFP( self );				//Richte Dich aus
	};
	
	
	self.aivar[AIV_ITEMFREQ] = (Hlp_Random (6) + 4);
};

func void ZS_PracticeMagic_Loop ()
{
    PrintDebugNpc(PD_TA_LOOP,"ZS_PracticeMagic_Loop");
	var int magereaktion;
    magereaktion = Hlp_Random (100);
	if (Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ])
	{
		PrintDebugNpc(PD_TA_LOOP,"ZS_PracticeMagic_Loop Freq");
		if (magereaktion <= 25)
		{
			PrintDebugNpc(PD_TA_LOOP,"ZS_PracticeMagic_Loop");
			AI_PlayAni (self,"T_PRACTICEMAGIC");
			self.aivar[AIV_ITEMFREQ] = (Hlp_Random (6) + 4);
			Npc_SetStateTime (self,0);
		}
		else if (magereaktion <= 50)
		{
			PrintDebugNpc(PD_TA_LOOP,"ZS_PracticeMagic_Loop");
			AI_PlayAni (self,"T_PRACTICEMAGIC2");
			self.aivar[AIV_ITEMFREQ] = (Hlp_Random (6) + 4);
			Npc_SetStateTime (self,0);
		}
		else if (magereaktion <= 70)
		{
			PrintDebugNpc(PD_TA_LOOP,"ZS_PracticeMagic_Loop");
			AI_PlayAni (self,"T_PRACTICEMAGIC3");
			self.aivar[AIV_ITEMFREQ] = (Hlp_Random (6) + 4);
			Npc_SetStateTime (self,0);
		}
		else if (magereaktion <= 90)
		{
			PrintDebugNpc(PD_TA_LOOP,"ZS_PracticeMagic_Loop");
			AI_PlayAni (self,"T_PRACTICEMAGIC4");
			self.aivar[AIV_ITEMFREQ] = (Hlp_Random (6) + 4);
			Npc_SetStateTime (self,0);
		}
		else if (magereaktion <= 100)
		{
			PrintDebugNpc(PD_TA_LOOP,"ZS_PracticeMagic_Loop");
			AI_PlayAni (self,"R_SCRATCHHEAD");
			self.aivar[AIV_ITEMFREQ] = (Hlp_Random (6) + 4);
			Npc_SetStateTime (self,0);
		};
	};
	
	AI_Wait(self,1);
	//AI_AlignToFP(self);
};

func void ZS_PracticeMagic_End ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_PracticeMagic_End");
};

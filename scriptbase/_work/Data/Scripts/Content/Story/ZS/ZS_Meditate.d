/****************************************************
*    NSC sucht MEDITATE-FP und beginnt anzubeten    *
****************************************************/

func void ZS_Meditate()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_Meditate");
    
	B_SetPerception (self);    	
	AI_SetWalkmode (self,NPC_WALK);			// Walkmode für den Zustand 
	if !(Npc_IsOnFP(self,"MEDITATE"))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};	
	if (Wld_IsFPAvailable (self, "MEDITATE"))
	{
		AI_GotoFP (self,"MEDITATE");
		AI_AlignToFP( self );				//Richte Dich aus
	};
	Wld_DetectNpc   (self, -1, ZS_Teaching, -1);
	if (Npc_GetDistToNpc (self,other) <= PERC_DIST_INTERMEDIAT)
	{
		B_SmartTurnToNpc (self,other);
	};	
	

	
	AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
};
func void ZS_Meditate_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_Meditate_Loop");
	
	var int praytime;
	praytime = Hlp_Random (100);
	if (praytime <= 2)
	{
		AI_PlayAniBS (self,"T_PRAY_RANDOM",BS_SIT);
	};
	if praytime >=98
	{
		AI_Output(self, NULL, "ZS_Meditate_Om"); //Omm...
	};
	AI_Wait(self,1);
	//AI_AlignToFP(self);
};

func void ZS_Meditate_End ()
{
    C_StopLookAt(self);
	AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
	
	PrintDebugNpc(PD_TA_FRAME,"ZS_Meditate_End");
};


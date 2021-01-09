/****************************************************
*          NSC sucht WASH-FP und wäscht sich        *
****************************************************/

func void ZS_WashSelf ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_WashSelf");
    
	B_SetPerception (self);
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
	if !(Npc_IsOnFP(self,"WASH"))
	{
		AI_GotoWP (self,self.wp);			// Gehe zum Tagesablaufstart
	}	
	if (Wld_IsFPAvailable (self,"WASH"))
	{
		AI_GotoFP (self, "WASH");
		AI_AlignToFP( self );				//Richte Dich aus
		AI_PlayAni (self, "T_STAND_2_WASH");
	};
	

};


func void ZS_WashSelf_Loop ()
{
    PrintDebugNpc(PD_TA_LOOP,"ZS_WashSelf_Loop");   
    AI_Wait(self,1);
    //AI_AlignToFP(self);
};	

func void ZS_WashSelf_End ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_WashSelf_End");
    
	AI_PlayAni (self,"T_WASH_2_STAND");
};


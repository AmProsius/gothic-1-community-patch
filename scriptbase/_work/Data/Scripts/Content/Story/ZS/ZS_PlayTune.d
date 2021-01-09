/*****************************************
* NSC sucht PLAYTUNE-FP und spielt Laute *
*****************************************/

FUNC VOID ZS_PlayTune()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_PlayTune");
    
	B_SetPerception (self);    
	AI_SetWalkmode (self,NPC_WALK);
	if !(Npc_IsOnFP(self,"PLAYTUNE"))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
};

FUNC VOID ZS_PlayTune_Loop ()
{
    PrintDebugNpc(PD_TA_LOOP,"ZS_PlayTune_Loop");
	
	if (Npc_HasItems (self,ItMiLute) <=1)
	{
		CreateInvItem ( self, ItMiLute);
	};	
	if !(Npc_IsOnFP(self,"PLAYTUNE"))
	{
		AI_GotoFp (self,"PLAYTUNE");
		AI_AlignToFP( self );				//Richte Dich aus
	};
	if (!C_BodyStateContains(self, BS_ITEMINTERACT))
	{
		AI_UseItemToState 	(self,ItMiLute,1);
	};
/*	
	if (C_BodyStateContains(self, BS_ITEMINTERACT))
	{
    	var int tunereaktion;
    	tunereaktion = Hlp_Random (100);
    	
    	if (tunereaktion >= 50)
    	{
    		AI_PlayAniBS (self,"T_LUTE_RANDOM_1",BS_ITEMINTERACT);
    	}
    	else if (tunereaktion >= 00)
    	{
    		AI_PlayAniBS (self,"T_LUTE_RANDOM_2",BS_ITEMINTERACT);
    	};
    };	
	//AI_AlignToFP(self);
*/	
};

FUNC VOID ZS_PlayTune_End() 
{ 
	AI_UseItemToState 	(self,ItMiLute,-1);
	
	PrintDebugNpc(PD_TA_FRAME,"ZS_PlayTune_End");
};


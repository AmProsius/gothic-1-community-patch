func void ZS_Babe_Flee ()
{	
	B_FullSTop	(self);
	PrintDebugNpc		(PD_ZS_FRAME, "ZS_Babe_Flee" );			
	AI_SetWalkmode		(self,	NPC_RUN );		
	B_Say				(self,	NULL,	"$HELP");
	AI_UnequipArmor		(self);
	if !Hlp_IsValidNpc(other)
	{
	    PrintDebugNpc(PD_ZS_CHECK,"Other nicht Valid.");
	    AI_ContinueRoutine	( self);
	}
	else
	{
	    PrintDebugNpc(PD_ZS_CHECK,"Ich hau lieber ab.");
	    Npc_SetTarget(self,other);
	    
	    Npc_GetTarget	( self);
	    AI_Flee(self);
	    
	};
};

func int ZS_Babe_Flee_Loop ()
{	
	PrintDebugNpc( PD_ZS_LOOP, "ZS_Babe_Flee_Loop" );			
	AI_Flee(self);
	var int state_time;
	state_time	= Npc_GetStateTime	( self);
	var string state_time_str;
	state_time_str = IntToString	(state_time);
	if (Npc_GetStateTime	( self) >= 5)
	{	
		AI_ContinueRoutine	( self);
	};
	
};

func void ZS_Babe_Flee_End ()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Babe_Flee_End" );				
};


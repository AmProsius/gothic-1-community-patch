// original spieler
func void ZS_PC_Controlling()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"ZS_PC_Controlling");
	
	Npc_PercEnable  ( self, PERC_ASSESSMAGIC	,	B_AssessMagic	);
	Npc_PercEnable  ( self, PERC_ASSESSDAMAGE	,	ZS_ReactToDamage );	
	
	Npc_PlayAni			(self, "T_CONSHOOT_2_CONACTIVE" );
};


func void ZS_PC_Controlling_Loop()
{	
	PrintDebugNpc		(PD_ZS_LOOP, "ZS_PC_Controlling_Loop" );	
//	Npc_PlayAni			(self, "S_CONACTIVE" );
};


func void ZS_PC_Controlling_End()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_PC_Controlling_End" );

	Npc_ClearAIQueue	( self );		// alle AI Befehle entfernen
	AI_StandUp			( self );		// normale Ani wieder abspielen
	AI_ContinueRoutine	( self );		
};


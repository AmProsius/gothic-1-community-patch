func void B_SitUp()
{
	if (self.attribute[ATR_HITPOINTS] <20)
	{
		AI_PlayAniBS	(self, "T_GUARDSLEEP_2_GUARDSIT",BS_SIT );
		AI_Wait (self,1);
	};
	AI_StartState	(self,ZS_Talk,1,"");
};

func void B_AwakeSit()
{
	AI_PlayAniBS ( self, "T_GUARDSIT_2_STAND", BS_STAND );
	AI_Wait	(self,1);
	if (Npc_GetDistToNpc(other,self) < 120) 
	{
		AI_Dodge (self);
	};
	AI_StartState	(self,ZS_Talk,1,"");
};

func void ZS_WaitForRescue()
{
	Npc_PercEnable  	(self,	PERC_ASSESSMAGIC		,	B_AssessMagic		);
	Npc_PercEnable		(self,	PERC_ASSESSTALK			,	B_SitUp				);
	
	PrintDebugNpc(PD_ZS_FRAME,"WaitForRescue");
	
	if ( !(C_BodystateContains(self, BS_SIT)) )
	{
		PrintDebugNpc(PD_ZS_FRAME,"ZS_WaitForRescue: sitzt nicht....");
		Npc_ClearAIQueue( self );
		AI_SetWalkmode( self, NPC_WALK);		// Walkmode für den Zustand
		AI_GotoWP( self, self.wp );		// Gehe zum Tagesablaufstart
		AI_AlignToWP	(self);
		AI_PlayAniBS( self, "T_STAND_2_GUARDSIT", BS_SIT );
		
	};
	if (self.attribute[ATR_HITPOINTS] <20)
	{
		AI_PlayAniBS( self, "T_GUARDSIT_2_GUARDSLEEP",BS_SIT );
	};
	
};
func void ZS_WaitForRescue_Loop()
{
    PrintDebugNpc( PD_ZS_FRAME, "ZS_WaitForRescue_Loop" );    
};

func void ZS_WaitForRescue_End ()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_WaitForRescue_End");	
	Npc_ClearAIQueue( self );
	AI_PlayAniBS ( self, "T_GUARDSIT_2_STAND", BS_STAND );
};

instance FreemineOrc(C_NPC)
{
	//-------- primary data --------
	
	name =	"Orc Slave";
	guild =	GIL_NONE;  
	level =	3;
	flags = NPC_FLAG_IMMORTAL;  
	voice =	17;
	ID	  =	2101;

		//---------	abilities --------
	attribute[ATR_STRENGTH]			=		90;
	attribute[ATR_DEXTERITY]		=		20;
	
	attribute[ATR_HITPOINTS_MAX]	=		250;
	attribute[ATR_HITPOINTS]		=		10;

	protection[PROT_EDGE]			=		15;
	protection[PROT_BLUNT]			=		15;
	protection[PROT_POINT]			=		5;
	protection[PROT_FIRE]			=		7;
	protection[PROT_MAGIC]			=		0;

//	talents					=		0;
	

	//-------- visuals --------
	Mdl_SetVisual		(self,"orc.mds");
	Mdl_SetVisualBody	(self,"Orc_BodySlave",DEFAULT,DEFAULT,"Orc_HeadSlave", DEFAULT,  DEFAULT,-1);


	//-------- ai --------
//	start_aistate				=		ZS_Orc_Stomper;//SN: wegen Überarbeitung Ork-AI entfernt
	fight_tactic				=		FAI_ORC;
	senses_range				=		2000;	


	//-------------Daily Routine-------------
	daily_routine = Rtn_FMstart_2101;

};

func void Rtn_FMstart_2101()
{
	TA_WaitForRescue		( 23,00, 12,00, "FM_RESCUE" );
	TA_WaitForRescue		( 12,00, 23,00, "FM_RESCUE" );
};

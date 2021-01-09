//////////////////////////////////////////////////////////////////////////
//	ZS_MM_SummonedByPC
//	==================
//	Zustand für die zustandsgesteuerten Monster, die vom SC beschwört
//	werden.
//
//	
//////////////////////////////////////////////////////////////////////////
func void ZS_MM_SummonedByPC()
{
	PrintDebugNpc			(PD_MST_FRAME,	"ZS_MM_SummonedByPC");
	
	Npc_SetTempAttitude		(self,	ATT_FRIENDLY); 
	Npc_SetAttitude			(self,	ATT_FRIENDLY);
	
	Npc_PercEnable			(self,	PERC_ASSESSENEMY,	B_SummonedByPC_AssessEnemy);
	Npc_PercEnable			(self,	PERC_ASSESSPLAYER,	B_SummonedByPC_AssessSC);
	Npc_PercEnable			(self,  PERC_ASSESSFIGHTSOUND, B_MM_SummonedByPCAssessOthersDamage);
	Npc_SetPercTime			(self,	0.5);

	Npc_PercEnable			(self,	PERC_ASSESSMAGIC,  	B_AssessMagic);
	Npc_PercEnable			(self,	PERC_ASSESSDAMAGE,	ZS_MM_Attack);
	
	AI_StandUp				(self);
};

func int ZS_MM_SummonedByPC_Loop()
{
	PrintDebugNpc			(PD_MST_LOOP,	"ZS_MM_SummonedByPC_Loop");
	PrintGlobals			(PD_MST_DETAIL);

	if (Npc_GetStateTime(self) > self.aivar[AIV_MM_TimeLooseHP])
	{
		//-------- Kreatur wird nach einiger Zeit schwächer !--------
		Npc_ChangeAttribute	(self, ATR_HITPOINTS, -1);
		Npc_SetStateTime	(self,	0);
	};

	if (Npc_GetNextTarget(self))
	{
		//-------- neues Ziel entdeckt ! --------
		PrintDebugNpc		(PD_MST_CHECK,	"...neuer Gegner gefunden");
		Npc_SetTarget		(self,	other);	
		Npc_ClearAIQueue	(self);
		AI_StartState		(self,	ZS_MM_Attack, 0, "");
	}
	else
	{
		//-------- SC-Meister folgen ! --------
		if (Npc_GetDistToNpc(self,hero) > self.aivar[AIV_MM_DistToMaster])
		{
			AI_GotoNpc		(self,	hero);
		}
		else
		{
			if (!Npc_CanSeeNpc(self,hero))
			{	
				AI_TurnToNpc	(self,	hero);
				AI_TurnToNpc	(self,	hero);
				AI_TurnToNpc	(self,	hero);
			};
		};
		
		//AI_Wait				(self,	1);
		return				LOOP_CONTINUE;
	};
};

func void ZS_MM_SummonedByPC_End()
{
	PrintDebugNpc			(PD_MST_FRAME,	"ZS_MM_SummonedByPC_End");
};


func void B_SummonedByPC_AssessSC()
{
	PrintDebugNpc			(PD_MST_FRAME,	"B_SummonedByPC_AssessSC");
	
	if (Npc_GetDistToNpc(self,hero) < self.aivar[AIV_MM_DistToMaster])
	{
		PrintDebugNpc		(PD_MST_CHECK,	"...SC-Meister jetzt nahe genug!");
		B_FullStop			(self);
	};
};

func void B_SummonedByPC_AssessEnemy ()
{
	PrintDebugNpc			(PD_MST_FRAME,	"B_SummonedByPC_AssessEnemy");
	PrintGlobals			(PD_MST_CHECK);
	
	//-------- keine SC-Begleiter angreifen --------
	if ( (!other.aivar[AIV_PARTYMEMBER]) && (other.npctype != NPCTYPE_FRIEND) )
	{
		AI_StartState(self,	ZS_MM_Attack,	0,	"");
	};
};

func void B_MM_SummonedByPCAssessOthersDamage()
{
	var C_NPC her; 	her 	= Hlp_GetNpc(PC_Hero);
	var C_NPC rock;	rock 	= Hlp_GetNpc(PC_Rockefeller);
	
	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(her)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(rock))
	{
		
		if (!Npc_IsInState(self, ZS_MM_Attack))
		{	
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self, victim);
			AI_StartState(self, ZS_MM_Attack, 0, "");
		};
	}
	else if (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(her)) || (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(rock))
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self, other);
		AI_StartState(self,	ZS_MM_Attack,	0,	"");
	};
};
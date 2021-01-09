func void B_StopZapped()
{	
	PrintDebugNpc	(PD_MAGIC,	"B_StopZapped");

 	Npc_PercDisable	(self, PERC_ASSESSSTOPMAGIC);
	Npc_ClearAIQueue(self );		// alle AI Befehle entfernen
	AI_StandUp		(self);

	if (C_NpcIsHuman(self) || C_NpcIsOrc(self))
	{
		AI_StartState	(self,	ZS_ReactToDamage, 0, "");
	}
	else if (C_NpcIsMonster(self))
	{
		AI_StartState	(self,	ZS_MM_Attack, 0, "");
	};
	
	return;	
};


func int ZS_Zapped()
{
	PrintDebugNpc		(PD_MAGIC,	"ZS_Zapped");

	Npc_PercEnable		(self, PERC_ASSESSSTOPMAGIC, B_StopZapped);
	Npc_PercEnable		(self, PERC_ASSESSMAGIC, 	B_AssessMagic);
	
	if ( !Npc_HasBodyFlag	( self, BS_FLAG_INTERRUPTABLE) )
	{
		PrintDebugNpc		(PD_MAGIC,	"bodystate not interuptable, standing up...");
		AI_StandUp (self);
	};
	
	if ( !Npc_IsDead(self) && !Npc_IsInState(self, ZS_Unconscious) && !C_BodystateContains(self,BS_SWIM) &&  !C_BodystateContains(self,BS_DIVE) )
	{
		PrintDebugNpc		(PD_MAGIC,	"...NSC ist nicht bewuﬂtlos / tot / schwimmend / tauchend");
		AI_PlayAni			(self, "T_STAND_2_LIGHTNING_VICTIM" );
	};
};


func int ZS_Zapped_Loop ()
{	
	PrintDebugNpc		(PD_MAGIC, "ZS_Zapped_Loop" );

	B_MagicHurtNpc 		(other,	SPL_ZAPPED_DAMAGE_PER_SEC);

	if	(self.attribute[ATR_HITPOINTS] <= 0)
	{
		Npc_ClearAIQueue(self );		// alle AI Befehle entfernen
		AI_StandUp		(self);
	
		return			LOOP_END;
	};

	AI_Wait				(self,	1);
	
	return 				LOOP_CONTINUE;
};


func void ZS_Zapped_End()
{
	PrintDebugNpc		(PD_MAGIC, "ZS_Zapped_End");
};

func void B_StopShortZapped()
{	
	PrintDebugNpc	(PD_MAGIC,	"B_StopShortZapped");

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


func int ZS_ShortZapped()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"ZS_ShortZapped");
	
	if ( !Npc_HasBodyFlag	( self, BS_FLAG_INTERRUPTABLE) )
	{
		PrintDebugNpc		(PD_MAGIC,	"bodystate not interuptable, standing up...");
		AI_StandUp (self);
	};
	
	if ( !Npc_IsDead(self) && !Npc_IsInState(self, ZS_Unconscious) && !C_BodystateContains(self,BS_SWIM) &&  !C_BodystateContains(self,BS_DIVE) )
	{
		PrintDebugNpc		(PD_MAGIC,	"...NSC ist nicht bewußtlos / tot / schwimmend / tauchend");
		AI_PlayAni			(self, "T_STAND_2_LIGHTNING_VICTIM" );
	};
};


func int ZS_ShortZapped_Loop ()
{	
	PrintDebugNpc			(PD_ZS_LOOP, "ZS_ShortZapped Loop" );
	
	if	(Npc_GetStateTime(self) > SPL_TIME_SHORTZAPPED)	
	{
		B_StopShortZapped();
	};
	AI_Wait					(self,	1);
};


func void ZS_ShortZapped_End()
{
	PrintDebugNpc		( PD_ZS_FRAME, "ZS_ShortZapped_End" );
};

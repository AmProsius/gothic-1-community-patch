func void B_StopMagicFreeze()
{	
	PrintDebugNpc		(PD_MAGIC,	"B_StopMagicFreeze");
	PrintGlobals		(PD_MAGIC);

	Npc_ClearAIQueue	(self);		// alle AI Befehle entfernen
	AI_StandUp			(self);

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


func int ZS_MagicFreeze()
{
	PrintDebugNpc		(PD_MAGIC,	"ZS_MagicFreeze");
	PrintGlobals		(PD_MAGIC);

	Npc_PercEnable		(self, PERC_ASSESSMAGIC		,	ZS_MagicFreeze);

	// Opfer wird in Bodystate Unconscious versetzt
	if (!C_BodyStateContains(self, BS_UNCONSCIOUS))
	{
		AI_PlayAniBS 		(self, "T_STAND_2_FREEZE_VICTIM", BS_UNCONSCIOUS);
	};
	
	if (self.attribute[ATR_HITPOINTS] > (SPL_FREEZE_DAMAGE+1-self.protection[PROT_MAGIC]))
	{
		//	DAMAGE: Opfer verliert HPs nur wenn er noch mehr hat als der verursachte Schaden (keine Ohnmacht oder Tod!) 
		B_MagicHurtNpc 		(other,	SPL_FREEZE_DAMAGE);
	};
};


func int ZS_MagicFreeze_Loop ()
{	
	PrintDebugNpc			(PD_ZS_LOOP, "ZS_MagicFreeze_Loop" );

	if (Npc_GetStateTime(self) > SPL_TIME_FREEZE)
	{
		B_StopMagicFreeze();
		return			LOOP_END;
	};

	AI_Wait				(self,	1);
	return				LOOP_CONTINUE;
};


func void ZS_MagicFreeze_End()
{
	PrintDebugNpc		(PD_ZS_FRAME, "ZS_MagicFreeze_End" );
};

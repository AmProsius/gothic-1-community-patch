func void ZS_PsiDefense()
{
	PrintDebugNpc		(PD_ZS_CHECK,	"ZS_PsiDefense");

	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE	,	ZS_ReactToDamage);	
	Npc_PercEnable		(self,	PERC_ASSESSSTOPMAGIC,	B_StopPsiDefense);
	
	if ( !Npc_HasBodyFlag(self, BS_FLAG_INTERRUPTABLE) )
	{
		PrintDebugNpc	(PD_MAGIC,	"bodystate not interuptable, standing up...");
		AI_StandUp 		(self);
	};
};


func void ZS_PsiDefense_Loop()
{
	PrintDebugNpc		(PD_ZS_LOOP,	"ZS_PsiDefense Loop");	
	if ( !Npc_IsDead(self) && !Npc_IsInState(self, ZS_Unconscious) && !C_BodystateContains(self,BS_SWIM) &&  !C_BodystateContains(self,BS_DIVE) )
	{
		PrintDebugNpc		(PD_MAGIC,	"...NSC ist nicht bewuﬂtlos / tot / schwimmend / tauchend");
		AI_PlayAni		(other,	"S_CON_VICTIM");	
	};
};


func void ZS_PsiDefense_End()
{
	PrintDebugNpc		(PD_ZS_CHECK,	"ZS_PsiDefense End");

};

func void B_StopPsiDefense ()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"B_StopPsiDefense" );

	if ( !Npc_IsDead(self) && !Npc_IsInState(self, ZS_Unconscious) )
	{	
		B_FullStop		(self);
		AI_StartState	(self,	ZS_AssessEnemy,	1,	"");				
	};
};
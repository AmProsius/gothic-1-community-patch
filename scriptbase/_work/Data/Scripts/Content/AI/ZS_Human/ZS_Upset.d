func void ZS_Upset ()
{
	PrintDebugNpc			(PD_ZS_FRAME,"ZS_Upset");
	C_ZSInit				();
	
	Npc_PercEnable  		(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage	);	
	Npc_PercEnable  		(self,	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable  		(self,	PERC_ASSESSMAGIC		,	B_AssessMagic		);
	Npc_PercEnable  		(self,	PERC_ASSESSCASTER		,	B_AssessCaster	);
};

func int ZS_Upset_Loop ()
{
	PrintDebugNpc				(PD_ZS_LOOP,	"ZS_Upset_Loop");

	if (C_NpcIsDown(other))
	{
		PrintDebugNpc			(PD_ZS_LOOP,"...other kampfunfähig!");
		return 					LOOP_END;
	};
	
	if (!C_OtherIsToleratedEnemy(self,other))
	{
		PrintDebugNpc			(PD_ZS_LOOP,"...'other' nicht mehr geduldet!");
		return 					LOOP_END;
	};
	
	if (Npc_GetDistToNpc(self,other)<HAI_DIST_ASSESSTOLERATEDENEMY)
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...other noch nah genug!");

		//-------- Random Jubel --------
		AI_TurnToNpc(self,	other);
		B_SayOverlay(self,	other,	"$HeyHeyHey");	
		AI_PlayAni	(self,	"T_ANGRY");
		
		//-------- auf Distanz gehen/bleiben --------
		if (Npc_GetDistToNpc(self, other) < PERC_DIST_WATCHFIGHT)
		{
			PrintDebugNpc	(PD_ZS_LOOP,"... zu nahe an 'other'!");
			AI_TurnToNpc	(self, other);
			AI_Dodge		(self);
			return			LOOP_CONTINUE;
		};
	}
	else
	{
		return				LOOP_END;
	};

	return					LOOP_CONTINUE;
};

func void ZS_Upset_End ()
{	
	PrintDebugNpc		(PD_ZS_FRAME, "ZS_Upset_End" );
};
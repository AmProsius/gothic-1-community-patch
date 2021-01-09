func void ZS_Erpresser()
{
	PrintDebugNpc	(PD_TA_FRAME,	"ZS_Erpresser");

	//-------- Wahrnehmungen --------
	Npc_PercEnable 	(self,	PERC_ASSESSPLAYER		,	B_AssessSC			);

	Npc_PercEnable	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage	);
	Npc_PercEnable	(self,	PERC_ASSESSMAGIC		,	B_AssessMagic		);
	Npc_PercEnable 	(self, 	PERC_ASSESSCASTER		,	B_AssessCaster		);
	Npc_PercEnable 	(self, 	PERC_ASSESSTHREAT		,	B_AssessFighter		);
	Npc_PercEnable 	(self,	PERC_DRAWWEAPON			, 	B_AssessFighter		);		
	Npc_PercEnable  (self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable  (self, 	PERC_ASSESSQUIETSOUND	,	B_AssessQuietSound	);
	Npc_PercEnable	(self,	PERC_ASSESSTALK			,	B_AssessTalk				);

	Npc_SetPercTime	(self,	1);
	
	//-------- Positionieren --------
	AI_GotoWP 		(self,	self.WP);
	if (Wld_IsFPAvailable(self,"FP_"))
	{																	
		AI_GotoFP 	(self,	"FP_");
		AI_AlignToFP( self );				//Richte Dich aus
	};
};

func void ZS_Erpresser_Loop()
{
	PrintDebugNpc	(PD_TA_LOOP,	"ZS_Erpresser_Loop");

	if (Npc_GetDistToNpc(self,hero)>2000)
	{
		self.aivar[AIV_HAS_ERPRESSED] = 0;
	};
	
	B_SmartTurnToNpc(self,other);
	AI_Wait			(self,	0.5);
};

func void ZS_Erpresser_End()
{
	PrintDebugNpc	(PD_TA_FRAME,	"ZS_Erpresser_End");
};


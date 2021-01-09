//////////////////////////////////////////////////////////////////////////
//	ZS_Listen
//	===========
//	Der NSC setzt sich auf einen "LISTEN"-Freepoint und dreht sich zu
//	einem gefundenen Lehrer (ZS_Teaching)
//////////////////////////////////////////////////////////////////////////
func void ZS_Listen()
{
	PrintDebugNpc		(PD_TA_FRAME,"ZS_LISTEN");
	
	self.aivar[AIV_FOUNDPERSON] = FALSE;
	
	OccupiedPerception();    
	if (!C_BodyStateContains(self, BS_SIT))
	{
		AI_GotoWP		(self, self.wp);               // Gehe zum Tagesablaufstart
	};
};

func void ZS_Listen_Loop()
{
    PrintDebugNpc			(PD_TA_LOOP,"ZS_LISTEN");

 	
	//-------- Nach Redner/Lehrer Ausschau halten --------
	if (self.aivar[AIV_FOUNDPERSON] == FALSE)
	{
		PrintDebugNpc		(PD_TA_CHECK,	"...bisher keinen Redner gefunden...!");
 		B_GotoFP			(self, "LISTEN");
		Npc_PerceiveAll		(self);
		if (Wld_DetectNpc(self, -1, ZS_Teaching, -1))
		{
			PrintDebugNpc	(PD_TA_CHECK,	"...aber JETZT einen Redner gefunden...!");
			if (Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG)
			{
				PrintDebugNpc(PD_TA_CHECK,	"...der nah genug ist!");
				AI_TurnToNpc(self,	other);
				AI_PlayAniBS(self,	"T_STAND_2_SIT", BS_SIT); 
				C_LookAtNpc	(self,	other);
				self.aivar	[AIV_FOUNDPERSON] = TRUE;
			};	
		};
	};

    AI_Wait					(self,	1);
};

func void ZS_Listen_End ()
{
	PrintDebugNpc			(PD_TA_FRAME,	"ZS_Listen_End");
	
	if (C_BodyStateContains(self, BS_SIT))
	{
		AI_PlayAniBS 		(self,	"T_SIT_2_STAND",	BS_STAND);
		C_StopLookAt 		(self);
	};
};




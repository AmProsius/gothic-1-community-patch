func void ZS_ClearRoom ()
{	
	PrintDebugNpc		(PD_ZS_FRAME, "ZS_ClearRoom" );		

	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE  		,	ZS_ReactToDamage	);		
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic		);			
	Npc_PercEnable  	(self, 	PERC_ASSESSENTERROOM	,	B_ClearRoomEnterRoom);			
	Npc_PercEnable  	(self, 	PERC_ASSESSUSEMOB		,	B_ClearRoomUseMob	);			
	Npc_PercEnable  	(self,	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable  	(self,	PERC_MOVENPC			,	B_StopGotoHero		);
	
	C_ZSInit();
	B_WhirlAround		(self,	other);
    AI_PointAtNpc		(self,	other);
    B_Say				(self,	other,	"$HEYYOU");
    AI_StopPointAt		(self);		
    AI_SetWalkmode		(self,	NPC_RUN);
	Npc_SetTarget		(self,	other);
};

func int ZS_ClearRoom_Loop ()
{
	PrintDebugNpc		(PD_ZS_LOOP, "ZS_ClearRoom_Loop" );		

	Npc_GetTarget		(self);
	

	//-------- SC hat mittlerweile den Raum verlassen --------
    var int 			portalguild;
    portalguild = 		Wld_GetPlayerPortalGuild();
    PrintGuild			(PD_ZS_CHECK, portalguild);

	if	(portalguild == GIL_NONE)
	||	(Wld_GetGuildAttitude(self.guild, portalguild) != ATT_FRIENDLY)
	||	(Npc_GetAttitude(self,other) == ATT_FRIENDLY)
	{
		B_FullStop		(self);
		AI_ContinueRoutine(self);
		return			LOOP_END;
	};

	//-------- NSC hat den SC erreicht ! --------
	if (Npc_GetDistToNpc(self, other) < PERC_DIST_DIALOG
	&&	Npc_CanSeeNpc	(self, other)					)
	{
		B_FullStop		(self);
		return			LOOP_END;
	};

    AI_GotoNpc			(self,	other);
	AI_Wait				(self,	0.5);

	return				LOOP_CONTINUE;
};

func void ZS_ClearRoom_End ()
{
	PrintDebugNpc		(PD_ZS_FRAME, "ZS_ClearRoom_End" );		

	AI_TurnToNpc		(self, 	other);
	if (C_AmIStronger 	(self, 	other))
	{
		PrintDebugNpc	(PD_ZS_CHECK, "...Nsc ist stärker!");
		B_DrawWeapon	(self,	other);
		B_Say			(self, 	other, "$GETOUTOFHERE");
		AI_StartState	(self, 	ZS_ClearRoomWait, 0, "");			
	}
	else
	{
		PrintDebugNpc	(PD_ZS_CHECK, "...Nsc ist schwächer!");
		B_Say 			(self, 	other, "$WHYAREYOUINHERE ");
		AI_StartState	(self, 	ZS_ClearRoomWait, 0, "");			
	};
};

func void ZS_ClearRoomWait ()
{	
	PrintDebugNpc		(PD_ZS_FRAME, "ZS_ClearRoomWait" );		

	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE  		,	ZS_ReactToDamage	);		
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic		);			
	Npc_PercEnable  	(self, 	PERC_ASSESSENTERROOM	,	B_ClearRoomEnterRoom);			
	Npc_PercEnable  	(self, 	PERC_ASSESSUSEMOB		,	B_ClearRoomUseMob	);			
	Npc_PercEnable  	(self,	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	C_ZSInit();
};

func void ZS_ClearRoomWait_Loop ()
{
	/*
	if (other.aivar[AIV_DIDWAITTOCLEARROOM]	== 1)
	{
		other.aivar[AIV_DIDWAITTOCLEARROOM]	= 0;
		AI_ContinueRoutine	( self);
	};
	*/
	PrintDebugNpc			(PD_ZS_LOOP, "ZS_ClearRoomWait_Loop" );		
	if (Npc_GetStateTime(self) > 8)
	{
		PrintDebugNpc			(PD_ZS_CHECK, "...NSC wartet seit 8 Sekunden!");
		if	(Wld_GetPlayerPortalGuild () == GIL_NONE)
		||	(Npc_GetAttitude(self, other) == ATT_FRIENDLY)
		{
			if (C_AmIStronger(self,other))
			{
				AI_TurnToNpc(self,	other);
				B_Say 		(self, 	other, "$WISEMOVE");
			};
			AI_ContinueRoutine(self);
		}
		else if (C_AmIStronger	(self,other))
		{
			B_Say 			(self, other, "$YOUASKEDFORIT");
			Npc_SetTarget	(self,other);
			AI_StartState	(self,	ZS_Attack, 0, "");
		}
		else
		{
			AI_StartState	(self,	ZS_CallGuardsOnEnterRoom,	0,	"");
		};
	}; 
	
	AI_Wait						(self,	1);       
};

func void ZS_ClearRoomWait_End ()
{	
	PrintDebugNpc		(PD_ZS_FRAME, "ZS_ClearRoomWait_End" );		
};

func void B_ClearRoomEnterRoom()
{
	PrintDebugNpc		(PD_ZS_FRAME, "B_ClearRoomEnterRoom" );		
	B_FullStop		( self);
	if (Npc_CanSeeNpcFreeLOS(self,other))
	{
		PrintDebugNpc	(PD_ZS_CHECK, "...NSC kann SC sehen!");
		if (Wld_GetPlayerPortalGuild () == GIL_NONE )
		{
			PrintDebugNpc	(PD_ZS_CHECK, "...SC nicht mehr im Raum!");
			if (C_AmIStronger(self,other))
			{
				AI_TurnToNpc(self,	other);
				B_Say 		(self, 	other, "$WISEMOVE");
			};
			AI_ContinueRoutine(self);
		}
		else
		{
			PrintDebugNpc	(PD_ZS_CHECK, "...SC wieder im Raum!");
			if (C_AmIStronger(self,other))
			{
				PrintDebugNpc	(PD_ZS_CHECK, "...stronger");
				AI_TurnToNpc(self,	other);
				B_Say 			(self, other, "$YOUASKEDFORIT");
				Npc_SetTarget	(self,other);
				AI_StartState	(self,	ZS_Attack, 0, "");
			}
			else
			{
				PrintDebugNpc	(PD_ZS_CHECK, "...not stronger--> CallGuards");
				AI_StartState	(self,	ZS_CallGuardsOnEnterRoom,	0,	"");
			};
		};
	};
};

func void B_ClearRoomUseMob()
{
	PrintDebugNpc			(PD_ZS_FRAME, "B_ClearRoomUseMob");		

	if	Npc_IsDetectedMobOwnedByNpc(other,	self)
	||	Npc_IsDetectedMobOwnedByGuild(other, self.guild)
	{	
		PrintDebugNpc		(PD_ZS_CHECK,	"...MOB gehört NSC oder seiner Gilde!");

		B_FullStop			(self);
		Npc_PercDisable		(self,	PERC_ASSESSUSEMOB);
		B_AssessAndMemorize	(NEWS_THEFT, NEWS_SOURCE_WITNESS, self, other, self); 
			
		if (C_AmIStronger(self,other))
		{
			B_Say 			(self, 	other,	"$DIRTYTHIEF");
			Npc_SetTarget	(self, 	other);
			AI_StartState	(self, 	ZS_Attack, 0, "");
		}
		else
		{
			AI_StartState	(self,	ZS_CallGuardsOnEnterRoom,	0,	"");
		};
	};
};

func void B_AssessEnterRoom ()
// JP: AUch hier sind die Nsc´s nah genug ( PerceptionRange) --> kein ZS_WarnANdPunish
{
	PrintDebugNpc		(PD_ZS_FRAME,	"B_AssessEnterRoom");
	
	var int self_guild;
	self_guild = self.guild;
    
    PrintGlobals(PD_ZS_CHECK);
    
    var int portalguild;
    portalguild = Wld_GetPlayerPortalGuild();
    PrintGuild(PD_ZS_CHECK, portalguild);
    	
    var int formerportalguild;
    formerportalguild = Wld_GetFormerPlayerPortalGuild ();
    PrintGuild(PD_ZS_CHECK, formerportalguild);
    
    //-------- Monster betritt Raum ! --------
	if (!C_NpcIsHuman(other))
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"Monster betritt Raum!");
		B_FullStop			(self);
		AI_StartState		(self,  ZS_AssessMonster,	0,	"");
	};

    //-------- NSC betritt Raum ! --------
    if (!Npc_IsPlayer	( other))
    {
    	PrintDebugNpc		(PD_ZS_CHECK,	"...NSC betritt Raum!");
		return;
	};

    //-------- Beobachter ist NPCTYPE_FRIEND ! --------
    if	(self.npctype == NPCTYPE_FRIEND)
    ||	(Npc_GetAttitude(self,other) == ATT_FRIENDLY)
    {
    	PrintDebugNpc		(PD_ZS_CHECK,	"...NSC ist NPCTYPE_FRIEND oder ATT_FRIENDLY");
		return;
	};

	if	Npc_CanSeeNpc(self, other)
	||	(!C_BodyStateContains(other,BS_SNEAK) && (Npc_GetDistToNpc(self,other)<HAI_DIST_HEARROOMINTRUDER))	
	{		
		PrintDebugNpc	(PD_ZS_CHECK,	"...Nsc sieht/hört Eindringling!");

        if (C_NpcIsGuard(self))
    	{
    	   
    		//-------- NSC ist Wache --------
    		PrintDebugNpc		(PD_ZS_CHECK,	"...Nsc ist Wache!");
    
    		if		(portalguild != GIL_NONE)
    		&&		(Wld_GetGuildAttitude(self_guild, portalguild)==ATT_FRIENDLY)
    		{
    			PrintDebugNpc	(PD_ZS_CHECK,	"...betretener Portalraum gehört Schützling-Gilde!");
 		 		B_FullStop		(self);
  				AI_StartState	(self,	ZS_ClearRoom, 0, "");
    		}
    		else if (formerportalguild != GIL_NONE)
    		&&		(Wld_GetGuildAttitude(self_guild, formerportalguild)==ATT_FRIENDLY)
    		{
    			PrintDebugNpc	(PD_ZS_CHECK,	"...verlassener Portalraum gehört Schützling-Gilde!");
				B_FullStop		(self);
    			B_WhirlAround	(self,	other);
    			AI_PointAtNpc	(self,	other);
    			B_Say			(self,	other,	"$HEYYOU");
    			AI_StopPointAt	(self);		
    			Npc_PercDisable	(self,	PERC_MOVENPC);
    			AI_SetWalkmode	(self,	NPC_RUN);
    			AI_GotoNpc		(self,	other);
    			B_Say			(self,	other, "$WHATDIDYOUINTHERE");		
    		};
    			
    		
    	}
    	else if (C_NpcIsGuardArcher(self))
    	{
    		PrintDebugNpc		(PD_ZS_CHECK,	"...ich bin Fernkampfwache und ignoriere Räume betreten grundsätzlich!");
    		Npc_PercEnable  	(self, 	PERC_OBSERVEINTRUDER 		,	B_ObserveIntruder);			
    		AI_ContinueRoutine	(self);
    	}
    	else
    	{
    		//-------- NSC ist KEINE Wache --------
    		PrintDebugNpc			(PD_ZS_CHECK,	"...Nsc ist KEINE Wache!");
    		
    		if	(Npc_GetDistToNpc(self,other)<HAI_DIST_CLEARROOM)
    		&&	(portalguild != GIL_NONE)
    		&&	((self_guild==portalguild) || (Wld_GetGuildAttitude(self_guild, portalguild)==ATT_FRIENDLY))
    		{
    			//---- Raum wurde betreten ----
    			PrintDebugNpc		(PD_ZS_CHECK,	"...SC nah & betretener Portalraum gehört Gilde des NSCs");
				B_FullStop			(self);
    			AI_StartState		(self,	ZS_ClearRoom, 0, "");
 				return;
    		};
    
    		if	(Npc_GetDistToNpc(self,other)<HAI_DIST_CLEARROOM)
    		&&	(formerportalguild != GIL_NONE)
    		&&	((self_guild==formerportalguild) || (Wld_GetGuildAttitude(self_guild, formerportalguild)==ATT_FRIENDLY))
    		{
    			//---- Raum wurde verlassen ----
    			PrintDebugNpc		(PD_ZS_CHECK, "...SC nah & SC verläßt eigenen Portalraum");
				B_FullStop			(self);
    	       	B_WhirlAround		(self,	other);
    			AI_PointAtNpc		(self,	other);
    			B_Say				(self,	other,	"$HEYYOU");
    			AI_StopPointAt		(self);		
    			Npc_PercDisable		(self,	PERC_MOVENPC);
    			AI_SetWalkmode		(self,	NPC_RUN);
    			AI_GotoNpc			(self,	other);
    			B_Say				(self,	other, "$WHATDIDYOUINTHERE");		
    		};
    	};
    }
    else
	{		
		PrintDebugNpc	(PD_ZS_CHECK,	"...NSC kann den Eindringling weder sehen noch hören!");
	};
};

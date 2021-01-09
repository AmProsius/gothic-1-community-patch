func void ZS_WakeUp ()
{	
	PrintDebugNpc		(PD_ZS_FRAME, "ZS_WakeUp" );				
	C_ZSInit();

	//-------- Wahrnehmungen --------
	B_SetPerception		(self);
	Npc_PercDisable		(self,	PERC_OBSERVEINTRUDER);
	Npc_PercEnable  	(self, 	PERC_ASSESSENTERROOM	,	B_ClearRoomEnterRoom);
	Npc_PercEnable  	(self, 	PERC_ASSESSUSEMOB 		,	B_ClearRoomUseMob);

	//######## WORKAROUND: da ZS_Sleep_End nicht angesprungen wird ########
	AI_UseMob			(self,	"BEDHIGH",	-1);
	AI_UseMob			(self,	"BEDLOW",	-1);
	AI_UseMob			(self,	"BED",		-1);
	//######## WORKAROUND: Ende ########

	//-------- SC im unerlaubten Raum? --------
	var int portalguild;
	portalguild = Wld_GetPlayerPortalGuild();
	if	((self.guild==portalguild) || (Wld_GetGuildAttitude(self.guild, portalguild)==ATT_FRIENDLY))
	&&	(Npc_GetAttitude(self, other) != ATT_FRIENDLY)
	{
		PrintDebugNpc	(PD_ZS_CHECK, "...Spieler im Raum des NSCs!");				
		B_AssessEnterRoom();
	}
	else
	{
		AI_TurnToNpc	(self,	other);
		B_Say			(self,	other,	"$YOUDISTURBEDMYSLUMBER");
		AI_Wait			(self,	3);
		B_ObserveIntruder();
	};
};

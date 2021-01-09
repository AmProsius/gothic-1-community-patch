/******************************************************************************************** 
*	B_AssessSc()																			*
*	============																			*
*																							* 
********************************************************************************************/ 

// C_Cantalk to kann evtl. raus, wurde ursprünglich nur wegen B_AssessSC-Aufruf aus ZS_Talk implementiert.
// ZS_Talk ruft aber B_AssessSC NICHT mehr auf

// ***********************
// Geklaute Waffen checken
// ***********************

FUNC VOID B_CheckStolenEquipment ()
{
	var C_Item 	melee;
	var C_Item 	ranged;
	var C_ITEM	armor;
	
	melee 	= 	Npc_GetEquippedMeleeWeapon 		(other);
	ranged 	= 	Npc_GetEquippedRangedWeapon 	(other);
	armor	=	Npc_GetEquippedArmor		 	(other);
	
	if (Npc_OwnedByNpc (melee, self))
	{
		PrintDebugNpc (PD_ZS_CHECK,	"...SC trägt Nahkampf-Waffe des NSCs offen!");
		self.aivar[AIV_WANTEDITEM] = Hlp_GetInstanceId (melee);
		if (!Npc_HasNews (self, NEWS_DEFEAT, other, self) && self.aivar [AIV_PCISSTRONGER] == 0)
		{
			PrintDebugNpc 	(PD_ZS_CHECK,	"...NSC ist nicht vom SC besiegt worden & hat noch nicht danach gefragt!");
			Npc_ClearAIQueue( self);
			C_LookAtNpc 	( self, other);
			AI_TurnToNpc 	( self, other);
			AI_PointAtNpc 	( self, other);
			B_Say 			( self, other,"$THATSMYWEAPON");
			AI_StartState 	( self, ZS_GetBackBelongings, 1, "");
			return;
		};
	}
	else if (Npc_OwnedByNpc ( ranged, self))
	{
		PrintDebugNpc (PD_ZS_CHECK,	"...SC trägt Fernkampf-Waffe des NSCs offen!");
		self.aivar[AIV_WANTEDITEM] = Hlp_GetInstanceId (ranged);
		if (!Npc_HasNews (self, NEWS_DEFEAT, other, self) && self.aivar [AIV_PCISSTRONGER] == 0)
		{
			Npc_ClearAIQueue( self);
			C_LookAtNpc 	( self, other);
			AI_TurnToNpc 	( self, other);
			AI_PointAtNpc 	( self, other);
			B_Say 			( self, other,"$THATSMYWEAPON");
			AI_StartState 	( self, ZS_GetBackBelongings, 1, "");
			return;
		};
	};
};

// ***********************
// B_AssessSC
// ***********************
func void B_AssessSc ()
{
	PrintDebugNpc (PD_ZS_FRAME,	"B_AssessSc");
	
	//*********** Extra für Raeuberlager ************
	if (self.npctype == NPCTYPE_ROGUE)
	{
		B_SetRoguesToHostile();
	};
	//***********************************************
	
	if (Npc_CanSeeNpcFreeLOS(self, other)
	&&	(Npc_GetDistToNpc	(self, other) < PERC_DIST_DIALOG) ) 		
	{
		PrintDebugNpc			(PD_ZS_CHECK,	"...SC sichtbar und in Dialogreichweite!");

		//----------- Übernommene NSCs werden von GateGuards geplättet!------------------
		var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
		var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
		
		if 	( 
			( (Hlp_GetInstanceID(her)!=Hlp_GetInstanceID(Hero))&&(Hlp_GetInstanceID(rock)!=Hlp_GetInstanceID(Hero)) )
		&&	( Npc_IsInState(self,ZS_GuardPassage) ) 
			)
		//Npc_IsInState(other, ZS_Controlled) funzt nicht! 
		{
			if (Wld_GetGuildAttitude(self.guild,other.guild)!=ATT_FRIENDLY)
			{
				B_FullStop			(self);	
				B_Say		 		(self,other,"$NOWWAIT");
				B_IntruderAlert		(self,	other);
				B_SetAttackReason	(self,	AIV_AR_INTRUDER);
				Npc_SetTarget		(self,	other);
				AI_StartState		(self,	ZS_Attack,	1,	"");
			};
		};
				
		//-------- Auf Vergabe von Infos & Missionen checken --------
		B_CheckForImportantInfo(self,other);
		
		//-------- SC im Kampfmodus ? --------
		if (C_NpcIsInFightMode(other))
		{
			PrintDebugNpc			(PD_ZS_CHECK,	"...SC im Kampfmodus!");
			B_AssessFighter			();
			return;
		};

		//-------- Zum Spieler drehen --------
		if (!C_BodyStateContains(other, BS_SNEAK))
		{
			PrintDebugNpc			(PD_ZS_CHECK,	"...SC schleicht NICHT!");
			if (Npc_GetDistToNpc(self,other)<HAI_DIST_OBSERVEINTRUDER)
			{
				PrintDebugNpc		(PD_ZS_CHECK,	"...SC in ObserveIntruder-Reichweite!");
				B_ObserveIntruder	();
				return;
			}
			else
			{
				PrintDebugNpc		(PD_ZS_CHECK,	"...SC außerhalb ObserveIntruder-Reichweite!");
			};
		};

		//-------- Auf Verkleidung checken --------
		B_CheckStolenEquipment	();

	};

	//-------- Durchgangswachen resetten ! --------
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN)
	||	(hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN ))
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...SC wurde von Durchgangswachen verwarnt!");
		PrintDebugInt		(PD_ZS_CHECK, "hero.aivar[AIV_GUARDPASSAGE_STATUS] = ", hero.aivar[AIV_GUARDPASSAGE_STATUS]);

		if (Npc_IsInState(self,ZS_GuardPassage) && (Npc_GetDistToNpc(self,hero) > HAI_DIST_GUARDPASSAGE_RESET) )
		{
			PrintDebugNpc	(PD_ZS_CHECK,	"...Status für Durchgangswachen zurücksetzen!");
			hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
		};
	};	
};
			

				
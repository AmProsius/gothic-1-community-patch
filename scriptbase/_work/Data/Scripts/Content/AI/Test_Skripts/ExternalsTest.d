func void ExternalsTest ()
{
};
//func void ExternalsTest ()
//{
//	Print	( "ExternalsTest");
//	
//	PrintMulti	( "PRINTMULTI1", "PRINTMULTI2","PRINTMULTI3","PRINTMULTI4","PRINTMULTI5");
//	
//	PrintDebug	( "PrintDebug : ExternalsTest");
//	
//	Mdl_ApplyRandomAni ( self,"S_RUN", "R_SCRATCHHEAD");
//	Mdl_ApplyRandomAniFreq ( self, "S_RUN", 1); 
//	
//	Mdl_SetModelScale	( self, 1.5, 1.5, 1.5);
//	Mdl_SetModelFatness	( self, 0.75);
//	
//	Mdl_ApplyOverlayMds	(self, "HumanS_WalkA2.MDS");
//	
//	Wld_InsertNpc 	( Sld1_Testmodell, "WP_MOBSIROOM");
//	
//	Wld_InsertItem (ItFoApple, "WP_REPAIR");
//	
//	CreateInvItem	( self, ItFoApple);
//	
//	CreateInvItems	( self, ItFoBooze, 5);
//	
//	Npc_PerceiveAll ( self);
//
//	if ( Wld_DetectItem	( self, ITEM_KAT_FF))
//	{
//		PrintDebug ("Wld_DetectItem : ITEM_KAT_FF");
//		AI_GotoItem	( self, item);
//		if (Npc_CanSeeItem ( self, ItFoApple))
//		{
//			PrintDebug	(" Npc_CanSeeItem I see The Apple");
//		};
//		AI_TakeItem	( self, item);
//		
//		AI_DropItem ( self, item);
//		if ( Npc_OwnedByNpc	( item, self))
//		{
//			PrintDebug	("	Npc_OwnedByNpc sword");	
//			AI_TakeItem	( self, item);
//		};
//		if ( Npc_OwnedByGuild	(item, GIL_SLD))
//		{
//			PrintDebug	("	Npc_OwnedByGuild sword");	
//		};
//			
//		AI_UseItemToState ( self,ItFoApple,0);
//		AI_UseItemToState ( self,ItFoApple,-1);
//		AI_UseItem	( self,ItFoBeer);
//	
//	};
//	
//	if (Npc_HasItems	( self, ItFoBooze))
//	{
//		PrintDebug	( "Npc_HasItems Booze");
//	};
//	
//	Npc_GiveItem	( self, ItFoBooze, other); 
//	if (HLP_ISITEM	(item,2HandSld1))
//	{
//		PrintDebug ("2HandSld1 ist 2HandSld1");
//	};
//	
//	AI_EquipBestMeleeWeapon 	( self);
//	
//	AI_EquipBestArmor	(self);
//		
//	if (Wld_DetectNpc	( self, Sld1_Testmodell,NOFUNC, -1))
//	{
//		PrintDebug ( "Sld1_Testmodell entdeckt");
//	};
//	if (Wld_DetectNpc	( self, -1, ZS_TestHangAround, -1))
//	{
//		PrintDebug ( "ZS_TestHangAround entdeckt");
//	};
//	if (Wld_DetectNpc	( self, -1, NOFUNC, GIL_SLD))
//	{
//		PrintDebug ( "GIL_SLD entdeckt");
//	};
//	
//	if (Hlp_IsValidNpc (self))
//	{
//		PrintDebug	("Hlp_IsValidNpc: self ok");
//	};
//	
//	if (Hlp_IsValidNpc (other))
//	{
//		PrintDebug	("Hlp_IsValidNpc: other ok");
//	};
//	
//	if (Npc_HasDetectedNpc	( self, other))
//	{
//		PrintDebug ("Npc_HasDetectedNpc");
//	};
//	
//	// *******************************************************************************************
//	// ***                                     PLAYER                                          ***
//	// *******************************************************************************************
//
//	if (! Npc_IsPlayer	(other))
//	{
//		PrintDebug ("other is not player");
//	}
//	else
//	{
//		PrintDebug ("other is player");
//	};
//	
//	if ( Wld_DetectPlayer ( self))
//	{
//		PrintDebug	("Wld_DetectPlayer");
//	};
//		
//	var C_Npc	hlp_getnpc;
//	hlp_getnpc = Hlp_GetNpc (Sld1_Testmodell);
//	if (hlp_getnpc  == other)
//	{
//		PrintDebug ("Hlp_GetNpc Sld1_Testmodell detected");
//	};
//	
//	AI_PlayAni	( self, "T_SEARCH");
//	
//	AI_QuickLook( self, other);
//	
//	AI_LookAt	( self, "WP_REPAIR");
//	AI_StopLookAt( self);	
//	
//	AI_LookAtNpc	( self, other);
//	AI_StopLookAt( self);	
//	
//	AI_PointAt	( self, "WP_REPAIR");
//	AI_StopPointAt	( self);
//	
//	AI_PointAtNpc	( self, other);
//	AI_StopPointAt	( self);
//	
//	var int hlp_random;
//	hlp_random = HLP_RANDOM (3);
//	if ( hlp_random == 1)
//	{
//		PrintDebug	( "HLP_RANDOM = 1");
//	}
//	else if ( hlp_random == 2)
//	{
//		PrintDebug	( "HLP_RANDOM = 2");
//	}
//	else
//	{
//		PrintDebug	( "HLP_RANDOM = Else");
//	};
//	
//	var string stringcompare1;
//	var string stringcompare2;
//	stringcompare1 = "stringcompare1";
//	stringcompare2 = "stringcompare1";
//	if (Hlp_StrCmp	( stringcompare1,stringcompare2))
//	{
//		PrintDebug	("Hlp_StrCmp klappt");
//	};
//	
//	if (Wld_GetDay () == 0)
//	{
//		PrintDebug	( "Wld_GetDay = 0");
//	};
//	if (Wld_GetDay () == 1)
//	{
//		PrintDebug	( "Wld_GetDay = 0");
//	};
//	
//	if (Wld_IsTime 	(0,00,23,59))
//	{
//		PrintDebug	( "Wld_IsTime = True");
//	};
//	
//	AI_SetWalkmode	( self, NPC_RUN);
//	
//	AI_GotoWP (self,"WP_CAULDRON");
//	
//	AI_AlignToWP	( self);
//	
//	if (Wld_IsMobAvailable	( self, "CAULDRON"))
//	{
//		AI_UseMob	( self, "CAULDRON",1);
//		AI_Wait 	( self, 10);
//		AI_StandUp	( self);
//	};
//	
//	AI_GotoNpc ( self, other);
//	
//	var string nearestwaypoint;
//	var string nextwaypoint;
//	
//	nearestwaypoint = Npc_GetNearestWP (self);
//	PrintDebug	(nearestwaypoint);
//	
//	nextwaypoint	= Npc_GetNextWP	(self);
//	PrintDebug	(nextwaypoint);
//	
//	AI_GotoWP	( self, nextwaypoint);
//	
//	AI_TurnToNpc( self, other);
//	
//	AI_TurnAway	( self, other);
//	
//	AI_WhirlAround	( self, other);
//	
//	if (Npc_GetBodyState	( self) == BS_STAND)
//	{
//		PrintDebug	( "Npc_GetBodyState = BS_Stand");
//	};
//	
//	if (Npc_HasBodyFlag	( self,BS_FLAG_INTERRUPTABLE))
//	{
//		PrintDebug	( "Npc_HasBodyFlag = BS_FLAG_INTERRUPTABLE");
//	};
//	
//	AI_GotoWP	( self,"WP_CAVE_12");
//	
//	if (Wld_IsFPAvailable (self, "PICK"))
//	{
//		AI_GotoFP 	( self,"PICK");
//	};
//	
//	Npc_SetToFightMode ( self, FMODE_MELEE);
//	if (Npc_IsInFightMode	( self, FMODE_MELEE))
//	{
//		PrintDebug ( "Npc_IsInFightMode FMODE_MELEE");
//	};
//	
//	Npc_SetToFistMode	( self);
//	
//	
//	// News 
//	Npc_MemoryEntry	( self, NEWS_SOURCE_WITNESS, other, NEWS_ATTACK, self);
//	//Npc_MemoryEntryGuild	( self, NEWS_SOURCE_GOSSIP, other, NEWS_MURDER, GIL_SLD);
//	
//	/*if (Npc_HasNews	( self, NEWS_MURDER, NULL, NULL))
//	{
//		PrintDebug ( "Npc_HasNews: Murder");
//		//if (Npc_IsNewsGossip	(self))!!!!!!!!!!!!!!!!!!!!!!!!!! Wie war das mit der Newsnumber ???????	
//	};
//	if (Npc_HasNews	( self, NULL, other, NULL ))
//	{
//		PrintDebug ( "Npc_HasNews: about other");
//		
//	};
//	if (Npc_HasNews	( self, NULL, NULL, self))
//	{
//		PrintDebug ( "Npc_HasNews: about victim == self");
//		//if (Npc_GetNewsVictim (self,Npc_HasNews	( self, NULL, NULL, self)))
//		//{
//		//	PrintDebug ( "Npc_HasNews: about victim == self // self");
//		//};
//	};*/
//	
//	if (!Npc_IsDead ( other))
//	{
//		PrintDebug	("Npc_IsDead // not");
//	};
//	
//	if (Npc_CheckInfo (self))
//	{
//		PrintDebug	( "Npc_CheckInfo");
//	};
//	
//	if (NPC_GiveInfo ( self, 1))
//	{
//		PrintDebug	("Npc_GiveInfo");
//	};
//	
//	if (Wld_DetectPlayer	(self))
//	{
//		PrintDebug	( "Wld_DetectPlayer");
//	};
//	
//	if (Npc_CheckOfferMission	( self, important))
//	{
//		PrintDebug	( "Npc_CheckOfferMission");
//	};
//	
//	if (Npc_IsNear ( self, other))
//	{
//		PrintDebug ("Npc_IsNear");
//	}
//	else
//	{
//		PrintDebug ("Npc_IsNear // not");
//	};
//	
//	if (Npc_GetDistToNpc 	( self, other) < PERC_DIST_DIALOG)
//	{
//		PrintDebug	( "Other Distance Dialog");
//	}
//	else
//	{
//		PrintDebug	( "Other outside distance dialog");
//	};
//	
//	if (Npc_GetDistToPlayer	( self) < PERC_DIST_DIALOG )
//	{
//		PrintDebug ("Player is in distance Dialog");
//	}
//	else
//	{
//		PrintDebug ("Player is  // not // in distance Dialog");
//	};
//	
//	// *******************************************************************************************
//	// ***                                       TALENTE                                       ***
//	// *******************************************************************************************
//
// 	if (Npc_HasTalent		( self, TAL_SNEAK))
// 	{
// 		PrintDebug	( "Npc_HasTalent TAL_SNEAK");
// 	};
//
// 	if ( Npc_HasFightTalent	( self, TAL_1H_AXE) )
// 	{	
// 		PrintDebug	( "Npc_HasFightTalent TAL_1H_AXE");
// 	};
//	
//	Npc_LearnTalent		( self, TAL_SEVENTHSENSE) ;
//	
//	if (Npc_HasTalent		( self, TAL_SEVENTHSENSE))
// 	{
// 		PrintDebug	( "Npc_HasTalent TAL_SEVENTHSENSE");
// 	};
//	
//	Npc_LearnFightTalent	( self, TAL_DAGGER) ;
//	
//	if ( Npc_HasFightTalent	( self, TAL_DAGGER) )
// 	{	
// 		PrintDebug	( "Npc_HasFightTalent TAL_DAGGER");
// 	};
//	
//	// *******************************************************************************************
//	// ***                                      ATTRIBUTE                                      ***
//	// *******************************************************************************************
//
//	var int attribute;
//	attribute = self.attribute [ATR_HITPOINTS_MAX];
//	Npc_ChangeAttribute	( self, ATR_HITPOINTS_MAX , +1);
//	if (!attribute	== self.attribute [ATR_HITPOINTS_MAX])
//	{
//		PrintDebug ("Npc_ChangeAttribute klappt");
//	};
//	
//	if (Npc_CanSeeNpc	( self, other))
//	{
//		PrintDebug	( "Npc_CanSeeNpc");
//	};
//	
//	if ( Npc_CanSeeNpcFreeLOS	( self, other))
//	{
//		PrintDebug	("Npc_CanSeeNpcFreeLOS");
//	};
//	// *******************************************************************************************
//	// ***                             GILDEN / ATTITUEDEN / KENNE SC                          ***
//	// *******************************************************************************************
//
//	if (Npc_GetTrueGuild ( self) == GIL_SLD )
//	{
//		PrintDebug ("Npc_GetTrueGuild Söldner");
//	};
//	
//	Npc_SetAttitude ( self, ATT_ANGRY);
//	
//	Npc_SetTempAttitude	( self, ATT_NEUTRAL);
//	
//	//Npc_PerceiveAll	( self);
//	//if (Wld_DetectNpc	( self, 
//	if (Npc_GetAttitude	( self, other) == ATT_NEUTRAL )
//	{
//		PrintDebug ( "Npc_SetTempAttitude + Npc_GetAttitude klappen");
//	};
//	
//	if (Npc_GetPermAttitude	( self, other) == ATT_ANGRY)
//	{
//		PrintDebug ("Set und Get Perm Attitude klappen");
//	};
//	
//	Wld_SetGuildAttitude ( GIL_SLD, ATT_ANGRY, GIL_KDW);
//	if ( Wld_GetGuildAttitude	(GIL_SLD, GIL_KDW) == ATT_ANGRY)
//	{
//		PrintDebug ( "Wld_SetGuildAttitude +Wld_GetGuildAttitude klappen");
//	};
//	
//	Npc_SetTrueGuild	( self, GIL_GRD);
//	if (Npc_GetTrueGuild	( self) == GIL_GRD)
//	{
//		PrintDebug	( "NPc_SetTrueGuild klappt");
//	};
//
//	Wld_ExchangeGuildAttitudes ("GIL_ATTITUDES_OMFULL");
//	
//	
//	Npc_SetKnowsPlayer ( self, other);
//	
//	if (Npc_KnowsPlayer	( self, other))
//	{
//		PrintDebug	( "Npc_SetKnowsPlayer + Npc_KnowsPlayer klappen");
//	};
//	
//	// ----------------------------------- FACE-ANIS ----------------------------------------------
//
//	Mdl_StartFaceAni	( self, "T_Eat", 1, 1) ;
//	
//
//	Mdl_ApplyRandomFaceAni	( self, "R_EyesBlink", 1, 0.2, 4, 2, 0.2) ;
//	
//	// ------------------------------------- SONSTIGE CHECKS ------------------------------------
//
//  	if (Npc_AreWeStronger		( self, other))
//  	{
//  		PrintDebug	( " We are stronger");
//  	};
//
//	if (!Npc_IsAiming	( self, other))
//	{
//		PrintDebug ( "Npc_isAiming klappt");
//	};
//	
//	// ----------------------------------------- ANGRIFF -----------------------------------------
//	
//	if (Npc_GetTarget	(self))
//	{
//		PrintDebug	("Npc_GetTarget");
//		AI_Attack (self);
//	};
//	
//	// ------------------------------------------ TRUHEN ----------------------------------------- 
//// 	Mob_CreateItems	(var STRING mobName, ItFoBeer, 1);
//
//  	if (Mob_HasItems	("OC_CRATE_LARGE", ItFoBeer ) >0)
//  	{
//  		PrintDebug	( "Mob_CreateItems + Mob_HasItems klappen");
//  	};
//	// *******************************************************************************************
//	// ***                                     	   TA / ZS                                     ***
//	// *******************************************************************************************
//
//	// -------------------------------------------------------------------------------------------
//	if (Npc_IsInState		( self, ZS_TestHangAround) )
//	{
//		PrintDebug	( "Npc_IsInState ZS_TestHangAround");
//	};
//
//	if (Npc_WasInState			( self, ZS_TestHangAround))
//	{
//		PrintDebug	( "Npc_WasInState	ZS_TestHangAround");
//	};
//	if ( Npc_IsInRoutine	( self, ZS_TestHangAround) )
//	{
//		PrintDebug	("Npc_IsInRoutine ZS_TestHangAround");
//	};
//
//// ------------------------------------- OBJEKT-TAs ------------------------------------------
// 	Wld_SetObjectRoutine			(16, 03, "GATE_GOBBO", 1) ;
//
//	Wld_SetMobRoutine			(16, 05, "FIREPLACE", 1) ;
//
//	// ---------------------------------------------- ZS -----------------------------------------
//	AI_StartState		( self,  ZS_ExternalsTest1, 0,  "WP_SMOKE") ;
//
//   AI_SetNpcsToState			( self, ZS_Sleep, 10000) ;
//
//	// *******************************************************************************************
//	// ***                                     DIALOGE                                         ***
//	// *******************************************************************************************
//
//	AI_Output		( self, other,"Testmission_Offer01" ) ;
//
//	AI_OutputSVM	( self, other, "Svm_4_Thanks") ;
//	//FUNC VOID	AI_WaitTillEnd			(VAR C_NPC self, VAR C_NPC other) {};
//
//	Npc_SetRefuseTalk (self,100);
//// -------------------------------------------------------------------------------------------
// 	AI_ASK 		( self, ExternalsTestJa, ExternalsTestNo ) ;
//
//	//FUNC VOID 	AI_WaitForQuestion			(VAR C_NPC self, VAR FUNC scriptFunc) { }; Wird über die Loops in ZS_Talk gemacht
//
//};
//
//func void ZS_ExternalsTest1 ()
//{	
//	if (Npc_HasEquippedWeapon (self))
//	{
//		PrintDebug	("Npc_HasEquippedWeapon");
//		
//	};
//	if (Npc_HasEquippedMeleeWeapon ( self))
//	{
//		PrintDebug	("Npc_HasEquippedMeleeWeapon");
//		AI_ReadyMeleeWeapon	(self);
//	};
//	if ( Npc_HasEquippedArmor	( self) )
//	{
//		PrintDebug	("  	Npc_HasEquippedArmor		");
//	};
//
//};
//
//func int ZS_ExternalsTest1_Loop ()
//{
//	// *******************************************************************************************
//	// ***                                   WAHRNEHMUNGEN                                     ***
//	// *******************************************************************************************
//
//	Npc_PercEnable (self, PERC_ASSESSOTHERSDAMAGE, ExternalsTestPrint);
//	Npc_PercEnable  ( self, PERC_ASSESSTHEFT		,	B_AssessTheft 		);
//	Perc_SetRange	( PERC_ASSESSOTHERSDAMAGE, 1000);
//	Npc_PercEnable (self, PERC_ASSESSTALK, ZS_Talk);
//	Npc_PercDisable	(self, PERC_ASSESSTALK);
//	if (Npc_GetStateTime (self) < 30)
//	{
//		Npc_SendPassivePerc ( self, PERC_ASSESSOTHERSDAMAGE, self, self);
//		
//		var int statetime;
//		statetime = Npc_GetStateTime ( self);
//		
//		Npc_SetStateTime	(self, 20);
//		
//		Npc_SetStateTime	(self, statetime);
//		
//	}
//	else
//	{
//		Npc_SendSinglePerc ( self, self, PERC_ASSESSTHEFT);
//		return 1;
//	};
//	
//	//func VOID 	Npc_SetPercTime				(VAR C_NPC self, VAR FLOAT seconds)			{ }; // keine Ahnung wie ich das testen soll
//
//
//};
//
//func void ZS_ExternalsTest1_End ()
//{
//	AI_StartState 	( self, ZS_ExternalsTest2, 0, "");
//};
//
//
//func void ZS_ExternalsTest2 ()
//{
//	if (Npc_HasReadiedMeleeWeapon (self))
//	{
//		PrintDebug	("Npc_HasReadiedMeleeWeapon");
//	};
//	AI_RemoveWeapon	( self);
//	AI_DrawWeapon	( self);
//};
//func void ExternalsTestPrint ()
//{
//	Print ("WN ist an");
//};
//func void ExternalsTestJa ()
//{
//	PrintDebug	("ExternalsTestJa");
//	if (Npc_RefuseTalk	(self))
//	{
//		PrintDebug	("Npc_RefuseTalk");
//	};
//};
//
//func void ExternalsTestNo ()
//{
//	PrintDebug	("ExternalsTestNo");
//	if (Npc_RefuseTalk	(self))
//	{
//		PrintDebug	("Npc_RefuseTalk");
//	};
//};
//




































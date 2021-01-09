/*************************************************************************
**																		**
**		B_Functions.D													**
**		=============													**
**																		**
**		Enthält kleinere, universell verwendbare Befehle für die		**
**		Master-AI														**
**																		**
*************************************************************************/

//////////////////////////////////////////////////////////////////////////
//	B_GotoWPNextToNpc
//	=================
//	Überfrüft, ob der SC/NSC eine Waffe bzw. einen aggresiven Zauber 
//	in der Hand hält.
//////////////////////////////////////////////////////////////////////////
func void B_GotoWPNextToNpc (var C_NPC slf, var C_NPC oth)
{
	PrintDebugNpc 		(PD_ZS_DETAIL, "B_GotoWPNextToNpc" );
	
	var string	waypoint;
	waypoint = Npc_GetNextWP(oth);
	AI_GotoWP	(slf, waypoint);
};

//////////////////////////////////////////////////////////////////////////
//	B_CantSeeTurn
//	=============
//
//////////////////////////////////////////////////////////////////////////
func void B_CantSeeTurn ()
{
	PrintDebugNpc		(PD_ZS_DETAIL, "B_CantSeeTurn" );
	
	if ((!C_BodyStateContains(self, BS_SIT)) && !Npc_CanSeeNpc ( self,other))
	{
		PrintDebugNpc	(PD_ZS_CHECK, "B_CantSeeTurn If" );
		AI_TurnToNpc 	(self, other);
	};
};

// ------------------------------------------------------------------- //
// ---- Ruft AI_LookAtNpc auf wenn der slf nicht in AIV_ISLOOKING ---- //
// ------------------------------------------------------------------- //

//19.09.00 (SN): VORSICHT, ich habe die Abfrage auf AI-Variable herausgenommen, da das a) Probleme bereitete, und b) nach einem Bugfix auch nicht mehr nötig ist! -> getestet und funktioniert!!!
func int C_LookAtNpc( var C_NPC slf, var C_NPC oth )
{
//	if ( ! slf.aivar[ AIV_ISLOOKING ] )								
//	{		
		AI_LookAtNpc( slf, oth );
		PrintDebugNpc(PD_ZS_DETAIL,"C_LookAtNpc");									// ...dann, glotzen lassen...
//		slf.aivar[AIV_ISLOOKING] = 1;								// ...und merken, daß es glotzt	
		return 1;
//	};
//	return 0;
};

// ---------------------------------------------------------------- //
// ---- Stopt AI_LookAtNpc wenn der slf nicht in AIV_ISLOOKING ---- //
// ---------------------------------------------------------------- //


func int C_StopLookAt( var C_NPC slf )		 
{	
//	if ( slf.aivar[ AIV_ISLOOKING ] )								// schaut das Monster überhaupt?
//	{																// ...ja!		
		AI_StopLookAt( slf );
		PrintDebugNpc(PD_ZS_DETAIL,"C_StopLookAt");										// ...dann aufhören lassen...
//		slf.aivar[ AIV_ISLOOKING ] = 0;								// ...und merken, daß es aufgehört hat!	
		return 1;		
//	};
//	return 0;
};

//////////////////////////////////////////////////////////////////////////
//	B_SmartTurnToNpc
//	================
//	Der NSC versucht erst zum Ziel hinzusehen. Wenn ds Ziel nicht im
//	Blickwinkel liegt, dreht sich der NSC richtig zum Ziel.
//////////////////////////////////////////////////////////////////////////
func void B_SmartTurnToNpc (var C_NPC slf, var C_NPC oth)
{
	PrintDebugNpc			(PD_ZS_DETAIL, "B_SmartTurnToNpc" );
	
	if (!  (C_BodyStateContains(slf,	BS_SIT)
	||		C_BodyStateContains(slf,	BS_ITEMINTERACT)
	||		C_BodyStateContains(slf,	BS_MOBINTERACT)
	||		C_BodyStateContains(slf,	BS_MOBINTERACT_INTERRUPT)	)	)
    {
		PrintDebugNpc		(PD_ZS_DETAIL, "...sitzt nicht und ist nicht am Mobsi" );
		if (!Npc_CanSeeNpc	(slf,	oth))
		{	
			PrintDebugNpc	(PD_ZS_DETAIL, "...kann Ziel nicht sehen!" );
			AI_TurnToNpc 	(slf, 	 oth);
		}
		else
		{
			C_LookAtNpc 	(slf, 	oth);
		};
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_Say
//	=====
//	Läßt den Nsc 'slf' einen SVM-Satz 'text' zum Nsc 'oth' sagen. Der
//	Sprecher sieht den Gesprächspartner dabei an, bzw. dreht sich, falls
//	er den Hals zu sehr verrenken müsste. 
//////////////////////////////////////////////////////////////////////////
func void B_Say(var C_NPC slf, var C_Npc oth, var string text)
{
	var string pipe;
	
	pipe = ConcatStrings("B_Say: ", text);	
	PrintDebugNpc		(PD_ZS_FRAME, pipe );

	B_SmartTurnToNpc	(slf, oth);
	AI_OutputSVM		(slf, oth , text);
};

//////////////////////////////////////////////////////////////////////////
//	B_SayOverlay
//	===========
//	Wie B_Say() benutzt allerdings AI_OutputSVMOverlay(), welches mit
//	der Ausführung der folgenden AI-Befehle NICHT wartet, bis der Satz
//	zu Ende gesprochen wurde.
//////////////////////////////////////////////////////////////////////////
func void B_SayOverlay(var C_NPC slf, var C_Npc oth, var string text)
{
	var string pipe;
	
	pipe = ConcatStrings("B_SayOverlay: ", text);	
	PrintDebugNpc		(PD_ZS_FRAME, pipe );

	B_SmartTurnToNpc	(slf, oth);

	//SN: VORSICHT: Bug #3046, würgt das SVM-Sample beim Zustandswechsel ab. Soll in v1.01 behoben sein.
	AI_OutputSVM_Overlay	(slf, oth , text);
};

//////////////////////////////////////////////////////////////////////////
//	B_StandUp
//	=========
//	Beendet alle möglichen Sitzstellungen.
//////////////////////////////////////////////////////////////////////////
func void B_StandUp (var C_NPC slf)
{
	PrintDebugNpc	(PD_ZS_DETAIL, "B_StandUp" );

	if C_BodyStateContains(slf,BS_SIT)
	{
	    if (slf.aivar[AIV_HangAroundStatus] == 1)
    	{
    		AI_PlayAni (slf, "T_SIT_2_STAND");
    		slf.aivar[AIV_HangAroundStatus] = 0;
    	}
    	else if (slf.aivar[AIV_HangAroundStatus] == 4)
    	{
    		AI_UseMob (slf,"SMALL THRONE",-1);
    		slf.aivar[AIV_HangAroundStatus] = 0;
    	}
    	else if (slf.aivar[AIV_HangAroundStatus] == 2)
    	{
    		AI_UseMob (slf,"BENCH",-1);
    		slf.aivar[AIV_HangAroundStatus] = 0;
    	}
    	else if (slf.aivar[AIV_HangAroundStatus] == 3)
    	{
    		AI_UseMob (slf,"CHAIR",-1);
    		slf.aivar[AIV_HangAroundStatus] = 0;
        };
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_CallComrades
//	==============
//	Ruft die in der Nähe befindlichen Kameraden heran.
//////////////////////////////////////////////////////////////////////////
func void B_CallComrades()
{
	PrintDebugNpc		(PD_ZS_DETAIL,	"B_CallComrades");	

	B_SayOverlay		(self, 	NULL,	"$COMRADESHELP");
	Npc_SendPassivePerc	(self, 	PERC_ASSESSWARN,	self,	other);
};	

//////////////////////////////////////////////////////////////////////////
//	B_CallGuards
//	============
//	Ruft die in der Nähe befindlichen Wachen heran.
//////////////////////////////////////////////////////////////////////////
func void B_CallGuards()
{
	PrintDebugNpc		(PD_ZS_DETAIL,	"B_CallGuards");	

	B_SayOverlay		(self, 	NULL,	"$HELP");
	Npc_SendPassivePerc	(self, 	PERC_ASSESSWARN,	self,	other);
};	

//////////////////////////////////////////////////////////////////////////
//	B_IntruderAlert
//	===============
//	Warnt vor Eindringling und ruft die in der Nähe befindlichen
//	Kameraden heran.
//////////////////////////////////////////////////////////////////////////
func void B_IntruderAlert(var C_NPC slf, var C_NPC oth)
{
	PrintDebugNpc		(PD_ZS_DETAIL,	"B_IntruderAlert");	

	B_SayOverlay		(slf, 	NULL,	"$IntruderAlert");
	Npc_SendPassivePerc	(slf, 	PERC_ASSESSWARN,	slf,	oth);
};	

//////////////////////////////////////////////////////////////////////////
//	B_FullStop
//	==========
//	Unterbricht jegliche Animation des NSCs. Hier wurde früher AI_Standup()
//	verwendet. Dieser Befehl ist in einigen Situationen jedoch zu träge
//	und wurde durch AI_StandUpQuick() ersetzt 
//////////////////////////////////////////////////////////////////////////
func void	B_FullStop(var C_NPC npc)
{
	PrintDebugNpc		(PD_ZS_DETAIL,	"B_FullStop");	

	Npc_ClearAIQueue	(npc);
	AI_StandUpQuick		(npc);
};

//////////////////////////////////////////////////////////////////////////
//	B_ResetTempAttitude
//	===================
//	Setzt den Wert der Temporären Attitüde auf den der Permanenten!
//	Symbolisiert die Beruhigung des NSCs.
//	
//	Voraussetzungen:
//	- 'slf' muß ein NSC sein
//////////////////////////////////////////////////////////////////////////
func void	B_ResetTempAttitude(var C_NPC slf)
{
	PrintDebugNpc		(PD_ZS_DETAIL,	"B_ResetTempAttitude");	

	Npc_SetTempAttitude(slf, Npc_GetPermAttitude(slf,hero));
};

//////////////////////////////////////////////////////////////////////////
//	B_WhirlAround
//	=============
//	Wirbelt nur herum, wenn der NSC 'slf' das Ziel 'oth' nicht sehen kann.
//	Wenn er das Ziel sehen kann, wird nur ein einfacher AI_TurnTo ausgeführt.
//////////////////////////////////////////////////////////////////////////
func void	B_WhirlAround(var C_NPC slf, var C_NPC oth)
{
	PrintDebugNpc		(PD_ZS_DETAIL,	"B_WhirlAround");	

	if (Npc_CanSeeNpc(slf,oth))
	{
		PrintDebugNpc	(PD_ZS_DETAIL,	"...KANN Ziel sehen!");	
		AI_TurnToNpc	(slf,	oth);
	}
	else
	{
		PrintDebugNpc	(PD_ZS_DETAIL,	"...kann Ziel NICHT sehen!");	
		AI_WhirlAround	(slf,	oth);
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_DropWeapon
//	=============
//	Läßt die derzeit gezogene Waffe fallen. Wenn keine gezogen ist,
//	passiert nichts.
//////////////////////////////////////////////////////////////////////////
func void B_DropWeapon(var C_NPC slf)
{
	PrintDebugNpc		(PD_ZS_DETAIL,	"B_DropWeapon");	

	var C_ITEM	itm;
	var int		itemid;

	itm = Npc_GetReadiedWeapon(slf);
	if (Hlp_IsValidItem(itm))
	{
		itemid = Hlp_GetInstanceID(itm);
		PrintDebugNpc	(PD_ZS_DETAIL,	itm.name);
		AI_DropItem		(slf,	itemid);
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_RegainDroppedWeapon
//	=====================
//	Guckt sich um und sammelt die Waffe, die am nächsten liegt wieder auf.
//	VORSICHT: Löscht die globale Variable 'item' !
//////////////////////////////////////////////////////////////////////////
func void B_RegainDroppedWeapon(var C_NPC slf)
{
	//-------- fallgelassene Waffe aufheben... --------
	Npc_PerceiveAll (slf);
	if ( Wld_DetectItem (slf, ITEM_KAT_NF) ||  Wld_DetectItem (slf, ITEM_KAT_FF) )
	{
		if	!Npc_IsPlayer(slf)
		&&	Npc_CanSeeItem(slf,item)
		{
			PrintDebugNpc(PD_ZS_CHECK, "...NSC hebt seine Waffen wieder auf!" );				
			AI_TakeItem (slf, item);
			AI_EquipBestMeleeWeapon(slf);
			AI_EquipBestRangedWeapon(slf);
		};
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_RegainDroppedArmor
//	=====================
//	Guckt sich um und sammelt die Rüstung, die am nächsten liegt wieder auf.
//	VORSICHT: Löscht die globale Variable 'item' !
//////////////////////////////////////////////////////////////////////////
func void B_RegainDroppedArmor(var C_NPC slf)
{
	//-------- fallgelassene Waffe aufheben... --------
	Npc_PerceiveAll (slf);
	if ( Wld_DetectItem (slf, ITEM_KAT_ARMOR) )
	{
		if (!Npc_IsPlayer(slf))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...NSC hebt seine Rüstung wieder auf!" );				
			AI_TakeItem (slf, item);
			AI_EquipBestArmor(slf);
		};
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_GotoFP
//	========
//	Geht zum nächsten freien Freepoint. Checkt, ob der NSC nicht schon
//	dort steht!
//////////////////////////////////////////////////////////////////////////
func void	B_GotoFP (var C_NPC slf, var string fp)
{
	PrintDebugNpc			(PD_TA_LOOP,	"B_GotoFP");
	
	if !(Npc_IsOnFP(self,fp))
	{
		PrintDebugString	(PD_TA_CHECK,	"...nicht auf passendem Freepoint ", fp);

		if (Wld_IsNextFPAvailable(self,fp))
		{
		    PrintDebugString(PD_TA_CHECK,	"Gehe zu Freepoint ", fp);
			AI_SetWalkmode	(self,	NPC_WALK);
			AI_GotoNextFP	(self,	fp);
		};
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_StopGotoHero
//	==============
//	Diese Funktion kann benutzt werden um durch ein PERC_MOVENPC ein
//	AI_GotoNpc(self, hero) vorzeitig abzubrechen, bevor der NSC in den SC
//	hineinläuft!
//	- benutzt 'self' und 'hero'
//////////////////////////////////////////////////////////////////////////
func void	B_StopGotoHero ()
{
	PrintDebugNpc			(PD_ZS_FRAME,	"B_StopGotoHero");
	
	if (Npc_IsPlayer(other))
	{
		PrintDebugNpc		(PD_ZS_DETAIL,	"...Kollision mit Spieler!");
		Npc_PercDisable		(self,	PERC_MOVENPC);
		B_FullStop			(self);
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_SetAttackReason
//	=================
//	Setzt den Grund des Angriffs eines NSCs, damit später darauf 
//	abgefragt werden kann.
//	Konstanten sind in AI_CONSTANTS.D zu finden
//////////////////////////////////////////////////////////////////////////
func void B_SetAttackReason(var C_NPC slf, var int reason)
{
	PrintDebugNpc			(PD_ZS_DETAIL,	"B_SetAttackReason");

	slf.aivar[AIV_ATTACKREASON] = reason;
};


//////////////////////////////////////////////////////////////////////////
//	B_KillNpc
//	=========
//	Setzt die Lebenspunkte des angegebenen NSCs auf 0.
//////////////////////////////////////////////////////////////////////////
func void B_KillNpc(var int npcInstance)
{
	PrintDebugNpc			(PD_ZS_DETAIL,	"B_KillNpc");

	var C_NPC	npc;	npc = Hlp_GetNpc(npcInstance);
	var int		itemInstance;
	
	npc.flags = 0;
	
	CreateInvItem		(npc,ItMi_Stuff_OldCoin_02);		// Mission-Item, das verhindert, daß die Toten entfernt werden
	
	Npc_ChangeAttribute	(npc, ATR_HITPOINTS, -npc.attribute[ATR_HITPOINTS_MAX]);

	if (Npc_GetInvItemBySlot(npc,INV_WEAPON,1))
	{
		PrintDebugNpc		(PD_ZS_DETAIL,	"...Waffe in Slot 1 gefunden!");
		itemInstance = 	Hlp_GetInstanceID(item);
		Npc_RemoveInvItem	(npc,	itemInstance);
	};

	if (Npc_GetInvItemBySlot(npc,INV_WEAPON,2))
	{
		PrintDebugNpc		(PD_ZS_DETAIL,	"...Waffe in Slot 2 gefunden!");
		itemInstance = 	Hlp_GetInstanceID(item);
		Npc_RemoveInvItem	(npc,	itemInstance);
	};
};

// Visualisierung: Schriftstück lesen -> 'self' zieht ein Stück Pergament aus der Tasche und wirft einen Blick drauf 
func void B_UseFakeScroll ()
{
	if ( C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp		(self);
		AI_TurnToNpc	(self,	hero);
	};
	CreateInvItem		(self,	Fakescroll);
	AI_UseItemToState	(self,	Fakescroll,	1);
	AI_Wait				(self,	3);
	AI_UseItemToState	(self,	Fakescroll,	-1);
};

//////////////////////////////////////////////////////////////////////////
//	B_ChangeGuild
//	=============
//	Ändert die Gilde des angegebenen NSCs
//////////////////////////////////////////////////////////////////////////
func void B_ChangeGuild(var int npcInstance, var int newGuild)
{
	PrintDebugNpc			(PD_ZS_DETAIL,	"B_ChangeGuild");

	var C_NPC	npc;
	npc = Hlp_GetNpc(npcInstance);
	
	Npc_SetTrueGuild(npc,newGuild);
	npc.guild = newGuild;
};

//////////////////////////////////////////////////////////////////////////
//	B_ExchangeRoutine
//	=================
//	Ändert den Tagesablauf des angegebenen NSCs
//
//	VORSICHT:	Auf KEINEN Fall für 'self' innerhalb eines Dialoges
//				benutzen, da AI_ContinueRoutine() den Dialog freezed!!!
//////////////////////////////////////////////////////////////////////////
func void B_ExchangeRoutine(var int npcInstance, var string newRoutine)
{
	PrintDebugNpc			(PD_ZS_DETAIL,	"B_ExchangeRoutine");

	var C_NPC	npc;
	npc = Hlp_GetNpc(npcInstance);
	
	Npc_ExchangeRoutine(npc,	newRoutine);
	AI_ContinueRoutine (npc);
};

//////////////////////////////////////////////////////////////////////////
//	B_SetPermAttitude
//	=================
//	Ändert die permamente Attitüde des angegebenen NSCs zum SC
//////////////////////////////////////////////////////////////////////////
func void B_SetPermAttitude(var int npcInstance, var int newAttitude)
{
	PrintDebugNpc			(PD_ZS_DETAIL,	"B_SetPermAttitude");

	var C_NPC	npc;
	npc = Hlp_GetNpc(npcInstance);
	
	Npc_SetAttitude		(npc,	newAttitude);
	Npc_SetTempAttitude	(npc,	newAttitude);
};

//////////////////////////////////////////////////////////////////////////
//	B_LogEntry
//	==========
//	Kapselt die Funktion Log_AddEntry und gibt eine Bildschirmmeldung
//	aus.
//////////////////////////////////////////////////////////////////////////
func void B_LogEntry(var string topic, var string entry)
{
	PrintDebugNpc	(PD_ZS_DETAIL,	"B_LogEntry");

	Log_AddEntry	(topic, entry);

	PrintScreen		(NAME_NewLogEntry, -1,_YPOS_MESSAGE_LOGENTRY,"font_old_10_white.tga",_TIME_MESSAGE_LOGENTRY);
	Snd_Play 		("LogEntry");
};

//////////////////////////////////////////////////////////////////////////
//	B_ClearImmortal
//	===============
//	Löscht sas Immortal-Flag eines NPCs
//////////////////////////////////////////////////////////////////////////
func void B_ClearImmortal(var int npcInstance)
{
	PrintDebugNpc	(PD_ZS_DETAIL,	"B_ClearImmortal");

	var C_NPC	npc;
	npc = Hlp_GetNpc(npcInstance);
	
	npc.flags = 0;
};

//////////////////////////////////////////////////////////////////////////
//	B_SetNpcType
//	============
//	Setzt den NpcTyp auf den angegebenen Wert
//////////////////////////////////////////////////////////////////////////
func void B_SetNpcType(var int npcInstance, var int newNpctype)
{
	PrintDebugNpc	(PD_ZS_DETAIL,	"B_SetNpcType");

	var C_NPC	npc;
	npc = Hlp_GetNpc(npcInstance);
	
	npc.npctype = newNpctype;
};

//////////////////////////////////////////////////////////////////////////
//	B_GiveInvItems
//	==============
//	Übergibt ein Item von 'giver' an 'taker' und gibt eine Meldung
//	auf dem Bildschirm aus.
//////////////////////////////////////////////////////////////////////////
func void B_GiveInvItems(var C_NPC giver, var C_NPC taker, var int itemInstance, var int amount)
{
	PrintDebugNpc	(PD_ZS_DETAIL,	"B_GiveInvItems");

	//-------- Gegenstand übertragen --------
	Npc_RemoveInvItems	(giver,	itemInstance,	amount);
	CreateInvItems		(taker,	itemInstance,	amount);

	//-------- Meldung ausgeben --------
	var string msg;

	if	Npc_IsPlayer(giver)
	{
		if (itemInstance == ItMiNugget)
		{
			msg = ConcatStrings(IntToString(amount), _STR_MESSAGE_ORE_GIVEN);
			PrintScreen	(msg, -1,_YPOS_MESSAGE_GIVEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_GIVEN);
		}
		else
		{
		    if amount == 1
		    {
			    msg = ConcatStrings(IntToString(amount), _STR_MESSAGE_ITEM_GIVEN);
			    PrintScreen	(msg, -1,_YPOS_MESSAGE_GIVEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_GIVEN);
			}   
			else
		    {
			    msg = ConcatStrings(IntToString(amount),_STR_MESSAGE_ITEMS_GIVEN);
			    PrintScreen	(msg, -1,_YPOS_MESSAGE_GIVEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_GIVEN);
			};   
		};
	}
	else if Npc_IsPlayer(taker)
	{
		if (itemInstance == ItMiNugget)
		{
			msg = ConcatStrings(IntToString(amount), _STR_MESSAGE_ORE_TAKEN);
			PrintScreen	(msg, -1,_YPOS_MESSAGE_TAKEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_TAKEN);
		}
		else
		{
		    if amount == 1
		    {
			    msg = ConcatStrings(IntToString(amount), _STR_MESSAGE_ITEM_TAKEN);
			    PrintScreen	(msg, -1,_YPOS_MESSAGE_TAKEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_TAKEN);
			}   
			else
		    {
			    msg = ConcatStrings(IntToString(amount),_STR_MESSAGE_ITEMS_TAKEN);
			    PrintScreen	(msg, -1,_YPOS_MESSAGE_TAKEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_TAKEN);
			}; 
		};
	};	
};


//////////////////////////////////////////////////////////////////////////
//	B_CheckForImportantInfo
//	=======================
//	Startet eine Important-Info wenn:
//	- der NSC eine solche Info parat hat
//	- der SC in keinem unpäßlichen Bodystate ist
//	- der SC gerade ein Mensch ist
//	- der SC nicht gerade spricht
//////////////////////////////////////////////////////////////////////////
func int B_CheckForImportantInfo (var C_NPC slf, var C_NPC oth)
{
	PrintDebugNpc	(PD_ZS_FRAME,	"B_CheckForImportantInfo");

	//-------- Auf Vergabe von Infos & Missionen checken --------
	if 	(	(oth.aivar[AIV_INVINCIBLE] == FALSE)
	&&		C_NpcIsHuman(oth)	)	//SC könnte verwandelt sein 
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...SC spricht nicht!");
		
		//----------- SC ist ein HumanControlled-Npc ---------------
		var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
		var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
		
		if ( (Hlp_GetInstanceID(her)!=Hlp_GetInstanceID(Hero))&&(Hlp_GetInstanceID(rock)!=Hlp_GetInstanceID(Hero)) ) 
		{	
			return FALSE;
		};
			
		if	Npc_CheckInfo(slf,1)
		{
			PrintDebugNpc	(PD_ZS_CHECK,	"...wichtige Info zu vergeben!");
			//if	(!C_BodyStateContains(oth,BS_JUMP))
			//||	Npc_IsInState(slf, ZS_GuardPassage)
			//||	Npc_WasInState(slf,ZS_GuardPassage)
			//{
				PrintDebugNpc	(PD_ZS_CHECK,	"...SC springt nicht oder NSC ist Durchgangswache!");
				if  (!C_BodyStateContains(oth,BS_FALL))
				{
					PrintDebugNpc	(PD_ZS_CHECK,	"...fällt nicht!");
					if	(!C_BodyStateContains(oth,BS_SWIM))
					{
						PrintDebugNpc	(PD_ZS_CHECK,	"...schwimmt nicht!");
						if (!C_BodyStateContains(oth,BS_DIVE))
						{
							PrintDebugNpc	(PD_ZS_CHECK,	"...taucht nicht!");
							hero.aivar		[AIV_IMPORTANT] = TRUE; // Dialog KOMMT aufgrund einer Important-Info zustande
							B_FullStop		(oth);
							
							if (C_BodystateContains(slf, BS_SIT)) || (!Npc_CanSeeNpc(self, hero))
							{
								Npc_ClearAIQueue(slf);
								AI_StandUp(slf);
							}
							else
							{
								B_FullStop		(slf);
							};
														
							AI_StartState	(slf, ZS_Talk, 0, "");
							Npc_PercDisable	(slf,	PERC_ASSESSFIGHTER);
							return			TRUE;
						};
					};
				};
			//};
		};
	};
	
	return FALSE;
};

//////////////////////////////////////////////////////////////////////////
//	B_InitGuildAttitudes
//	====================
//	Setzt bzw. resettet die Attitüde unter den Menschengilden
//	und berücksichtigt dabei den Storyverlauf
//////////////////////////////////////////////////////////////////////////
func void B_InitGuildAttitudes ()
{
	PrintDebugNpc	(PD_ZS_FRAME,	"B_InitGuildAttitudes");

	if	(Kapitel <= 3)
	{
		Wld_ExchangeGuildAttitudes	("GIL_ATTITUDES");
	}
	else
	{
		Wld_ExchangeGuildAttitudes	("GIL_ATTITUDES_FMTAKEN");
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_PracticeCombat
//	================
//	Spielt eine Lernanimation am angegebenen Waypoint ab.
//	'hero': der lernende Spielercharakter
//	'self': der lehrende NSC
//////////////////////////////////////////////////////////////////////////
func void B_PracticeCombat (var string waypoint)
{
	PrintDebugNpc	(PD_ZS_FRAME,	"B_PracticeCombat");

	//SN: Manchmal ist die Kamera stur auf den Lehrer gerichtet und verliert den SC aus dem Bild -> sehr verwirrend, daher erst mal raus!
/*
	if	(Npc_GetDistToWP(self, waypoint) < 1000)
	{
		AI_SetWalkmode			(hero,	NPC_WALK);
		AI_GotoWP				(hero,	waypoint);
		AI_TurnToNpc			(self,	hero);
		AI_EquipBestMeleeWeapon	(hero);
		AI_DrawWeapon			(hero);	
		AI_PlayAni				(hero,	"T_1HSFREE");
		AI_RemoveWeapon			(hero);
		AI_SetWalkmode			(hero,	NPC_WALK);
		AI_GotoNpc				(hero,	self);
		AI_TurnToNpc			(self,	hero);
	};
*/
};

//////////////////////////////////////////////////////////////////////////
//	B_PrintGuildCondition
//	=====================
//	Gibt eine Bildschirmmeldung mit der Mindestaufnahmestufe aus
//////////////////////////////////////////////////////////////////////////
func void B_PrintGuildCondition (var int level)
{
	PrintDebugNpc	(PD_ZS_FRAME,	"B_PrintGuildCondition");

	var string msg;
	
	msg = ConcatStrings(_STR_MESSAGE_Joincamp, IntToString(level));

	PrintScreen		(msg, -1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",_TIME_MESSAGE_Joincamp);
};


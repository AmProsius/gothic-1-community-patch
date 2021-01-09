//////////////////////////////////////////////////////////////////////////
//	B_FillQuiver
//	============
//	Füllt den Köcher des NSCs 'slf' auf 20 auf. Diese Funktion geht davon
//	aus, daß der NSC die entsprechende Fernkampfwaffe in der Hand hält.
//////////////////////////////////////////////////////////////////////////
func void B_FillQuiver(var C_NPC slf)
{
	PrintDebugNpc		(PD_ZS_DETAIL,	"B_FillQuiver");
	
	var int		addedAmmo;
	var C_ITEM	readiedWeapon;	

	readiedWeapon = Npc_GetReadiedWeapon(slf);
	if (readiedWeapon.munition == ItAmArrow)
	{
		PrintDebugNpc	(PD_ZS_DETAIL,	"...aktive Waffe benutzt Pfeile!");
		addedAmmo = 20 - C_NpcHasAmmo(slf, ItAmArrow);
		CreateInvItems(slf, ItAmArrow, addedAmmo);
		PrintDebugInt	(PD_ZS_DETAIL,	"...hinzugefügte Pfeile: ", addedAmmo);
	}
	else if (readiedWeapon.munition == ItAmBolt)
	{
		PrintDebugNpc	(PD_ZS_DETAIL,	"...aktive Waffe benutzt Bolzen!");
		addedAmmo = 20 - C_NpcHasAmmo(slf, ItAmBolt);
		CreateInvItems(slf, ItAmBolt, addedAmmo);
		PrintDebugInt	(PD_ZS_DETAIL,	"...hinzugefügte Bolzen: ", addedAmmo);
	}
	else
	{
		PrintDebugNpc	(PD_ZS_DETAIL,	"...ERROR: aktive Waffe hat KEINE gültige Munitionsart!!!");
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_EquipAndDrawBestMeleeWeapon
//	=============================
//	Legt die beste Nahkampfwaffe an, die sich im Inventory befindet
//	und zieht sie auch gleich.
//	-> gibt TRUE zurück, wenn Waffe angelegt werden konnte, sonst FALSE
//////////////////////////////////////////////////////////////////////////
func int B_EquipAndDrawBestMeleeWeapon(var C_NPC slf)
{
	PrintDebugNpc		(PD_ZS_FRAME,	"B_EquipAndDrawBestMeleeWeapon");

	// ---- Zauber noch aktiv ? ---- 
	if (Npc_IsInFightMode(slf, FMODE_MAGIC))
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...vorher Zauber wegstecken!");
		AI_UnreadySpell	(slf);										// ... dann weg damit
	};

	// ---- Nahkampfwaffe dabei ? ---- 
	if (C_NpcHasWeapon(slf, ITEM_KAT_NF))
	{
		if (!Npc_HasReadiedMeleeWeapon(slf))
		{
			PrintDebugNpc			(PD_ZS_CHECK,	"...noch keine Nahkampfwaffe gezogen!");
			AI_StopAim				(slf);
			B_FullStop 				(slf);
			AI_RemoveWeapon			(slf);
			AI_EquipBestMeleeWeapon	(slf);	
			AI_ReadyMeleeWeapon		(slf);
		};

		return TRUE;
	};

	return FALSE;
};

//////////////////////////////////////////////////////////////////////////
//	B_EquipAndDrawBestRangedWeapon
//	==============================
//	Legt die beste Fernkampfwaffe an, die sich im Inventory befindet
//	und zieht sie auch gleich.
//	-> gibt TRUE zurück, wenn Waffe angelegt werden konnte, sonst FALSE
//////////////////////////////////////////////////////////////////////////
func int B_EquipAndDrawBestRangedWeapon(var C_NPC slf)
{
	PrintDebugNpc		(PD_ZS_FRAME,	"B_EquipAndDrawBestRangedWeapon");

	// ---- Zauber noch aktiv ? ---- 
	if (Npc_IsInFightMode(slf, FMODE_MAGIC))
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...vorher Zauber wegstecken!");
		AI_UnreadySpell	(slf);										// ... dann weg damit
	};

	// ---- Fernkampfwaffe dabei ? ---- 
	if (Npc_HasRangedWeaponWithAmmo(slf))
	{
		PrintDebugNpc				(PD_ZS_CHECK,	"...Fernkampfwaffe mit Ammo vorhanden!");
		if (!Npc_HasReadiedRangedWeapon(slf))
		{
			PrintDebugNpc			(PD_ZS_CHECK,	"...noch keine Fernkampfwaffe gezogen!");
			B_FullStop 				(slf);
			AI_RemoveWeapon			(slf);
			AI_EquipBestRangedWeapon(slf);	
			AI_ReadyRangedWeapon	(slf);
		}
		else
		{
			if (slf.fight_tactic == FAI_HUMAN_RANGED)
			{
				B_FillQuiver(slf);
			};
		};
		return TRUE;
	}
	else
	{
		PrintDebugNpc				(PD_ZS_CHECK,	"...KEINE Fernkampfwaffe mit Ammo vorhanden!");
	};
	return FALSE;
};

//////////////////////////////////////////////////////////////////////////
//	B_DrawSpell
//	===========
//	Zieht den angegebenen Spruch unter Berücksichtigung, daß eventuell
//	vorher ein AI_UnreadySpell durchgeführt werden muß.
//////////////////////////////////////////////////////////////////////////
func void B_DrawSpell(var C_NPC slf, var int spell, var int mana)
{
	PrintDebugNpc				(PD_ZS_FRAME,	"B_DrawSpell");

	if (Npc_IsInFightMode(slf, FMODE_MAGIC))
	{
		PrintDebugNpc			(PD_ZS_CHECK,	"...bereits im Magiemodus!");
		if (Npc_GetActiveSpell(slf) != spell)
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...dieser Zauber liegt noch nicht auf der Hand!");
			AI_UnreadySpell		(slf);
// Das folgende AI_ReadySpell() verursacht den Kollisionsbug
// "only one moving vob without collision..." wenn die Funktion
// zweimal hintereinander aufgerufen wird, ohne ein
// AI_UnreadySpell dawzischen. Genau das ist aber nötig
// wenn der NSC die Stärke des Zaubers ändern will ohne
// den Zauber wegzustecken und wieder hervorzuholen!
		};
		AI_ReadySpell			(slf, spell, mana);
	}
	else
	{
		if (Npc_IsInFightMode(slf, FMODE_MELEE)||Npc_IsInFightMode(slf, FMODE_FIST))
		{
			AI_RemoveWeapon		(slf);
		};
		if (Npc_IsInFightMode(slf, FMODE_FAR))
		{
			AI_StopAim			(slf);
			AI_RemoveWeapon		(slf);
		};
			
		PrintDebugNpc			(PD_ZS_CHECK,	"...noch nicht im Magiemodus!");
		AI_ReadySpell			(slf, spell, mana);
	};

	//-------- "echte" Magier bekommen Mana dazugeschummelt --------
	if (slf.fight_tactic == FAI_HUMAN_MAGE)
	{
		PrintDebugNpc			(PD_ZS_CHECK,	"...Magier-Kampftaktik!");

		var int manaLeft;	manaLeft = slf.attribute[ATR_MANA];
		var int manaMax;	manaMax	 = slf.attribute[ATR_MANA_MAX];
		var int manaRefill;
		if ( manaLeft < (manaMax/2) )
		{
			PrintDebugInt		(PD_ZS_CHECK,	"...Mana übrig: ", manaLeft);
			manaRefill =		(manaMax/2) - manaLeft;		
			Npc_ChangeAttribute	(slf,	ATR_MANA,	manaRefill);
			PrintDebugInt		(PD_ZS_CHECK,	"...Mana hinzugefügt: ", manaRefill);
		};
	};
	
	return;
};

//////////////////////////////////////////////////////////////////////////
//	B_SelectWeapon
//	==============
//	Wählt für den NSC 'slf' unter Berücksichtigung der Kampfsitution
//	die jeweils passende Waffe aus.
//	Diese Funktion wird während der ZS_Attack alle 3 Sekunden
//	aufgerufen und interpretiert den NSC 'oth' als das anzugreifende
//	Ziel. 
//////////////////////////////////////////////////////////////////////////
func void B_SelectWeapon(var C_NPC slf, var C_NPC oth)
{
	PrintDebugNpc		(PD_ZS_FRAME,	"B_SelectWeapon");
	
	//######## magiebasierte Kampftaktik ? ########
	//folgende Zauber sind für NSCs möglich:
	// - Firebolt/Thunderbolt/BreathOfDeath	schnelles Geschoß			
	// - Fireball/Thunderball				Aufblas-Geschoß
	// - Windfist							Abstand schaffen
	// - ChainLightning/Pyrokinesis/IceCube	Festhalten mit Schaden
	// - Summon Demon/Skeleton?		
	// - Sleep?
	if ((slf.fight_tactic==FAI_HUMAN_MAGE) && (slf.attribute[ATR_MANA]>0))
	{	
		PrintDebugNpc			(PD_ZS_CHECK,	"...NSC ist ein Magier!");
		//-------- Summon Demon --------
		if ((C_NpcHasSpell(slf,SPL_SUMMONDEMON)) && (Npc_GetDistToNpc(slf, oth)>1200))
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...Summon Demon!");

			Npc_PerceiveAll		(slf);
			if (!Wld_DetectNpc	(slf, SummonedByNPC_Demon, ZS_MM_Attack, GIL_DEMON))		
			{
				B_DrawSpell		(slf,	SPL_SUMMONDEMON,	SPL_SENDCAST_SUMMONDEMON);
				return;
			}
			else
			{
				PrintDebugNpc	(PD_ZS_CHECK,	"...gibt aber schon einen!");
			};
		};

		//-------- Summon Golem --------
		if ((C_NpcHasSpell(slf,SPL_SUMMONGOLEM)) && (Npc_GetDistToNpc(slf, oth)>1000))
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...Summon Golem!");

			Npc_PerceiveAll		(slf);
			if (!Wld_DetectNpc	(slf, SummonedByNPC_StoneGolem, ZS_MM_Attack, GIL_GOLEM))		
			{
				B_DrawSpell		(slf,	SPL_SUMMONGOLEM,	SPL_SENDCAST_SUMMONGOLEM);
				return;
			}
			else
			{
				PrintDebugNpc	(PD_ZS_CHECK,	"...gibt aber schon einen!");
			};
		};

		//-------- Summon Skeleton --------
		if	((C_NpcHasSpell(slf,SPL_SUMMONSKELETON)) && (Npc_GetDistToNpc(slf, oth)>800))
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...Summon Skeleton!");

			Npc_PerceiveAll		(slf);
			if (!Wld_DetectNpc	(slf, SummonedByNPC_Skeleton, ZS_MM_Attack, GIL_SKELETON))		
			{
				B_DrawSpell		(slf,	SPL_SUMMONSKELETON,	SPL_SENDCAST_SUMMONSKELETON);
				return;
			}
			else
			{
				PrintDebugNpc	(PD_ZS_CHECK,	"...gibt aber schon welche!");
			};
		};

		//-------- Icecube --------
		if (C_NpcHasSpell		(slf,SPL_ICECUBE) && !Npc_IsInState(oth,ZS_MagicFreeze) )
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...Icecube!");
			B_DrawSpell			(slf,	SPL_ICECUBE,	SPL_SENDCAST_ICECUBE);
			return;
		}

		//-------- Icecube-Attack (Monster) --------
		else if (C_NpcHasSpell	(slf,SPL_ICECUBE) && C_NpcIsMonsterMage(slf) && (Npc_GetDistToNpc(slf,oth) < SPL_RANGE_ICEATTACK) && !Npc_IsInState(oth,ZS_MagicFreeze) )
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...Ice-Attack von Monstern!");
			B_DrawSpell			(slf,	SPL_ICECUBE,	SPL_SENDCAST_ICECUBE);
			return;
		}

		//-------- Cahinlightning --------
		else if	(C_NpcHasSpell(slf,SPL_CHAINLIGHTNING) && (Npc_GetDistToNpc(slf,oth)<SPL_RANGE_CHAINLIGHTNING) )
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...Chainlightning!");
			B_DrawSpell			(slf,	SPL_CHAINLIGHTNING,	1);
			return;
		}

		//--------Sleep --------
		else if ((C_NpcHasSpell(slf,SPL_SLEEP)) && (!Npc_IsInState(oth, ZS_MagicSleep)) && (Npc_GetDistToNpc(slf,oth)<SPL_RANGE_SLEEP) )
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...Schlaf!");
			B_DrawSpell			(slf,	SPL_SLEEP,	SPL_SENDCAST_SLEEP);
			return;
		}

		//-------- Windfist --------
		else if (C_NpcHasSpell(slf,SPL_WINDFIST)  && (Npc_GetDistToNpc(slf,oth)<SPL_RANGE_WINDFIST) )
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...Windfist!");
			if 		( (Npc_GetDistToNpc(slf,oth)>SPL_RANGE_WINDFIST) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_WINDFIST) )
			{
				PrintDebugNpc	(PD_ZS_CHECK,	"...großer!");
				B_DrawSpell		(slf,	SPL_WINDFIST,	SPL_SENDCAST_WINDFIST);
			}
			else if ( (Npc_GetDistToNpc(slf,oth)>(SPL_RANGE_WINDFIST/2)) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_WINDFIST/2) )
			{
				PrintDebugNpc	(PD_ZS_CHECK,	"...mittlerer!");
				B_DrawSpell		(slf,	SPL_WINDFIST,	SPL_SENDCAST_WINDFIST/2);
			}
			else
			{
				PrintDebugNpc	(PD_ZS_CHECK,	"...kleiner!");
				B_DrawSpell		(slf,	SPL_WINDFIST,	1);
			};
			return;
		}

		//-------- Fireball --------
		else if ( C_NpcHasSpell(slf,SPL_FIREBALL) )
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...Fireball!");
			if 		( (Npc_GetDistToNpc(slf,oth)>1500) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_FIREBALL) )
			{
				PrintDebugNpc	(PD_ZS_CHECK,	"...großer!");
				B_DrawSpell		(slf,	SPL_FIREBALL,	SPL_SENDCAST_FIREBALL);
			}
			else if ( (Npc_GetDistToNpc(slf,oth)>800) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_FIREBALL/2) )
			{
				PrintDebugNpc	(PD_ZS_CHECK,	"...mittlerer!");
				B_DrawSpell		(slf,	SPL_FIREBALL,	SPL_SENDCAST_FIREBALL/2);
			}
			else
			{
				PrintDebugNpc	(PD_ZS_CHECK,	"...kleiner!");
				B_DrawSpell		(slf,	SPL_FIREBALL,	1);
			};
			return;
		}

		//-------- Firestorm --------
		else if ( C_NpcHasSpell(slf,SPL_FIRESTORM) )
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...Fireball!");
			if 		( (Npc_GetDistToNpc(slf,oth)>1500) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_FIRESTORM) )
			{
				PrintDebugNpc	(PD_ZS_CHECK,	"...großer!");
				B_DrawSpell		(slf,	SPL_FIRESTORM,	SPL_SENDCAST_FIREBALL);
			}
			else if ( (Npc_GetDistToNpc(slf,oth)>800) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_FIRESTORM/2) )
			{
				PrintDebugNpc	(PD_ZS_CHECK,	"...mittlerer!");
				B_DrawSpell		(slf,	SPL_FIRESTORM,	SPL_SENDCAST_FIRESTORM/2);
			}
			else
			{
				PrintDebugNpc	(PD_ZS_CHECK,	"...kleiner!");
				B_DrawSpell		(slf,	SPL_FIRESTORM,	1);
			};
			return;
		}

		//-------- Firebolt --------
		else if (C_NpcHasSpell	(slf,SPL_FIREBOLT))
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...Firebolt!");
			B_DrawSpell			(slf,	SPL_FIREBOLT,	SPL_SENDCAST_FIREBOLT);
			return;
		}

		//-------- Thunderball --------
		else if ( C_NpcHasSpell(slf,SPL_THUNDERBALL) )
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...Thunderball!");
			if 		( (Npc_GetDistToNpc(slf,oth)>1500) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_THUNDERBALL) )
			{
				PrintDebugNpc	(PD_ZS_CHECK,	"...großer!");
				B_DrawSpell		(slf,	SPL_THUNDERBALL,	SPL_SENDCAST_THUNDERBALL);
			}
			else if ( (Npc_GetDistToNpc(slf,oth)>800) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_THUNDERBALL/2) )
			{
				PrintDebugNpc	(PD_ZS_CHECK,	"...mittlerer!");
				B_DrawSpell		(slf,	SPL_THUNDERBALL,	SPL_SENDCAST_THUNDERBALL/2);
			}
			else
			{
				PrintDebugNpc	(PD_ZS_CHECK,	"...kleiner!");
				B_DrawSpell		(slf,	SPL_THUNDERBALL,	1);
			};
			return;
		}

		//-------- Thunderbolt --------
		else if (C_NpcHasSpell	(slf,SPL_THUNDERBOLT))
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...Thundebolt!");
			B_DrawSpell			(slf,	SPL_THUNDERBOLT,	SPL_SENDCAST_THUNDERBOLT);
			return;
		}

		//-------- Pyrokinesis --------
		else if (C_NpcHasSpell	(slf,SPL_PYROKINESIS))
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...Pyrokinesis!");
			B_DrawSpell			(slf,	SPL_PYROKINESIS,	10);
			return;
		}
		
		//-------- Breath of Death --------
		else if (C_NpcHasSpell	(slf,SPL_BREATHOFDEATH))
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...Breath of Death!");
			B_DrawSpell			(slf,	SPL_BREATHOFDEATH,	SPL_SENDCAST_BREATHOFDEATH);
			return;
		};
	};   


	//######## Waffenbasierte Kampftaktik ?  ########
	PrintDebugNpc		(PD_ZS_CHECK,	"...Waffenbasierte Kampftaktik!");
	//-------- Gegner in Nahkampfdistanz ? --------
	if ( (Npc_GetDistToNpc(slf,oth)<HAI_DIST_MELEE) && (slf.fight_tactic!=FAI_HUMAN_RANGED) )
	{
		PrintDebugNpc			(PD_ZS_CHECK,	"...Gegner in Nahkampfreichweite & kein purer Fernkämpfer!");

		// ---- Erst Nahkampfwaffe probieren... ---- 
		if (B_EquipAndDrawBestMeleeWeapon(slf))
		{
			return;
		};

		// ---- ...sonst mit den Fäusten kämpfen ---- 								
		PrintDebugNpc			(PD_ZS_CHECK, "...keine Nahkampfwaffe im Inv -> Faustkampf!");
		AI_ReadyMeleeWeapon		(slf);	// VORSICHT: in v0.96c werden hier nicht die Fäuste, sondern die letzte Waffe gezogen !!! -> wird in v0.97 behoben sein (Kommentar dann löschen)
		return;		
	}
	else
	{
		PrintDebugNpc			(PD_ZS_CHECK,	"...Gegner in Fernkampfreichweite oder NSC ist ein purer Fernkämpfer!");
		
		// ---- Erst Fernkampfwaffe probieren... ---- 
		if (B_EquipAndDrawBestRangedWeapon(slf))
		{
			return;
		};		

		// ---- ...sonst Nahkampfwaffe versuchen... ---- 
		if (B_EquipAndDrawBestMeleeWeapon(slf))
		{
			return;
		};

		// ---- ...herumliegende Waffe suchen, sonst mit den Fäusten kämpfen ---- 								
		if (!B_FetchWeapon())
		{
			PrintDebugNpc		(PD_ZS_CHECK, "...keine Waffe gefunden -> Faustkampf!");
			AI_ReadyMeleeWeapon	(slf);
			return;		
		};
	};			

	return;			
};
//--------------------------------------------------------------------------


//***************************************************************************************************************
//												B_OrcGuard_ObserveIntruder										*
//***************************************************************************************************************

func void B_OrcGuard_ObserveIntruder()
{
	if ( Npc_HasReadiedWeapon( other )  ||  Npc_IsInFightMode( other, FMODE_FIST ) )	//wenn Gegner waffe gezogen, werde ich sauer!
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_OrcGuard_ObserveIntruder: Mensch ist im Kampf-Modus -> TempAtt +1" );
		B_Orc_DrawWeapon();
	};
	Npc_ClearAIQueue( self );	
	AI_StandUpQuick( self );
	AI_StartState( self, ZS_OrcGuard_ObserveIntruder, 0, "" );
};


//***************************************************************************************************************
//												B_OrcWarrior_ObserveIntruder									*
//***************************************************************************************************************


func void B_OrcWarrior_ObserveIntruder()
{
	//wenn anderer Waffe in der Hand, TempAttitude eins rauf!
	if ( Npc_HasReadiedWeapon( other )  ||  Npc_IsInFightMode( other, FMODE_FIST ) )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_OrcWarrior_ObserveIntruder: Mensch ist im Kampf-Modus -> TempAtt +1" );
		B_Orc_DrawWeapon();
	};
	
	if ( Npc_GetAttitude( self, other ) == ATT_HOSTILE )
	{	
		PrintDebugNpc( PD_ORC_FRAME, "B_OrcWarrior_ObserveIntruder: Mensch & HOSTILE" );
		if ( Npc_GetDistToNpc( self, other ) < 2000 )	
		{
			Npc_ClearAIQueue( self );	
			AI_StandUpQuick( self );
			AI_StartState( self, ZS_Orc_Attack, 0, "" );
		};
		return;
	}
	else if ( Npc_GetAttitude( self, other ) == ATT_ANGRY )
	{	
		PrintDebugNpc( PD_ORC_FRAME, "B_OrcWarrior_ObserveIntruder: Mensch & ANGRY" );
		if ( Npc_GetDistToNpc( self, other ) < 1200 )
		{
			Npc_ClearAIQueue( self );
			AI_StandUpQuick( self );
			AI_TurnToNpc( self, other );
			AI_StartState( self, ZS_OrcWarrior_ObserveIntruder, 0, "" );
		};
		return;
	}
	else if ( Npc_GetAttitude( self, other ) == ATT_NEUTRAL )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_OrcWarrior_ObserveIntruder: Mensch & NEUTRAL" );
		if ( Npc_GetDistToNpc( self, other ) < 800 )
		{
			Npc_ClearAIQueue( self );
			AI_StandUp( self );
			AI_TurnToNpc( self, other );
			AI_StartState( self, ZS_OrcWarrior_ObserveIntruder, 0, "" );								
		};
		return;
	}
	else if ( Npc_GetAttitude( self, other ) == ATT_FRIENDLY )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_OrcWarrior_ObserveIntruder: Mensch & NEUTRAL" );
		if ( Npc_GetDistToNpc( self, other ) < 400 )
		{
			Npc_ClearAIQueue( self );
			AI_StandUp( self );
			AI_TurnToNpc( self, other );
			AI_StartState( self, ZS_OrcWarrior_ObserveIntruder, 0, "" );								
		};
		return;
	};
};


//***************************************************************************************************************
//												B_OrcScout_ObserveIntruder										*
//***************************************************************************************************************


func void B_OrcScout_ObserveIntruder()
{
	if ( Npc_HasReadiedWeapon( other )  ||  Npc_IsInFightMode( other, FMODE_FIST ) )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_OrcScout_ObserveIntruder: Mensch ist im Kampf-Modus -> TempAtt +1" );
		B_Orc_DrawWeapon();
	};

// hostile
	
	if ( Npc_GetAttitude( self, other ) == ATT_HOSTILE )
	{	
		PrintDebugNpc( PD_ORC_FRAME, "B_OrcScout_ObserveIntruder: Mensch & HOSTILE" );
		if ( Npc_GetDistToNpc( self, other ) < 1000 )	
		{
			Npc_ClearAIQueue( self );	
			AI_StandUpQuick( self );
			AI_StartState( self, ZS_Orc_Attack, 0, "" );
		};
		return;
	}
	
// angry

	else if ( Npc_GetAttitude( self, other ) == ATT_ANGRY )
	{	
		PrintDebugNpc( PD_ORC_FRAME, "B_OrcScout_ObserveIntruder: Mensch & ANGRY" );
		if ( Npc_GetDistToNpc( self, other ) < 600 )
		{
			Npc_ClearAIQueue( self );
			AI_StandUpQuick( self );
			AI_TurnToNpc( self, other );
			AI_StartState( self, ZS_OrcScout_ObserveIntruder, 0, "" );
		};
		return;
	}
	
// neutral

	else if ( Npc_GetAttitude( self, other ) == ATT_NEUTRAL )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_OrcScout_ObserveIntruder: Mensch & NEUTRAL" );
		if ( Npc_GetDistToNpc( self, other ) <400 )
		{
			Npc_ClearAIQueue( self );
			AI_StandUp( self );
			AI_TurnToNpc( self, other );
			AI_StartState( self, ZS_OrcScout_ObserveIntruder, 0, "" );								
		};
		return;
	}
	
// friendly

	else if ( Npc_GetAttitude( self, other ) == ATT_FRIENDLY )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_OrcScout_ObserveIntruder: Mensch & NEUTRAL" );
		if ( Npc_GetDistToNpc( self, other ) < 200 )
		{
			Npc_ClearAIQueue( self );
			AI_StandUp( self );
			AI_TurnToNpc( self, other );
			AI_StartState( self, ZS_OrcScout_ObserveIntruder, 0, "" );								
		};
		return;
	};
};


//***************************************************************************************************************
//												B_OrcShaman_ObserveIntruder										*
//***************************************************************************************************************


func void B_OrcShaman_ObserveIntruder()
{
//Magie einbinden
	if ( Npc_HasReadiedWeapon( other )  ||  Npc_IsInFightMode( other, FMODE_FIST ) )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_OrcShaman_ObserveIntruder: Mensch ist im Kampf-Modus -> TempAtt +1" );
		B_Orc_DrawWeapon();
	};

// hostile
	
	if ( Npc_GetAttitude( self, other ) == ATT_HOSTILE )
	{	
		PrintDebugNpc( PD_ORC_FRAME, "B_OrcShaman_ObserveIntruder: Mensch & HOSTILE" );
		if ( Npc_GetDistToNpc( self, other ) < 1500 )	
		{
			Npc_ClearAIQueue( self );	
			AI_StandUp( self );
			AI_StartState( self, ZS_Orc_Attack, 0, "" );
		};
		return;
	}
	
// angry
	
	else if ( Npc_GetAttitude( self, other ) == ATT_ANGRY )
	{	
		PrintDebugNpc( PD_ORC_FRAME, "B_OrcShaman_ObserveIntruder: Mensch & ANGRY" );
		if ( Npc_GetDistToNpc( self, other ) < 1000 )
		{
			Npc_ClearAIQueue( self );
			AI_StandUp( self );
			AI_TurnToNpc( self, other );
			AI_StartState( self, ZS_OrcShaman_ObserveIntruder, 0, "" );
		};
		return;
	}
	
// neutral

	else if ( Npc_GetAttitude( self, other ) == ATT_NEUTRAL )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_OrcShaman_ObserveIntruder: Mensch & NEUTRAL" );
		if ( Npc_GetDistToNpc( self, other ) <400 )
		{
			Npc_ClearAIQueue( self );
			AI_StandUp( self );
			AI_TurnToNpc( self, other );
			AI_StartState( self, ZS_OrcShaman_ObserveIntruder, 0, "" );								
		};
		return;
	}
	
// friendly

	else if ( Npc_GetAttitude( self, other ) == ATT_FRIENDLY )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_OrcShaman_ObserveIntruder: Mensch & NEUTRAL" );
		if ( Npc_GetDistToNpc( self, other ) < 200 )
		{
			Npc_ClearAIQueue( self );
			AI_StandUp( self );
			AI_TurnToNpc( self, other );
			AI_StartState( self, ZS_OrcShaman_ObserveIntruder, 0, "" );								
		};
		return;
	};

};


//***************************************************************************************************************
//												B_Orc_ObserveIntruder										*
//***************************************************************************************************************


func void B_Orc_ObserveIntruder()
{
// andere Orcs und den Orc-Hund ignorieren
	
	if ( other.guild > GIL_SEPERATOR_ORC  ||  other.guild == GIL_ORCDOG )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_Orc_ObserveIntruder: Orc oder Hund -> ignore" );
		return;	
	};

// falls Intruder schleicht und Ork ihn nicht sehen kann -> ignore
	
	if ( !Npc_CanSeeNpc( self, other )  &&  C_BodyStateContains( other, BS_SNEAK ) )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_Orc_ObserveIntruder: kann niemand sehen und schleicht -> ignore" );
		return;
	};
	
	
// Monster?
	
	if ( (other.guild > GIL_SEPERATOR_HUM)  &&  (other.guild < GIL_SEPERATOR_ORC) )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_Orc_ObserveIntruder: Monster!" );
		AI_Quicklook( self, other );
		
	//alles ausser Ork-Hund & Meatbug angreifen
		
		if ( other.guild != GIL_ORCDOG  &&  other.guild != GIL_MEATBUG )
		{
			PrintDebugNpc( PD_ORC_FRAME, "B_Orc_ObserveIntruder: Monster: !OrcDog && !MeatBug -> Angriff" );
			Npc_ClearAIQueue( self );	
			AI_StandUp( self );
			AI_StartState( self, ZS_Orc_Attack, 0, "" );
		};
		return;
	};
	
// Menschen werden je nach Orcguild anders beurteilt
	if ( other.guild < GIL_SEPERATOR_HUM )
	{
		if ( self.npctype == NPCTYPE_GUARD)
		{
			B_OrcGuard_ObserveIntruder();
		};
		
		if (self.guild == GIL_ORCWARRIOR)
		{
			B_OrcWarrior_ObserveIntruder();
		};
		
		if (self.guild == GIL_ORCSCOUT)
		{
			B_OrcScout_ObserveIntruder();
		};
	
		if (self.guild == GIL_ORCSHAMAN)
		{
			B_OrcShaman_ObserveIntruder();
		};
	};
};


//*******************************************************************************************************************
//*******************************************************************************************************************
//																													*
//											ZS_Orc***_Observeintruder												*
//																													*
//*******************************************************************************************************************
//*******************************************************************************************************************




//*******************************************************************************************************************
//											ZS_OrcGuard_ObserveIntruder												*
//*******************************************************************************************************************


func void ZS_OrcGuard_ObserveIntruder()
{
	PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcGuard_ObserveIntruder" );

	// Perceptions beim beobachten...
	Npc_PercEnable( self, PERC_ASSESSDAMAGE,	 	B_Orc_AssessDamage );
	Npc_PercEnable( self, PERC_DRAWWEAPON, 			B_Orc_DrawWeapon );
	Npc_PercEnable( self, PERC_ASSESSOTHERSDAMAGE,	ZS_Orc_WatchFight );
	Npc_PercEnable( self, PERC_ASSESSMURDER,		B_Orc_AssessMurder );
	Npc_PercEnable( self, PERC_ASSESSDEFEAT,		B_Orc_AssessDefeat );
	Npc_PercEnable( self, PERC_ASSESSCASTER,		B_Orc_AssessSomethingEvil );	
	Npc_PercEnable( self, PERC_ASSESSMAGIC,			B_AssessMagic );	
	Npc_PercEnable( self, PERC_ASSESSTHREAT,		B_Orc_AssessSomethingEvil );	
	

	self.aivar[AIV_OBSERVEINTRUDER] = 0;
	self.aivar[AIV_WARNTARGET] = 0;

		PrintDebugNpc( PD_ORC_FRAME, "B_OrcGuard_ObserveIntruder: Waechter sieht Player" );
	if ( Npc_GetDistToNpc( self, other ) > 900  &&  Npc_GetAttitude( self, other ) != ATT_FRIENDLY )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_OrcGuard_ObserveIntruder: Waechter tutet ins Horn -> TORÖÖÖÖ!" );
		B_Orc_ItemHorn();
	};
	Npc_SendPassivePerc( self, PERC_ASSESSWARN, self, self );
};



func int ZS_OrcGuard_ObserveIntruder_Loop()
{
	PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcGuard_ObserveIntruder_Loop:" );

	
	PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcGUARD_ObserveIntruder_Loop: Waechter!" );
		
	//Ein Waechter zueckt sofort seine Waffe
	if ( !Npc_HasReadiedWeapon( self ) )
	{
		PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcGuard_ObserveIntruder_Loop: Ork-Waechter zieht Waffe" );
		AI_TurnToNpc( self, other );
		AI_EquipBestMeleeWeapon( self );
		AI_DrawWeapon( self );
	};
	if ( Npc_GetDistToNpc( self, other ) > 1500)
	{
		self.aivar[AIV_WARNTARGET] = 1;
	}
	else
	{
		self.aivar[AIV_WARNTARGET] = 0;
	};


//----------------------------Unterteilung nach Attituden--------------------------------------------------------

// hostile

	if ( Npc_GetAttitude( self, other ) == ATT_HOSTILE )
	{		
		PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcGuard_ObserveIntruder: HOSTILE" );
		B_Say( self, other, "$DIE" );
		AI_StartState( self, ZS_Orc_Attack, 1, "" );
		return 1;	//Abbruch
	}
	
// angry	
	
	else if (( Npc_GetAttitude( self, other ) == ATT_ANGRY )&& (self.aivar[AIV_WARNTARGET] == 0))
	{		
		PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcGuard_ObserveIntruder: ANGRY" );
		B_Orc_SmartTurn();
		if ( Npc_GetDistToNpc( self, other ) < 500  &&  
			 ( self.aivar[AIV_OBSERVEINTRUDER] == 1  ||  Npc_GetStateTime( self ) > 6 ) )
		{
			PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcGuard_ObserveIntruder: ANGRY: Angriff 1" );
			B_Say( self, other, "$DIE" );
			AI_StartState( self, ZS_Orc_Attack, 1, "" );
		}
		else if ( Npc_GetDistToNpc( self, other ) < 1500  &&  self.aivar[AIV_OBSERVEINTRUDER] == 0 )
		{
			PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcGuard_ObserveIntruder: ANGRY: Waffe ziehen" );
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			B_Say( self, other, "$LOOKINGFORTROUBLEEH" );
		}
		else if ( self.aivar[AIV_OBSERVEINTRUDER] == 1  &&  Npc_GetStateTime( self ) > 6 )
		{
			PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcGuard_ObserveIntruder: ANGRY: Angriff 2" );
			B_Say( self, other, "$DIE" );
			AI_StartState( self, ZS_Orc_Attack, 1, "" );
		};
		
		return 0;	//bleibe in Loop
	}
	
// neutral
	
	else if (( Npc_GetAttitude( self, other ) == ATT_NEUTRAL )	&& (self.aivar[AIV_WARNTARGET] == 0))
	{		
		PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcGuard_ObserveIntruder: NEUTRAL" );
		B_Orc_SmartTurn();
		if ( Npc_GetDistToNpc( self, other ) < 300  &&  self.aivar[AIV_OBSERVEINTRUDER] > 0 )
		{
			if ( self.aivar[AIV_OBSERVEINTRUDER] != 2 )
			{
				self.aivar[AIV_OBSERVEINTRUDER] = 2;
				AI_Wait( self, 3 );
			}
			else if ( Npc_GetStateTime( self ) > 10 )
			{
				PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcGuard_ObserveIntruder: NEUTRAL: Angriff" );
				AI_StartState( self, ZS_Orc_Attack, 1, "" );
			};
		}
		else if ( Npc_GetDistToNpc( self, other ) < 500  &&  self.aivar[AIV_OBSERVEINTRUDER] == 0)
		{
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcGuard_ObserveIntruder: NEUTRAL: Waffe ziehen" );
			if ( !Npc_HasReadiedWeapon( self ) )
			{
				AI_EquipBestMeleeWeapon( self );
				AI_DrawWeapon( self );
			};
			B_Say( self, other, "$LOOKINGFORTROUBLEEH" );
		}
		else if ( Npc_GetStateTime( self ) > 15)  
		{
			
			return 1; //Exit Loop
		};
		return 0;	//bleibe in Loop
	}
	
// friendly
	
	else if ( Npc_GetAttitude( self, other ) == ATT_FRIENDLY )
	{		
		PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcGuard_ObserveIntruder: FRIENDLY" );
		B_Orc_SmartTurn();
		if ( Npc_GetDistToNpc( self, other ) < 300  &&  self.aivar[AIV_OBSERVEINTRUDER] != 1 )
		{
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			B_Say( self, other, "$WHAT" );
		};
		if ( Npc_GetDistToNpc( self, other ) > 700  )
		{
			
			return 1;	//Exit Loop
		};
		
		return 0;	//bleibe in Loop
	}
	
// notausstieg
	
	else if	( Npc_GetDistToNpc( self, other ) > 2000)	//allg. Abbruchbendingung
	{
		
		return 1;	//Exit Loop
	};
	
	return 0;	//bleibe in Loop
	

};


func void ZS_OrcGuard_ObserveIntruder_End()
{
	PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcGuard_ObserveIntruder_End" );
	if ( Npc_HasReadiedWeapon( self ) )
	{
		AI_RemoveWeapon( self );
	};
	AI_StopLookAt( self );
	AI_ContinueRoutine( self );
};

//*******************************************************************************************************************
//											ZS_OrcWarrior_ObserveIntruder											*
//*******************************************************************************************************************


func void ZS_OrcWarrior_ObserveIntruder()
{
	PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcWarrior_ObserveIntruder" );

	// Perceptions beim beobachten...
	Npc_PercEnable( self, PERC_ASSESSDAMAGE,	 	B_Orc_AssessDamage );
	Npc_PercEnable( self, PERC_DRAWWEAPON, 			B_Orc_DrawWeapon );
	Npc_PercEnable( self, PERC_ASSESSOTHERSDAMAGE,	ZS_Orc_WatchFight );
	Npc_PercEnable( self, PERC_ASSESSMURDER,		B_Orc_AssessMurder );
	Npc_PercEnable( self, PERC_ASSESSDEFEAT,		B_Orc_AssessDefeat );
	Npc_PercEnable( self, PERC_ASSESSCASTER,		B_Orc_AssessSomethingEvil );	
	Npc_PercEnable( self, PERC_ASSESSMAGIC,			B_AssessMagic );	
	Npc_PercEnable( self, PERC_ASSESSTHREAT,		B_Orc_AssessSomethingEvil );	
	//Npc_PercEnable( self, PERC_ASSESSWARN,			B_Orc_AssessWarn );		//schmeissen sich sonst aud der Loop

	self.aivar[AIV_OBSERVEINTRUDER] = 0;
	self.aivar[AIV_WARNTARGET] = 0;

};


func int ZS_OrcWarrior_ObserveIntruder_Loop()
{
	PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcWarrior_ObserveIntruder_Loop:" );


//--------------------------------------Unterteilung nach Attituden-------------------------------------------------------

// hostile

	if ( Npc_GetAttitude( self, other ) == ATT_HOSTILE )
	{		
		PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcWarrior_ObserveIntruder: HOSTILE" );
		B_Say( self, other, "$DIE" );
		AI_StartState( self, ZS_Orc_Attack, 1, "" );
		return 1;	//Abbruch
	}
	
// angry
	
	else if ( ( Npc_GetAttitude( self, other ) == ATT_ANGRY) && (self.aivar[AIV_WARNTARGET] == 0) )
	{		
		PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcWarrior_ObserveIntruder: ANGRY" );
		B_Orc_SmartTurn();
		if ( Npc_GetDistToNpc( self, other ) < 500  &&  
			 ( self.aivar[AIV_OBSERVEINTRUDER] == 1  ||  Npc_GetStateTime( self ) > 6 ) )
		{
			PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcWarrior_ObserveIntruder: ANGRY: Angriff 1" );
			B_Say( self, other, "$DIE" );
			AI_StartState( self, ZS_Orc_Attack, 1, "" );
		}
		else if ( (Npc_GetDistToNpc( self, other ) < 1500)  &&  (self.aivar[AIV_OBSERVEINTRUDER] == 0) )
		{
			PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcWarrior_ObserveIntruder: ANGRY: Waffe ziehen" );
			if ( !Npc_HasReadiedWeapon( self ) )
			{
				AI_EquipBestMeleeWeapon( self );
				AI_DrawWeapon( self );
			};
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			B_Say( self, other, "$LOOKINGFORTROUBLEEH" );
		}
		else if ( (self.aivar[AIV_OBSERVEINTRUDER] == 1)  &&  (Npc_GetStateTime( self ) > 6) )
		{
			PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcWarrior_ObserveIntruder: ANGRY: Angriff 2" );
			B_Say( self, other, "$DIE" );
			AI_StartState( self, ZS_Orc_Attack, 1, "" );
		}
		else if (Npc_GetDistToNpc( self, other ) > 1500)	
		{
			
			return 1;	//Exit Loop
		};
		return 0;	//bleibe in Loop
	}
	
// neutral	
	
	else if ( (Npc_GetAttitude( self, other ) == ATT_NEUTRAL)	&& (self.aivar[AIV_WARNTARGET] == 0) )
	{		
		PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcWarrior_ObserveIntruder: NEUTRAL" );
		B_Orc_SmartTurn();
		if ( Npc_GetDistToNpc( self, other ) < 300  &&  self.aivar[AIV_OBSERVEINTRUDER] > 0 )
		{
			if ( self.aivar[AIV_OBSERVEINTRUDER] != 2 )
			{
				self.aivar[AIV_OBSERVEINTRUDER] = 2;
				AI_Wait( self, 3 );
			}
			else if ( Npc_GetStateTime( self ) > 10 )
			{
				PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcWarrior_ObserveIntruder: NEUTRAL: Angriff" );
				AI_StartState( self, ZS_Orc_Attack, 1, "" );
			};
		}
		else if ( (Npc_GetDistToNpc( self, other ) < 500)  && (self.aivar[AIV_OBSERVEINTRUDER] == 0) )
		{
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcWarrior_ObserveIntruder: NEUTRAL: Waffe ziehen" );
			if ( !Npc_HasReadiedWeapon( self ) )
			{
				AI_EquipBestMeleeWeapon( self );
				AI_DrawWeapon( self );
			};
			B_Say( self, other, "$LOOKINGFORTROUBLEEH" );
		}
		else if ( Npc_GetStateTime( self ) > 15)  
		{
			
			return 1; //Exit Loop
		};
		return 0;	//bleibe in Loop
	}
	
// friendly
	
	else if ( Npc_GetAttitude( self, other ) == ATT_FRIENDLY )
	{		
		PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcWarrior_ObserveIntruder: FRIENDLY" );
		B_Orc_SmartTurn();
		if ( Npc_GetDistToNpc( self, other ) < 300  &&  self.aivar[AIV_OBSERVEINTRUDER] != 1 )
		{
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			B_Say( self, other, "$WHAT" );
		};
		if ( Npc_GetDistToNpc( self, other ) > 700 ) 
		{
			
			return 1;	//Exit Loop
		};
		
		return 0;	//bleibe in Loop
	}
	
// notausstieg
	
	else if	( Npc_GetDistToNpc( self, other ) > 2000)	//allg. Abbruchbendingung
	{
		
		return 1;	//Exit Loop
	};
	
	return 0;	//bleibe in Loop
	

};


func void ZS_OrcWarrior_ObserveIntruder_End()
{
	PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcWarrior_ObserveIntruder_End" );
	if ( Npc_HasReadiedWeapon( self ) )
	{
		AI_RemoveWeapon( self );
	};
	AI_StopLookAt( self );
	AI_ContinueRoutine( self );
};


//*******************************************************************************************************************
//											ZS_OrcScout_ObserveIntruder												*
//*******************************************************************************************************************


func void ZS_OrcScout_ObserveIntruder()
{
	PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcScout_ObserveIntruder" );

	// Perceptions beim beobachten...
	Npc_PercEnable( self, PERC_ASSESSDAMAGE,	 	B_Orc_AssessDamage );
	Npc_PercEnable( self, PERC_DRAWWEAPON, 			B_Orc_DrawWeapon );
	Npc_PercEnable( self, PERC_ASSESSOTHERSDAMAGE,	ZS_Orc_WatchFight );
	Npc_PercEnable( self, PERC_ASSESSMURDER,		B_Orc_AssessMurder );
	Npc_PercEnable( self, PERC_ASSESSDEFEAT,		B_Orc_AssessDefeat );
	Npc_PercEnable( self, PERC_ASSESSCASTER,		B_Orc_AssessSomethingEvil );	
	Npc_PercEnable( self, PERC_ASSESSMAGIC,			B_AssessMagic );	
	Npc_PercEnable( self, PERC_ASSESSTHREAT,		B_Orc_AssessSomethingEvil );	
	//Npc_PercEnable( self, PERC_ASSESSWARN,			B_Orc_AssessWarn );		//schmeissen sich sonst aud der Loop

	self.aivar[AIV_OBSERVEINTRUDER] = 0;
	self.aivar[AIV_WARNTARGET] = 0;

	
};


func int ZS_OrcScout_ObserveIntruder_Loop()
{
	PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcScout_ObserveIntruder_Loop:" );

	
//--------------------------------Unterteilung nach Attituden----------------------------------------------------------------

// hostile

	if (( Npc_GetAttitude( self, other ) == ATT_HOSTILE )	&& ( Npc_GetDistToNpc( self, other ) < 1000))
	{		
		PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcScout_ObserveIntruder: HOSTILE" );
		B_Say( self, other, "$DIE" );
		AI_StartState( self, ZS_Orc_Attack, 1, "" );
		return 1;	//Abbruch
	}
	
// angry
	
	else if (( Npc_GetAttitude( self, other ) == ATT_ANGRY )&& (self.aivar[AIV_WARNTARGET] == 0))
	{		
		PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcScout_ObserveIntruder: ANGRY" );
		B_Orc_SmartTurn();
		if ( Npc_GetDistToNpc( self, other ) < 300  &&  
			 ( self.aivar[AIV_OBSERVEINTRUDER] == 1  ||  Npc_GetStateTime( self ) > 6 ) )
		{
			PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcScout_ObserveIntruder: ANGRY: Angriff 1" );
			B_Say( self, other, "$DIE" );
			AI_StartState( self, ZS_Orc_Attack, 1, "" );
		}
		else if ( Npc_GetDistToNpc( self, other ) < 400  &&  self.aivar[AIV_OBSERVEINTRUDER] == 0 )
		{
			PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcScout_ObserveIntruder: ANGRY: Waffe ziehen" );
			if ( !Npc_HasReadiedWeapon( self ) )
			{
				AI_EquipBestMeleeWeapon( self );
				AI_DrawWeapon( self );
			};
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			B_Say( self, other, "$LOOKINGFORTROUBLEEH" );
		}
		else if ( self.aivar[AIV_OBSERVEINTRUDER] == 1  &&  Npc_GetStateTime( self ) > 6 )
		{
			PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcScout_ObserveIntruder: ANGRY: Angriff 2" );
			B_Say( self, other, "$DIE" );
			AI_StartState( self, ZS_Orc_Attack, 1, "" );
		}
		else if ( Npc_GetDistToNpc( self, other ) > 600 )	
		{
			
			return 1;	//Exit Loop
		};
		return 0;	//bleibe in Loop
	}
	
// neutral
	
	else if (( Npc_GetAttitude( self, other ) == ATT_NEUTRAL )	&& (self.aivar[AIV_WARNTARGET] == 0))
	{		
		PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcScout_ObserveIntruder: NEUTRAL" );
		B_Orc_SmartTurn();
		if ( Npc_GetDistToNpc( self, other ) < 200  &&  self.aivar[AIV_OBSERVEINTRUDER] > 0 )
		{
			if ( self.aivar[AIV_OBSERVEINTRUDER] != 2 )
			{
				self.aivar[AIV_OBSERVEINTRUDER] = 2;
				AI_Wait( self, 3 );
			}
			else if ( Npc_GetStateTime( self ) > 10 )
			{
				PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcScout_ObserveIntruder: NEUTRAL: Angriff" );
				AI_StartState( self, ZS_Orc_Attack, 1, "" );
			};
		}
		else if ( Npc_GetDistToNpc( self, other ) < 400  &&  self.aivar[AIV_OBSERVEINTRUDER] == 0)
		{
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcScout_ObserveIntruder: NEUTRAL: Waffe ziehen" );
			
			B_Say( self, other, "$LOOKINGFORTROUBLEEH" );
		}
		else if ( Npc_GetStateTime( self ) > 15)  
		{
			
			return 1; //Exit Loop
		};
		return 0;	//bleibe in Loop
	}
	
// friendly
	
	else if ( Npc_GetAttitude( self, other ) == ATT_FRIENDLY )
	{		
		PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcScout_ObserveIntruder: FRIENDLY" );
		B_Orc_SmartTurn();
		if ( Npc_GetDistToNpc( self, other ) < 300  &&  self.aivar[AIV_OBSERVEINTRUDER] != 1 )
		{
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			B_Say( self, other, "$WHAT" );
		};
		if ( Npc_GetDistToNpc( self, other ) > 400  )
		{
			
			return 1;	//Exit Loop
		};
		
		return 0;	//bleibe in Loop
	}
	
// notausstieg
	
	else if	( Npc_GetDistToNpc( self, other ) > 2000)	//allg. Abbruchbendingung
	{
		
		return 1;	//Exit Loop
	};
	
	return 0;	//bleibe in Loop
	

};


func void ZS_OrcScout_ObserveIntruder_End()
{
	PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcScout_ObserveIntruder_End" );
	if ( Npc_HasReadiedWeapon( self ) )
	{
		AI_RemoveWeapon( self );
	};
	AI_StopLookAt( self );
	AI_ContinueRoutine( self );
};




//*******************************************************************************************************************
//											ZS_OrcShaman_ObserveIntruder												*
//*******************************************************************************************************************


func void ZS_OrcShaman_ObserveIntruder()
{
	PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcShaman_ObserveIntruder" );

	// Perceptions beim beobachten...
	Npc_PercEnable( self, PERC_ASSESSDAMAGE,	 	B_Orc_AssessDamage );
	Npc_PercEnable( self, PERC_DRAWWEAPON, 			B_Orc_DrawWeapon );
	Npc_PercEnable( self, PERC_ASSESSOTHERSDAMAGE,	ZS_Orc_WatchFight );
	Npc_PercEnable( self, PERC_ASSESSMURDER,		B_Orc_AssessMurder );
	Npc_PercEnable( self, PERC_ASSESSDEFEAT,		B_Orc_AssessDefeat );
	Npc_PercEnable( self, PERC_ASSESSCASTER,		B_Orc_AssessSomethingEvil );	
	Npc_PercEnable( self, PERC_ASSESSMAGIC,			B_AssessMagic );	
	Npc_PercEnable( self, PERC_ASSESSTHREAT,		B_Orc_AssessSomethingEvil );	
	//Npc_PercEnable( self, PERC_ASSESSWARN,			B_Orc_AssessWarn );		//schmeissen sich sonst aud der Loop

	self.aivar[AIV_OBSERVEINTRUDER] = 0;
	self.aivar[AIV_WARNTARGET] = 0;

};


func int ZS_OrcShaman_ObserveIntruder_Loop()
{
	PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcShaman_ObserveIntruder_Loop:" );

//-------------------------------------------------Unterteilung nach Attituden--------------------------------------------

// hostile

	if (( Npc_GetAttitude( self, other ) == ATT_HOSTILE )	&&	( Npc_GetDistToNpc( self, other ) < 1500) )
	{		
		PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcShaman_ObserveIntruder: HOSTILE" );
		B_Say( self, other, "$DIE" );
		AI_StartState( self, ZS_Orc_Attack, 1, "" );
		return 1;	//Abbruch
	}
	
// angry

	else if (( Npc_GetAttitude( self, other ) == ATT_ANGRY )&& (self.aivar[AIV_WARNTARGET] == 0))
	{		
		PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcShaman_ObserveIntruder: ANGRY" );
		B_Orc_SmartTurn();
		if ( Npc_GetDistToNpc( self, other ) < 500  &&  
			 ( self.aivar[AIV_OBSERVEINTRUDER] == 1  ||  Npc_GetStateTime( self ) > 6 ) )
		{
			PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcShaman_ObserveIntruder: ANGRY: Angriff 1" );
			B_Say( self, other, "$DIE" );
			AI_StartState( self, ZS_Orc_Attack, 1, "" );
		}
		else if ( Npc_GetDistToNpc( self, other ) < 1500  &&  self.aivar[AIV_OBSERVEINTRUDER] == 0 )
		{
			PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcShaman_ObserveIntruder: ANGRY: Waffe ziehen" );
// funzt das mit magiern 
			if ( !Npc_HasReadiedWeapon( self ) )
			{
				AI_EquipBestMeleeWeapon( self );
				AI_DrawWeapon( self );
			};
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			B_Say( self, other, "$LOOKINGFORTROUBLEEH" );
		}
		else if ( self.aivar[AIV_OBSERVEINTRUDER] == 1  &&  Npc_GetStateTime( self ) > 6 )
		{
			PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcShaman_ObserveIntruder: ANGRY: Angriff 2" );
			B_Say( self, other, "$DIE" );
			AI_StartState( self, ZS_Orc_Attack, 1, "" );
		};
		
		return 0;	//bleibe in Loop
	}

// neutral

	else if (( Npc_GetAttitude( self, other ) == ATT_NEUTRAL )	&& (self.aivar[AIV_WARNTARGET] == 0))
	{		
		PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcShaman_ObserveIntruder: NEUTRAL" );
		B_Orc_SmartTurn();
		if ( Npc_GetDistToNpc( self, other ) < 300  &&  self.aivar[AIV_OBSERVEINTRUDER] > 0 )
		{
			if ( self.aivar[AIV_OBSERVEINTRUDER] != 2 )
			{
				self.aivar[AIV_OBSERVEINTRUDER] = 2;
				AI_Wait( self, 3 );
			}
			else if ( Npc_GetStateTime( self ) > 10 )
			{
				PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcShaman_ObserveIntruder: NEUTRAL: Angriff" );
				AI_StartState( self, ZS_Orc_Attack, 1, "" );
			};
		}
		else if ( Npc_GetDistToNpc( self, other ) < 1000  &&  self.aivar[AIV_OBSERVEINTRUDER] == 0)
		{
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcShaman_ObserveIntruder: NEUTRAL: Waffe ziehen" );
// magier klappt das?
			if ( !Npc_HasReadiedWeapon( self ) )
			{
				AI_EquipBestMeleeWeapon( self );
				AI_DrawWeapon( self );
			};
			B_Say( self, other, "$LOOKINGFORTROUBLEEH" );
		}
		else if ( Npc_GetStateTime( self ) > 15 ) 
		{
			
			return 1; //Exit Loop
		};
		return 0;	//bleibe in Loop
	}
	
// friendly	
	
	else if ( Npc_GetAttitude( self, other ) == ATT_FRIENDLY )
	{		
		PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcShaman_ObserveIntruder: FRIENDLY" );
		B_Orc_SmartTurn();
		if ( Npc_GetDistToNpc( self, other ) < 300  &&  self.aivar[AIV_OBSERVEINTRUDER] != 1 )
		{
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			B_Say( self, other, "$WHAT" );
		};
		if ( Npc_GetDistToNpc( self, other ) > 400  )
		{
			
			return 1;	//Exit Loop
		};
		
		return 0;	//bleibe in Loop
	}
	
// notausstieg

	else if	( Npc_GetDistToNpc( self, other ) > 2000)	//allg. Abbruchbendingung
	{
		
		return 1;	//Exit Loop
	};
	
	return 0;	//bleibe in Loop
	

};


func void ZS_OrcShaman_ObserveIntruder_End()
{
	PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcShaman_ObserveIntruder_End" );
	if ( Npc_HasReadiedWeapon( self ) )
	{
		AI_RemoveWeapon( self );
	};
	AI_StopLookAt( self );
	AI_ContinueRoutine( self );
};




//	######################################################################
//
//		ZS_Orc-TA-Funktionen
//
//		Diese Datei enthält ca. 1 Millionen lustiger Orc-Ta Zustände	
//		von Orc_DrinkAlcohol bis Orc_Drum.
//
//	######################################################################


//#######################################################
//		B_Orc_Idle_Ani
//#######################################################
// spielt Anis ab, wenn der Ork nur dumm herumSTEHT
func void B_Orc_Idle_Ani()
{
	var int ani;
	ani = Hlp_Random( 130 );
	if ( ani < 10 )
	{
		AI_PlayAni( self, "T_PERCEPTION" );
	}
	else if ( ani < 20 )
	{
		AI_PlayAni( self, "T_WARN" );
	}
	else if ( ani < 30 )
	{
		AI_PlayAni( self, "T_ANGRY" );
	}
	else if ( ani < 40 )
	{
		AI_PlayAni( self, "T_FRIGHTEND" );
	}
	else if ( ani < 50 )
	{
		AI_PlayAni( self, "T_HAPPY" );
	}
	else if ( ani < 60 )
	{
		AI_PlayAni( self, "T_DIALOGGESTURE_01" );
	}
	else if ( ani < 70 )
	{
		AI_PlayAni( self, "T_DIALOGGESTURE_02" );
	}
	else if ( ani < 80 )
	{
		AI_PlayAni( self, "T_DIALOGGESTURE_03" );
	}
	else if ( ani < 90 )
	{
		AI_PlayAni( self, "T_DIALOGGESTURE_04" );
	}
	else if ( ani < 100 )
	{
		AI_PlayAni( self, "T_DIALOGGESTURE_05" );
	}
	else if ( ani < 110 )
	{
		AI_PlayAni( self, "T_DIALOGGESTURE_06" );
	}
	else if ( ani < 120 )
	{
		AI_PlayAni( self, "T_DIALOGGESTURE_07" );
	}
	else if ( ani < 130 )
	{
		AI_PlayAni( self, "T_DIALOGGESTURE_08" );
	};
	
	AI_Wait( self, 1 );
};



//#####################################################
//		MOBSI: STONEMILL
//#####################################################
func void ZS_Orc_Stonemill()
{
	PrintDebugNpc( PD_ZS_FRAME,"ZS_Orc_Stonemill" );
	
	if ( Npc_GetBodyState( self ) != BS_MOBINTERACT )
	{
		AI_SetWalkmode( self, NPC_WALK );		// Walkmode für den Zustand
		if ( Hlp_StrCmp( Npc_GetNearestWp(self), self.wp) == 0 )
		{
			AI_GotoWP( self, self.wp );
		};
	};
	
	OrcDefaultPercDoing();
};

func void ZS_Orc_Stonemill_Loop()
{
	PrintDebugNpc( PD_ZS_FRAME,"ZS_Orc_Stonemill_Loop" );

	AI_UseMob( self, "STONEMILL", 1 );
	AI_UseMob( self, "STONEMILL", 0 );
	
	//CS: Orc muss sich jede Runde einmal ab- und wieder anmelden, damit er mit dem Mobsi synchronisiert bleibt
	AI_UseMob( self, "STONEMILL", -1 ); 
};

func void ZS_Orc_Stonemill_End()
{
	PrintDebugNpc( PD_ZS_FRAME,"ZS_Orc_Stonemill_End" );
	Npc_ClearAIQueue( self );
	AI_UseMob( self, "STONEMILL", -1 );
};



//#####################################################
//		MOBSI: STOMPER
//#####################################################
func void ZS_Orc_Stomper()
{
	PrintDebugNpc( PD_TA_FRAME,"ZS_Orc_Stomper" );
	
	if ( Npc_GetBodyState( self) != BS_MOBINTERACT )
	{
		AI_SetWalkmode( self, NPC_WALK );		// Walkmode für den Zustand
		if ( Hlp_StrCmp( Npc_GetNearestWp(self), self.wp) == 0 )
		{
			AI_GotoWP( self, self.wp );
		};
	};

	OrcDefaultPercDoing();
};

func void ZS_Orc_Stomper_Loop()
{
	PrintDebugNpc( PD_TA_FRAME,"ZS_Orc_Stomper_Loop" );
	AI_UseMob( self, "STOMPER", 1 );		//Ani anwerfen
	AI_UseMob( self, "STOMPER", 0 );		//Ani anwerfen
	
    //CS: Orc muss sich jede Runde einmal ab- und wieder anmelden, damit er mit dem Mobsi synchronisiert bleibt
	AI_UseMob( self, "STOMPER", -1 ); 	
};

func void ZS_Orc_Stomper_End()
{
	PrintDebugNpc( PD_TA_FRAME,"ZS_Orc_Stomper_End" );
	Npc_ClearAIQueue( self );
	AI_UseMob( self, "STOMPER", -1 );						//Schluss jetzt mit dem Quatsch
};



//#######################################################
//		ZS_Orc_Eat
//#######################################################
func void ZS_Orc_Eat ()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Eat" );
	
	AI_SetWalkmode (self,NPC_WALK);	// Walkmode für den Zustand
	if ( !Npc_IsOnFP( self, "STAND" ) )
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	
	OrcDefaultPerc();
};


func int ZS_Orc_Eat_Loop()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Eat_Loop" );
	
	B_GotoFP	(self, "STAND");
	
	B_Orc_ItemEat();
	var float pause;
	pause = intToFloat( Hlp_Random( 5 ) + 2 );
	AI_Wait( self, pause );
	
	return 0;	// bleibe in Loop
};


func void ZS_Orc_Eat_End ()
{
	PrintDebugNpc (PD_ZS_FRAME,"ZS_Eat_End");
	Npc_ClearAIQueue( self );
};


//#######################################################
//		ZS_Orc_Sleep
//#######################################################

func void ZS_Orc_Sleep ()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Sleep" );

	if ( !C_BodyStateContains( self, BS_MOBINTERACT ) )
	{
		if ( Hlp_StrCmp( Npc_GetNearestWP( self ), self.wp ) == 0 )
		{
			AI_GotoWP	(self, self.wp);
		};
		AI_UnequipWeapons( self );
		AI_UseMob( self, "BEDLOW", 1 );
	};
	
	OrcLightSleepPerc();
};


func int ZS_Orc_Sleep_Loop ()
{
	PrintDebugNpc( PD_ZS_LOOP, "ZS_ORC_Sleep_Loop" );
	
	//	Wir dürfen an dieser Stelle weder davon ausgehen, das der NPC seinen wegpunkt schon erreicht 
	//	hat und im Bett liegt. Deshalb warten wir bis er den BodyState BS_MOBINTERACT erreicht hat!
	if ( C_BodyStateContains( self, BS_MOBINTERACT ) ) 
	{
		//	Hier könnte man Zufallsanimationen abspielen wenn sie existieren würden.
		
	};
	return 0;
};

func void ZS_Orc_Sleep_End ()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Sleep_End" );	
	Npc_ClearAIQueue( self );
	
	//	Mobbenutzung beenden
	AI_UseMob( self, "BEDLOW", -1 );
	
	//	Aufwachgeräusche von sich geben			
	B_Say( self, NULL, "$AWAKE" );
	
	//	Waffen anlegen
	AI_EquipBestMeleeWeapon( self );
	AI_EquipBestRangedWeapon( self );
};


//#######################################################
//	ZS_Orc_Pray
//#######################################################
func void ZS_Orc_Pray ()
{
    PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Pray" );
	
	OrcDefaultPercDoing();

	AI_SetWalkmode( self, NPC_WALK );		// Walkmode für den Zustand
	if ( !Npc_IsOnFP( self, "PREY" ) )
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
};

func void ZS_Orc_Pray_Loop ()
{
    PrintDebugNpc( PD_ZS_LOOP, "ZS_Orc_Pray_Loop" );

 	B_GotoFP	(self, "PREY");
 
   	if ( Npc_GetBodyState( self ) != BS_SIT )
   	{
   		AI_PlayAniBS( self, "T_STAND_2_PRAY", BS_SIT );
   	}
   	else
   	{
   		AI_PlayAniBS( self, "T_PRAY_RANDOM", BS_SIT );
   	};

	AI_Wait( self, 1 );    
};

func void ZS_Orc_Pray_End ()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Pray_End" );
	Npc_ClearAIQueue( self );
	AI_PlayAniBS( self, "T_PRAY_2_STAND", BS_STAND );
};


//#######################################################
//		ZS_Orc_Drum
//#######################################################
func void ZS_Orc_Drum ()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Drum" );
	
	//	Zum angegebenen Wegpunkt gehen und mit trommeln anfangen
	if ( Npc_GetBodyState( self) != BS_MOBINTERACT )
	{
		AI_SetWalkmode( self, NPC_WALK );
		if ( Hlp_StrCmp( Npc_GetNearestWp(self), self.wp) == 0 )
		{
			AI_GotoWP( self, self.wp );
		};
		AI_UseMob( self, "DRUM", 1 );		//Ani anwerfen
	};
	
	OrcDefaultPercDoing();
};

func int ZS_Orc_Drum_Loop ()
{
	PrintDebugNpc( PD_ZS_LOOP, "ZS_Orc_Drum_Loop" );
	
	if ( Npc_GetBodyState(self) == BS_MOBINTERACT_INTERRUPT )
	{
		var int random;
		random = Hlp_Random( 15 );
		if ( random < 5 )
		{
			AI_PlayAniBS( self, "T_ORCDRUM_RANDOM_1", BS_MOBINTERACT_INTERRUPT );
		}
		else if ( random < 10 )
		{
			AI_PlayAniBS( self, "T_ORCDRUM_RANDOM_2", BS_MOBINTERACT_INTERRUPT );
		}
		else
		{
			AI_PlayAniBS( self, "T_ORCDRUM_RANDOM_3", BS_MOBINTERACT_INTERRUPT );
		};
	};
	
	return LOOP_CONTINUE;
};

func int ZS_Orc_Drum_End ()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Drum_End" );
	Npc_ClearAIQueue( self );

	//nicht mehr Trommeln
	AI_UseMob( self, "DRUM", -1 );	
};

//#######################################################
//		ZS_Orc_Speech
//#######################################################
func void ZS_Orc_Speech ()
{
    PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Speech" );
    
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
	if ( !Npc_IsOnFP( self, "STAND" ) )
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	
	OrcDefaultPerc();
};

func int ZS_Orc_Speech_Loop ()
{
    PrintDebugNpc	(PD_ZS_LOOP, "ZS_Orc_Speech_Loop" );
    
 	B_GotoFP		(self, "STAND");
 	
    // Random-Anis abspielen
    var int ani;
    ani = Hlp_Random( 30 );
    if ( ani == 1 )
    {
    	AI_PlayAni( self, "T_DIALOGGESTURE_01" );
    }
    else if ( ani == 2 )
    {
    	AI_PlayAni( self, "T_DIALOGGESTURE_02" );
    }
    else if ( ani == 3 )
    {
    	AI_PlayAni( self, "T_DIALOGGESTURE_03" );
    }
    else if ( ani == 4 )
    {
    	AI_PlayAni( self, "T_DIALOGGESTURE_04" );
    }
    else if ( ani == 5 )
    {
    	AI_PlayAni( self, "T_DIALOGGESTURE_05" );
    }
    else if ( ani == 6 )
    {
    	AI_PlayAni( self, "T_DIALOGGESTURE_06" );
    }
    else if ( ani == 7 )
    {
    	AI_PlayAni( self, "T_DIALOGGESTURE_07" );
    }
    else if ( ani == 8 )
    {
    	AI_PlayAni( self, "T_DIALOGGESTURE_08" );
    };
    
    AI_Wait( self, 1 );
};

func void ZS_Orc_Speech_End ()
{
    PrintDebugNpc( PD_TA_FRAME, "ZS_Orc_Speech_End" );
   	Npc_ClearAIQueue( self );
};



//#######################################################
//		ZS_Orc_GotoWP
//#######################################################
func void ZS_Orc_GotoWP()
{	
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_GotoWP" );				
	
	AI_SetWalkmode( self, NPC_WALK );
	AI_GotoWP( self, self.wp);
	AI_AlignToWP( self );				//Richte Dich aus
	
	OrcDefaultPerc();
};

func void ZS_Orc_GotoWp_Loop()
{
	PrintDebugNpc( PD_ZS_LOOP, "ZS_Orc_GotoWP_Loop" );
	
	//irgendwelche Anis
	if ( Hlp_Random( 250 ) < 10 )
	{
		B_Orc_Idle_Ani();
	};

};

func void ZS_Orc_GotoWP_End()
{	
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_GotoWP_End" );				
	Npc_ClearAIQueue( self );
};


//#######################################################
//		ZS_Orc_WalkAround
//########################################################
func void ZS_Orc_WalkAround()
{
    PrintDebugNpc (PD_ZS_FRAME,"ZS_Orc_WalkAround");

	OrcDefaultPerc();
    
	AI_SetWalkmode( self, NPC_WALK );	// Walkmode für den Zustand
	if ( !Npc_IsOnFP( self, "FP_ORC_STAND" ) )
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	if ( Wld_IsFPAvailable( self, "FP_ORC_STAND_A" ) )
	{
		AI_GotoFP( self, "FP_ORC_STAND_A" );
	} 
	else if ( Wld_IsFPAvailable( self, "FP_ORC_STAND_B" ) )
	{
		AI_GotoFP( self, "FP_ORC_STAND_B" );
	} 
	else if ( Wld_IsFPAvailable( self, "FP_ORC_STAND_C" ) )
	{
		AI_GotoFP( self, "FP_ORC_STAND_C" );
	};
	AI_AlignToFP( self );				//Richte Dich aus
	
};
 
func void ZS_Orc_WalkAround_Loop()
{
    PrintDebugNpc(PD_TA_LOOP,"ZS_Orc_WalkAround_Loop");

	var string wp1;
	var string wp2;
	wp1 = Npc_GetNearestWP( self );
	wp2 = Npc_GetNextWP( self );
	
	if ( !Hlp_StrCmp( wp1, self.wp )  &&  Hlp_Random( 10 ) < 5 )
	{
    	PrintDebugNpc(PD_ZS_FRAME,"ZS_Orc_WalkAround: Goto Nearest");
		AI_GotoWP( self, wp1 );
		self.wp = wp1;
	}
	else if ( !Hlp_StrCmp( wp2, self.wp ) )
	{
    	PrintDebugNpc(PD_ZS_FRAME,"ZS_Orc_WalkAround: Goto Next");
		AI_GotoWP( self, wp2 );
		self.wp = wp2;
	};
	
	if ( Hlp_Random( 80 ) < 10 )
	{
		PrintDebugNpc(PD_ZS_FRAME,"ZS_Orc_WalkAround: Idle Ani");
		B_Orc_Idle_Ani();
		AI_Wait( self, 2 );
		return;
	};
	
	if ( Hlp_Random( 50 ) < 5 )
	{
		PrintDebugNpc(PD_ZS_FRAME,"ZS_Orc_WalkAround: Wait");
		var float f;
		f = intToFloat( Hlp_Random( 4 ) );
		AI_Wait( self, f );
	};
		
};

func void ZS_Orc_WalkAround_End()
{
    PrintDebugNpc (PD_TA_FRAME,"ZS_Orc_WalkAround_End");
	Npc_ClearAIQueue( self );
};


//#########################################################
//		ZS_Orc_DrinkAlcohol
//#########################################################
func void ZS_Orc_DrinkAlcohol ()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_DrinkAlcohol" );
	
	OrcDefaultPerc();

	AI_SetWalkmode (self,NPC_WALK);	// Walkmode für den Zustand
	if ( !Npc_IsOnFP( self, "STAND" ) )
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
};


func int ZS_Orc_DrinkAlcohol_Loop()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_DrinkAlcohol_Loop" );
	
	B_GotoFP		(self, "STAND");
	
	B_Orc_ItemPotion();
	var float pause;
	pause = intToFloat( Hlp_Random( 5 ) + 2 );
	AI_Wait( self, pause );
	
	return 0;	// bleibe in Loop
};


func void ZS_Orc_DrinkAlcohol_End ()
{
	PrintDebugNpc (PD_ZS_FRAME,"ZS_DrinkAlcohol_End");
	Npc_ClearAIQueue( self );
};



//#######################################################
//		ZS_Orc_Dance
//#######################################################
func void ZS_Orc_Dance()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Dance" );
	
	//	Zum angegebenen Wegpunkt gehen
	AI_SetWalkmode( self, NPC_WALK );
	if ( !Npc_IsOnFP( self, "DANCE" ) )
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};

	OrcDefaultPercDoing();
};

func void ZS_Orc_Dance_Loop()
{
	PrintDebugNpc( PD_ZS_LOOP, "ZS_Orc_Dance_Loop" );
	
	B_GotoFP		(self, "DANCE");

	if ( Hlp_Random( 10 ) < 5 )
	{
		PrintDebugNpc( PD_ZS_FRAME,"ZS_Orc_Dance_Loop: T_DANCE" );
		AI_PlayAni( self, "T_DANCE" );
	}
	else
	{
		PrintDebugNpc( PD_ZS_FRAME,"ZS_Orc_Dance_Loop: T_DANCE_RANDOM_1" );
		AI_PlayAni( self, "T_DANCE_RANDOM_1" );
	};

};

func void ZS_Orc_Dance_End()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Dance_End" );
	Npc_ClearAIQueue( self );
	AI_StandUp( self );
};



//#######################################################
//		ZS_Orc_EatAndDrink
//#######################################################
func void ZS_Orc_EatAndDrink()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Orc_EatAndDrink");
	
	//gehe zum WP	
	AI_SetWalkmode( self, NPC_WALK );	// Walkmode für den Zustand
	if ( !Npc_IsOnFP( self, "STAND" ) )
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	
	OrcDefaultPerc();
};

func void ZS_Orc_EatAndDrink_Loop()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Orc_EatAndDrink_Loop");
	
	B_GotoFP		(self, "STAND");

	//Essen oder Trinken?
	if ( Hlp_Random( 10 ) < 5 )
	{
		B_Orc_ItemEat();
	}
	else
	{
		B_Orc_ItemPotion();
	};
	var float pause;
	pause = intToFloat( Hlp_Random( 5 ) + 2 );
	AI_Wait( self, pause );
};

func void ZS_Orc_EatAndDrink_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Orc_EatAndDrink_End");
	Npc_ClearAIQueue( self );
};


//#######################################################
//		ZS_Orc_GuardSleepy
//#######################################################
func void ZS_Orc_GuardSleepy()
{
    PrintDebugNpc( PD_TA_FRAME, "ZS_Orc_GuardSleepy" );
	AI_SetWalkmode( self, NPC_WALK );	// Walkmode für den Zustand
	if ( !Npc_IsOnFP( self, "SIT" ) )
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	
	OrcDefaultPerc();
};

func void ZS_Orc_GuardSleepy_Loop()
{
    PrintDebugNpc	(PD_ZS_FRAME, "ZS_Orc_GuardSleepy_Loop" );

	B_GotoFP		(self, "SIT");

    //evtl. Ani
    if ( !C_BodyStateContains( self, BS_SIT )  &&  Hlp_Random( 500 ) < 10 )
    {
    	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_GuardSleepy_Loop: stehende Ani" );
    	B_Orc_Idle_Ani();
    	return;
    };
   
    //evtl. hinsetzen
    if ( !C_BodyStateContains( self, BS_SIT )  &&  Hlp_Random( 600 ) < 10 )
    {
    	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_GuardSleepy_Loop: hinsetzen" );
    	AI_PlayAniBS( self, "T_STAND_2_GUARDSIT", BS_SIT );
    	AI_Wait( self, 2 );
    	return;
    };

    //evtl. einschlafen beim Sitzen
	if ( C_BodyStateContains( self, BS_SIT )  &&  Hlp_Random( 700 ) < 10 )
	{
		PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_GuardSleepy_Loop: einschlafen im Sitzen" );
		AI_PlayAniBS( self, "T_GUARDSIT_2_GUARDSLEEP",BS_SIT );
		var float sleep;
		sleep = intToFloat( Hlp_Random( 5 ) + 15 );
		AI_Wait( self, sleep );
		AI_PlayAniBS( self, "T_GUARDSLEEP_2_GUARDSIT",BS_SIT );
		return;
    };
};

func void ZS_Orc_GuardSleepy_End()
{
	PrintDebugNpc( PD_TA_FRAME, "ZS_Orc_GuardSleepy_End" );
};


//#######################################################
//		ZS_Orc_Guard
//#######################################################
func void ZS_Orc_Guard()
{
    PrintDebugNpc	(PD_TA_FRAME, "ZS_Orc_Guard" );

	OrcDefaultPerc	();

    B_FullStop		(self);
    
	AI_SetWalkmode	(self, NPC_WALK);

	if ( !Npc_IsOnFP(self, "FP_ORC_GUARD") )
	{
		AI_GotoWP	(self, self.wp); 
	};
	
};

func void ZS_Orc_Guard_Loop()
{
    PrintDebugNpc	(PD_ZS_FRAME, "ZS_Orc_Guard_Loop" );

	B_GotoFP		(self, "FP_ORC_GUARD");
	AI_AlignToFP	(self);

	AI_Wait			(self, 1);
};

func void ZS_Orc_Guard_End()
{
	PrintDebugNpc	(PD_TA_FRAME, "ZS_Orc_Guard_End" );

	Npc_ClearAIQueue(self);
};

//#######################################################
//		ZS_Orc_SitOnFloor
//#######################################################
func void ZS_Orc_SitOnFloor()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Orc_SitOnFloor");


	Npc_ClearAIQueue( self );

	//wenn Ork nicht sitzt, gehe zu TA-Start	
	if ( Npc_GetBodyState( self ) != BS_SIT )
	{
		PrintDebugNpc(PD_ZS_FRAME,"ZS_Orc_SitOnFloor: sitzt nicht....");
		AI_SetWalkmode( self, NPC_WALK);		// Walkmode für den Zustand
		if ( !Npc_IsOnFP( self, "FP_ORC_SIT" ) )
		{
			AI_GotoWP( self, self.wp );		// Gehe zum Tagesablaufstart
		};

		if ( Wld_IsFPAvailable( self, "FP_ORC_SIT_A_") )
		{
			AI_GotoFP( self, "FP_ORC_SIT_A_" );
		}
		else if ( Wld_IsFPAvailable( self, "FP_ORC_SIT_B_" ) )
		{
			AI_GotoFP( self, "FP_ORC_SIT_B_" );
		}
		else if ( Wld_IsFPAvailable( self, "FP_ORC_SIT" ) )
		{
			AI_GotoFP( self, "FP_ORC_SIT" );
		};
		
		//wenn angekommen, hinsetzen!
		AI_PlayAniBS( self, "T_STAND_2_GUARDSIT", BS_SIT );
	};
	
	OrcDefaultPerc();
};

func void ZS_Orc_SitOnFloor_Loop()
{
    PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_SitOnFloor_Loop" );
    
	if ( Npc_GetBodyState( self ) == BS_SIT )
	{
		// hier koennten Anis eingesetzt werden.....
	};
};

func void ZS_Orc_SitOnFloor_End ()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Orc_SitOnFloor_End");	
	Npc_ClearAIQueue( self );
	AI_PlayAniBS ( self, "T_GUARDSIT_2_STAND", BS_STAND );
};


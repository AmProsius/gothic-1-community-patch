// Der Spieler wird von Xardas zum versunkenen Turm geschickt.
// Dort findet er die eine Teleportationsrune in das Alte Lager hinein.
func void B_Story_ExploreSunkenTower ()
{
	//-------- Schlüssel für versunkenen Turm --------
	CreateInvItem		(hero,	ItKe_SunkenTower);

	//-------- Tagebucheinträge --------
	B_LogEntry			(CH5_Uriziel,"While Xardas is busy creating a magic formula to transfer the energy to URIZIEL, I'll make my way to the Necromancer's sunken tower to find additional artifacts for the fight against the Sleeper.");

	// ************************************************	
	// Neue TAs für NPCs des inneren Ringes
	// ************************************************		
	var C_NPC Bartholo	; Bartholo 	= Hlp_GetNpc (EBR_106_Bartholo	);
	var C_NPC Skip		; Skip 		= Hlp_GetNpc (GRD_211_Skip		);
	var C_NPC Bullit	; Bullit 	= Hlp_GetNpc (GRD_203_Bullit 	);
	var C_NPC Stone		; Stone 	= Hlp_GetNpc (GRD_219_Stone 	);
	var C_NPC Gomez		; Gomez 	= Hlp_GetNpc (EBR_100_Gomez 	);
	var C_NPC Scorpio	; Scorpio 	= Hlp_GetNpc (GRD_205_Scorpio	);
	var C_NPC Cutter	; Cutter 	= Hlp_GetNpc (GRD_208_Cutter 	);
	var C_NPC Grd_220	; Grd_220 	= Hlp_GetNpc (GRD_220_Gardist	);
	var C_NPC Grd_221	; Grd_221 	= Hlp_GetNpc (GRD_221_Gardist	);
	var C_NPC Grd_222	; Grd_222 	= Hlp_GetNpc (GRD_222_Gardist	);
	var C_NPC Grd_223	; Grd_223 	= Hlp_GetNpc (GRD_223_Gardist	);
	var C_NPC Grd_239	; Grd_239	= Hlp_GetNpc (GRD_239_Gardist	);
	var C_NPC Grd_245	; Grd_245 	= Hlp_GetNpc (GRD_245_Gardist	);
	var C_NPC Raven		; Raven	 	= Hlp_GetNpc (EBR_105_Raven 	);
	var C_NPC Scar		; Scar	 	= Hlp_GetNpc (EBR_101_Scar 		);
	var C_NPC Arto		; Arto 		= Hlp_GetNpc (EBR_102_Arto 		);
	var	C_NPC Thorus	; Thorus	= Hlp_GetNpc (GRD_200_Thorus	);

	Npc_ExchangeRoutine		(Gomez		,"OT"); 
	Npc_ExchangeRoutine		(Bartholo	,"OT"); 
	Npc_ExchangeRoutine		(Arto		,"OT"); 
	Npc_ExchangeRoutine		(Scar		,"OT"); 
	Npc_ExchangeRoutine		(Raven		,"OT"); 
	Npc_ExchangeRoutine		(Bullit		,"OT"); 
	Npc_ExchangeRoutine		(Scorpio	,"OT"); 
	Npc_ExchangeRoutine		(Cutter		,"OT"); 	
	Npc_ExchangeRoutine		(Skip		,"OT"); 	
	Npc_ExchangeRoutine		(Stone		,"OT"); 	
	Npc_ExchangeRoutine		(Grd_220	,"OT"); 	
	Npc_ExchangeRoutine		(Grd_221	,"OT"); 
	Npc_ExchangeRoutine		(Grd_222	,"OT"); 
	Npc_ExchangeRoutine		(Grd_223	,"OT"); 
	Npc_ExchangeRoutine		(Grd_239	,"OT"); 
	Npc_ExchangeRoutine		(Grd_245	,"OT"); 

	// Gilden Änderung, damit SC nicht angegriffen wird
	Stone.guild 	= GIL_NONE;		Npc_SetTrueGuild	(Stone, 	GIL_NONE);	
	Skip.guild 		= GIL_NONE;		Npc_SetTrueGuild	(Skip, 		GIL_NONE);	
	Bullit.guild 	= GIL_NONE;		Npc_SetTrueGuild	(Bullit,	GIL_NONE);	
	Bartholo.guild 	= GIL_NONE;		Npc_SetTrueGuild	(Bartholo,	GIL_NONE);	
	Gomez.guild 	= GIL_NONE;		Npc_SetTrueGuild	(Gomez, 	GIL_NONE);	
	
	// Attitüde Änderung
	Npc_SetPermAttitude	(Stone,		ATT_NEUTRAL);	Npc_SetTempAttitude	(Stone,		ATT_NEUTRAL);
	Npc_SetPermAttitude	(Skip,		ATT_NEUTRAL);	Npc_SetTempAttitude	(Skip,		ATT_NEUTRAL); 	         	
	Npc_SetPermAttitude	(Bullit,	ATT_NEUTRAL);	Npc_SetTempAttitude	(Bullit,	ATT_NEUTRAL); 	         	
	Npc_SetPermAttitude	(Bartholo,	ATT_NEUTRAL);	Npc_SetTempAttitude	(Bartholo,	ATT_NEUTRAL); 	         	
	Npc_SetPermAttitude	(Gomez,		ATT_NEUTRAL);	Npc_SetTempAttitude	(Gomez,		ATT_NEUTRAL); 	         	
	 
	//-------- Immortals löschen --------
	Thorus.flags	= 0;
	Gomez.flags 	= 0;
	Bartholo.flags = 0;
	
	// Schlüssel um die Tür zum Kerker zu öffnen
	CreateInvItem ( Gomez, DungeonKey );
    
	//-------- globale Variable --------
	ExploreSunkenTower = TRUE;
};


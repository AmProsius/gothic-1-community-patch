// **************
// Kapitelwechsel
// **************

FUNC VOID B_Kapitelwechsel (VAR INT neues_Kapitel)
{
	Kapitel = neues_Kapitel;

	//***************************************************************************
	//	KAPITEL 1
	//***************************************************************************
	if		(neues_Kapitel == 1)
	{
		PrintDebugNpc	(PD_MISSION, "---=== DAS ERSTES KAPITEL ===---");
		B_Give_SkipChapter2Weapons ();
		
		introducechapter ("Kapitel 1","Die Welt der Verurteilten","chapter1.tga","levelup.wav", 6000);
		//introducechapter ("Chapter 1","Welcome to the colony","chapter1.tga","levelup.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 2
	//***************************************************************************
	else if	(neues_Kapitel == 2)
	{
		PrintDebugNpc	(PD_MISSION, "---=== DAS ZWEITE KAPITEL ===---");

		//-------- H�ndler auff�llen --------
		B_Give_FiskChapter2Weapons ();
		B_Give_DarrionChapter2Weapons ();
		B_Give_SharkyChapter2Weapons ();
		B_Give_BaalCadarChapter2Runes ();
		B_Give_TorrezChapter2Runes ();
		B_Give_CronosChapter2Runes ();
		B_GiveRiordianChapter2Potions ();
		B_Give_CavalornChapter2Weapons();
		B_Give_WolfChapter2Weapons();
		B_Give_SkipChapter2Weapons ();
	
		//-------- Oberwelt-Monster nochmal "nachf�llen" --------	
		B_Story_RespawnOW();
		
		//-------- InExtremo vorbereiten --------
		B_InsertInExtremo();
		
		introducechapter ("Kapitel 2","Das Nest der Minecrawler","chapter2.tga","levelup.wav", 6000);
		//introducechapter ("Chapter 2","The Minecrawler's nest","chapter2.tga","levelup.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 3
	//***************************************************************************
	else if (neues_Kapitel == 3)
	{
		PrintDebugNpc	(PD_MISSION, "---=== DAS DRITTE KAPITEL ===---");

		//-------- InExtremo wegr�umen --------
		B_InExtremoStopMusic();	
		B_KillInExtremo();

		//-------- Kapitel 2 Missionen nochmal auf Success setzen --------	
		YBerion_BringFocus 		= LOG_SUCCESS;
		CorKalom_BringMCQBalls 	= LOG_SUCCESS;
		CorKalom_BringBook 		= LOG_SUCCESS;

		//-------- Oberwelt-Monster nochmal "nachf�llen" --------	
		//B_Story_RespawnOW();
		
		//-------- Waffenh�ndler auffrischen --------
		B_Give_FiskChapter3Weapons ();
		B_Give_DarrionChapter3Weapons ();
		B_Give_SharkyChapter3Weapons ();
		B_Give_BaalCadarChapter3Runes ();
		B_Give_TorrezChapter3Runes ();
		B_Give_TorrezChapter3Runes ();
		B_Give_CronosChapter3Runes ();
		B_GiveRiordianChapter3Potions ();
		B_Give_CavalornChapter3Weapons();
		B_Give_WolfChapter3Weapons ();
		B_Give_SkipChapter3Weapons ();
		//-------- Video abspielen --------
		PlayVideo		("GREATPRAYER.BIK");

		//-------- Y'Berion ins Koma fallen lassen --------
		var C_NPC YBerion;
		YBerion = Hlp_GetNpc(Gur_1200_YBerion);
		YBerion.flags = 0;					// IMMORTAL-Flag l�schen
		Npc_ChangeAttribute	(YBerion, ATR_HITPOINTS, -YBerion.attribute[ATR_HITPOINTS_MAX]+1);
		YBerion.flags = NPC_FLAG_IMMORTAL;	// IMMORTAL-Flag wieder setzen
		Npc_ExchangeRoutine (YBerion,	"DRAINED");
		AI_ContinueRoutine	(YBerion);
		
		//---GROSSE BESCHW�RUNG TRIGGER NPCS ----------------------- M.F.
		//---HIER WERDEN DIE IN DEN TRIGGERINFOS GESETZTEN WAHRNEHMUNGEN WIEDER DEFAULT GESETZT--- M.F.
		var C_NPC Templer;		Templer	 	 = Hlp_GetNpc	(TPL_1431_Templer);
		Templer.senses =		hero.senses; 
		
		var C_NPC Templer_1;	Templer_1	 	 = Hlp_GetNpc	(TPL_1430_Templer);
		Templer_1.senses =		hero.senses;
		
		var C_NPC Novize;		Novize	     = Hlp_GetNpc	(NOV_1319_Novize);
		Novize.senses =			hero.senses;
		
		var C_NPC Novize_1;		Novize_1	 	 = Hlp_GetNpc	(NOV_1319_Novize);
		Novize_1.senses =		hero.senses;
		
		introducechapter ("Kapitel 3","Artefakte von uralter Macht","chapter3.tga","levelup.wav", 6000);
		//introducechapter ("Chapter 3","Artifacts of ancient power","chapter3.tga","levelup.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 4
	//***************************************************************************
	else if (neues_Kapitel == 4)
	{
		PrintDebugNpc	(PD_MISSION, "---=== DAS VIERTE KAPITEL ===---");

		 
		B_ExchangeRoutine (GRD_205_Scorpio,"BANNISHED");
		B_ChangeGuild    (GRD_205_Scorpio,GIL_NONE);  
		B_SetPermAttitude	(GRD_205_Scorpio,	ATT_NEUTRAL);
		
		
		B_ChangeGuild    (STT_336_Cavalorn,GIL_NONE);

		//-------- Waffenh�ndler auffrischen --------
		B_Give_ScorpioChapter4Weapons ();
		B_Give_DarrionChapter4Weapons ();
		B_Give_SharkyChapter4Weapons ();
		B_Give_BaalCadarChapter4Runes ();
		B_Give_XardasChapter4Runes ();
		B_Give_CronosChapter4Runes ();
		B_GiveRiordianChapter4Potions ();
		B_Give_CavalornChapter4Weapons();
		B_Give_WolfChapter4Weapons();	
		//-------- globale Variablen --------
		Saturas_BringFoci = 5;

		//-------- Missionsgegenst�nde --------
		CreateInvItem		(hero,	ItArRuneTeleport2);

		//-------- Tagebucheintr�ge --------
		Log_CreateTopic		(CH4_Firemages,	LOG_MISSION);
		Log_SetTopicStatus	(CH4_Firemages,	LOG_RUNNING);
		B_LogEntry			(CH4_Firemages,"Saturas, the leader of the Magicians of Water, has demanded a last favor of me. To blow up the ore mound he requires the aid of the Magicians of Fire in the Old Camp. I don't know how I can persuade Gomez' magicians to take part in a plan which will destroy the foundation of their powers, but I'll think of something.");

		//-------- Szene am Damm --------
		B_ExchangeRoutine	(SLD_700_LEE,"DAMNPAST"); 
		B_ExchangeRoutine	(BAU_935_HOMER,"DAMNPAST"); 
		
		//-------- Spielergilde �ndern --------
		oldHeroGuild = Npc_GetTrueGuild(hero);
		if	C_NpcBelongsToOldCamp(hero)
		{
			Npc_SetTrueGuild(hero,	GIL_NONE);		// "Ausgesto�ener" aus dem Alten Lager
			hero.guild = GIL_NONE;
		};
		
		//-------- AL-Tore schlie�en --------
		B_ExchangeRoutine	(GRD_228_Gardist, "FMTaken");	//Hinteres Tor
		B_ExchangeRoutine	(GRD_230_Gardist, "FMTaken");	//Haupttor
		B_ExchangeRoutine	(GRD_280_Gardist, "FMTaken");	//Inneres Tor
			
		//-------- Windenwachen verwundbar machen --------
		B_ClearImmortal		(Grd_228_Gardist);				//Hinteres Tor     
		B_ClearImmortal		(Grd_230_Gardist);              //Haupttor    
		B_ClearImmortal		(Grd_280_Gardist);              //Inneres Tor 

		//-------- Feuermagier t�ten --------
		B_KillNpc			(Kdf_400_Rodriguez);	
		B_KillNpc			(Kdf_401_Damarok);	
		B_KillNpc			(Kdf_402_Corristo);	
		B_KillNpc			(Kdf_403_Drago);	
		B_KillNpc			(Kdf_405_Torrez);

		//-------- G�ste im Alten Lager t�ten --------
		B_KillNpc			(Nov_1330_BaalParvez);
		B_KillNpc			(Nov_1331_BaalTaran);
		B_KillNpc			(Tpl_1422_GorHanis);
		B_KillNpc			(Sld_729_Kharim);

		//-------- TAs von Diego und Milten �ndern --------
		B_ExchangeRoutine	(PC_Thief,	"OCWait");
		B_ExchangeRoutine	(PC_Mage,	"OCWait");
		B_ChangeGuild		(PC_Thief,	GIL_KDF);		// "Ausgesto�ener" aus dem Alten Lager
		B_SetPermAttitude	(PC_Thief,	ATT_FRIENDLY);
		B_SetPermAttitude	(PC_Mage,	ATT_FRIENDLY);
		
		//-------- permanente Attit�den �ndern --------
		Wld_ExchangeGuildAttitudes	("GIL_ATTITUDES_FMTAKEN");
		B_InitMonsterAttitudes		();

		//-------- Kampfgruppe vor Haupttor --------
		B_ExchangeRoutine	(GRD_255_Fletcher,	"FMTaken");	// Verst�rkung vor das Haupttor (Anf�hrer)
		B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken");	// Verst�rkung vor das Haupttor
		B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken");	// Verst�rkung vor das Haupttor
		B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken");	// Verst�rkung vor das Haupttor (Fernk�mpfer)
		B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken");	// regul�re Wache am Haupttor
		B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken");	// regul�re Wache am Haupttor

		//-------- Kampfgruppe vor Hinterem Tor --------
		B_ExchangeRoutine	(GRD_233_Bloodwyn,	"FMTaken");	// Verst�rkung vor das Hinterem Tor (Anf�hrer)
		B_ExchangeRoutine	(GRD_232_Gardist,	"FMTaken");	// Verst�rkung vor das Hinterem Tor
		B_ExchangeRoutine	(GRD_229_Gardist,	"FMTaken");	// Verst�rkung vor das Hinterem Tor (Fernk�mpfer)
		B_ExchangeRoutine	(GRD_216_Torwache,	"FMTaken");	// regul�re Wache am Hinteren Tor
		B_ExchangeRoutine	(GRD_217_Torwache,	"FMTaken");	// regul�re Wache am Hinteren Tor
		
		//------------ Die Templer gehen nicht mehr zur Alten Mine ---------------------
		
		B_ExchangeRoutine	(TPL_1439_GorNaDrak,	"FMTaken");
		B_ExchangeRoutine	(TPL_1440_Templer,	"FMTaken");
		
		//--------------- Kapitel 4 wird angezeigt -------------------------------
		
		introducechapter ("Kapitel 4","Xardas","chapter4.tga","levelup.wav", 6000); 
		//introducechapter ("Chapter 4","Xardas","chapter4.tga","levelup.wav", 6000); 
	}
	
	//***************************************************************************
	//	KAPITEL 5
	//***************************************************************************
	else if (neues_Kapitel == 5)
	{
		PrintDebugNpc	(PD_MISSION, "---=== DAS F�NFTE KAPITEL ===---");

		//-------- H�ndler auff�llen --------
		B_Give_ScorpioChapter5Weapons ();
		B_Give_DarrionChapter5Weapons ();
		B_Give_SharkyChapter5Weapons ();
		B_Give_XardasChapter5Runes ();
		B_Give_CavalornChapter5Weapons();
		B_Give_WolfChapter5Weapons();
		B_Give_CronosChapter5Runes ();
		B_GiveRiordianChapter5Potions ();
		
		B_Give_ScorpioChapter6Weapons ();
		B_Give_DarrionChapter6Weapons ();
		B_Give_SharkyChapter6Weapons ();
		B_Give_XardasChapter6Runes ();
		B_GiveRiordianChapter6Potions ();
		B_Give_CavalornChapter6Weapons ();
		B_Give_WolfChapter6Weapons();		

		//-------- Tagebucheintr�ge --------
		B_LogEntry		(CH4_EnterTemple,	"Gorn war wenig zuversichtlich, da� mir das ULU-MULU in der Orkstadt viel helfen w�rde. Was solls, ich werde es sehr bald herausgefunden haben... so oder so!");

		//-------- Oberwelt-Monster nochmal "nachf�llen" --------	
		B_Story_RespawnOW();
		
		introducechapter ("Kapitel 5","Die H�ter des Portals","chapter5.tga","levelup.wav", 6000);
		//introducechapter ("Chapter 5","The custodians of the portal","chapter5.tga","levelup.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 6
	//***************************************************************************
	else if (neues_Kapitel == 6)
	{
		PrintDebugNpc	(PD_MISSION, "---=== DAS SECHSTE KAPITEL ===---");

		//-------- H�ndler auff�llen --------
		B_Give_XardasChapter6Runes ();

		//-------- URIZIEL aufladen --------
		PlayVideo		("OREHEAP.BIK");	// Schwert aufladen
		CreateInvItem 	(hero, Mythrilklinge02);	
		
		introducechapter ("Kapitel 6","Die Hallen des Schl�fers","chapter6.tga","levelup.wav", 6000);
		//introducechapter ("Chapter 6","The sleeper's halls","chapter6.tga","levelup.wav", 6000);
	};
};

func int C_IsChapter(var int chapter)
{
	if (Kapitel == chapter)
	{
		return TRUE;
	};
};

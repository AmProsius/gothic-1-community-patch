//////////////////////////////////////////////////////////////////////////
//	ZS_Position
//	===========
//	Dieser TA-Zustand wartet am im TA angegebenen Waypoint beharrlich
//	darauf, da� der Spieler ihn anredet. �ber Infos/Missions dieses
//	NSCs geht dann die Handlung weiter. Meistens geht es in den 
//	Zustand ZS_FollowMode.
//	
//	NSC reagiert au�erdem auf:
//	- angegriffen werden	->	ein "entsch�rfter" Kampf
//	- bezaubert werden		-> 	n�tig f�r das korrekte Funktionieren
//								des Magiesystems (-> Opfer-Zust�nde...)
//	- gerufen werden		->	winkt SC zu sich heraun
//////////////////////////////////////////////////////////////////////////
func void ZS_Position ()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"ZS_Position");	

	C_ZSInit();
	
	Npc_SetPercTime (self,1);

	Npc_PercEnable		(self, 	PERC_ASSESSDAMAGE		,	B_FriendlyAttack	);
	Npc_PercEnable  	(self,	PERC_ASSESSMAGIC		,	B_AssessMagic		);			
	Npc_PercEnable  	(self, 	PERC_ASSESSCASTER		,	B_AssessCaster 		);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHREAT		,	B_AssessFighter		);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder		);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat		);
	Npc_PercEnable  	(self,	PERC_DRAWWEAPON			, 	B_AssessFighter		);		
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable  	(self, 	PERC_CATCHTHIEF			,	ZS_CatchThief 		);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHEFT		,	B_AssessTheft 		);
	Npc_PercEnable		(self, 	PERC_ASSESSTALK			,	B_AssessTalk				);
	Npc_PercEnable		(self,  PERC_ASSESSPLAYER		,   B_AssessSC);
	
	AI_SetWalkmode		(self,	NPC_WALK);							// Walkmode f�r den Zustand
	AI_GotoWP			(self,	self.wp);							// Gehe zum Tagesablaufstart
	AI_AlignToWP 		(self);										// Richte Dich aus
};

func void ZS_Position_Loop ()
{
	PrintDebugNpc		(PD_ZS_LOOP,	"ZS_Position_Loop");	
 	//PrintGlobals		(PD_ZS_CHECK);

    AI_Wait				(self,	1);
	B_SmartTurnToNpc	(self,	hero);
};

func void ZS_Position_End ()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"ZS_Position_End");	
};

//////////////////////////////////////////////////////////////////////////
//	B_FriendlyAssessCall
//	====================
//	Spielt einfach eine Heranwink-Animation ab.
//////////////////////////////////////////////////////////////////////////
func void B_FriendlyAssessCall ()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"B_FriendlyAssessCall");		

	AI_TurnToNpc		(self,	other);
	AI_PlayAni			(self,	"T_COMEOVERHERE");
};

//////////////////////////////////////////////////////////////////////////
//	B_FriendlyAttack
//	================
//	Sorgt daf�r, da� ohne Umschweife sofort in den ZS_FriendlyAttack
//	gesprungen wird.
//////////////////////////////////////////////////////////////////////////
func void B_FriendlyAttack ()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"B_FriendlyAttack");		
	B_FullStop 			(self);
	Npc_SetTarget		(self,	other);
	AI_StartState		(self,	ZS_FriendlyAttack,	0,	"");
};

//////////////////////////////////////////////////////////////////////////
//	ZS_FriendlyAttack
//	=================
//	Dies ist ein "entsch�rfter" ZS_Attack, der davon ausgeht, da� der
//	NSC gerade wichtig f�r die Fortf�hrung der Spielhandlung ist und
//	grunds�tzlich an Kampf nicht interessiert ist.
//
//	Der Kampf folgt folgenden Regeln:
//	-	NSC wird den SC so schnell wie m�glich bewu�tlos schlagen,
//		nie aber t�ten
//	- 	Hat der NSC den SC bewu�tlos geschlagen, wird er ihn NICHT
//		pl�ndern
//	-	Steckt der Spieler im Kampf die Waffe weg, wird auch der NSC
//		den Kampf beenden
//	- 	L�uft der Spieler weg, wird der NSC keine Verfolgung aufnehmen,
//		sondern den Kampf sehr schnell beenden. -> ZS_Position
//	-	Der NSC wird NIE fliehen
//////////////////////////////////////////////////////////////////////////
func void ZS_FriendlyAttack ()
{	
	PrintDebugNpc		(PD_ZS_FRAME,	"ZS_FriendlyAttack");		
	C_ZSInit			();

	Npc_PercEnable  	(self,	PERC_ASSESSMAGIC		,	B_AssessMagic		 			);			
	Npc_PercEnable  	(self,	PERC_ASSESSREMOVEWEAPON	,	B_FriendlyAttackRemoveWeapon	);			

	Npc_GetTarget		(self);
	B_DrawWeapon		(self,	other);
	C_LookAtNpc			(self,	other);
};

func int ZS_FriendlyAttack_Loop()
{
	PrintDebugNpc		(PD_ZS_LOOP,	"ZS_FriendlyAttack_Loop");		

	Npc_GetTarget		(self);
	
	//-------- Ist SC bereits bewu�tlos ? --------
	if (Npc_IsInState	(other, ZS_Unconscious)) 
	{
		PrintGlobals	(PD_ZS_CHECK);
		B_Say			(self,	other,	"$LETSFORGETOURLITTLEFIGHT" );		 
		return			1;											// Loop abbrechen
	};
	

	//-------- Anschmei�en der FAI f�r diesen Frame --------
	//PrintGlobals		(PD_ZS_CHECK);
	Npc_GetNextTarget	(self);
	//PrintDebugNpc		(PD_ZS_CHECK,	"...Npc_GetNextTarget() done!");
	//PrintGlobals		(PD_ZS_CHECK);
	AI_Attack			(self);
	//PrintDebugNpc		(PD_ZS_CHECK,	"...AI_Attack() done!");
	//PrintGlobals		(PD_ZS_CHECK);
	Npc_GetTarget		(self);
	//PrintDebugNpc		(PD_ZS_CHECK,	"...Npc_GetTarget() done!");
	//PrintGlobals		(PD_ZS_CHECK);
			
	//-------- Sinn der Abfrage unklar! Wird noch gecheckt --------
	if (!Hlp_IsValidNpc	(other)) 
	{
		PrintDebugNpc	(PD_ZS_FRAME,	"...'other' invalid");		
		return 			1;											// Loop abbrechen
	};

	//-------- L�uft SC weg ? --------
	if (Npc_GetDistToNpc(self, other ) > 1000)
	{
		PrintDebugNpc	(PD_ZS_FRAME,	"...SC weiter als 10m entfernt!");		
		if (Npc_IsInFightMode(other, FMODE_FAR ) || Npc_IsInFightMode(other, FMODE_MAGIC))
		{								
			PrintDebugNpc(PD_ZS_FRAME,	"...SC hat Fernkampfwaffe oder Magie!");		
			AI_SetWalkmode(self, NPC_RUN);
			AI_GotoNpc	(self,other);
		}
		else
		{
			PrintDebugNpc(PD_ZS_FRAME,	"...SC hat Nahkampfwaffe");		
			B_Say		(self,	other,	"$LETSFORGETOURLITTLEFIGHT");		 
			return		1;											// Loop abbrechen
		};
	};

	//-------- hat der SC die Waffe wieder weggesteckt ? --------
	if (Npc_IsInFightMode(other, FMODE_NONE))
	{
		PrintDebugNpc	(PD_ZS_FRAME,	"...SC hat keine Waffe mehr in der Hand!");		
		B_Say			(self,	other,	"$LETSFORGETOURLITTLEFIGHT");		 
		return			1;											// Loop abbrechen
	};
	
	return 0;
};

func void ZS_FriendlyAttack_End()
{	
	PrintDebugNpc		(PD_ZS_FRAME,	"ZS_FriendlyAttack_End");		
	C_StopLookAt		(self);
	AI_RemoveWeapon		(self);
};

//////////////////////////////////////////////////////////////////////////
//	B_FriendlyAttackRemoveWeapon
//	============================
//	Bricht den Kampf ab.
//////////////////////////////////////////////////////////////////////////
func void B_FriendlyAttackRemoveWeapon ()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"B_FriendlyAttackRemoveWeapon");		
	Npc_ClearAIQueue	(self);
	AI_StandUp 			(self);	
	B_Say				(self,	other,	"$LETSFORGETOURLITTLEFIGHT");		 
	AI_ContinueRoutine	(self);
};

//////////////////////////////////////////////////////////////////////////
//	ZS_FollowMode
//	=============
//	Der NSC bewegt sich zu dem im TA angegebenen Waypoint, wartet dabei
//	aber auf den Spieler, falls dieser zu weit entfernt ist.
//
//	NSC reagiert au�erdem auf:
//	- angegriffen werden	->	ein "entsch�rfter" Kampf
//	- bezaubert werden		-> 	n�tig f�r das korrekte Funktionieren
//								des Magiesystems (-> Opfer-Zust�nde...)
//	- gerufen werden		->	winkt SC zu sich heraun
//	- angesprochen werden	->	winkt SC ebenfalls nur zu sich heran
//
//	WICHTIG:	Der NSC der diesen FollowMode bekommt mu� SENSE_SMELL
//				verpa�t bekommen, da er sonst den zur�ckbleibenden
//				Spieler in seinem R�cken nicht erkennt
//
//	B_FollowMode
//	============
//	Wird au den Missionsscripten i.V.m. einem eignen ZS aufgerufen
//	(vgl. Sit_1_OW_Diego_Gamestart.d)
//
//////////////////////////////////////////////////////////////////////////
func void B_FollowMode ()
{
	Npc_PercEnable		(self, 	PERC_ASSESSPLAYER		,	B_CheckDistToPlayer	);	// ...die Entfernung zum Spieler checken
	Npc_PercEnable		(self, 	PERC_ASSESSDAMAGE		,	B_FriendlyAttack	);
	Npc_PercEnable  	(self,	PERC_ASSESSMAGIC		,	B_AssessMagic		);			
	Npc_PercEnable  	(self, 	PERC_ASSESSCASTER		,	B_AssessCaster 		);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHREAT		,	B_AssessFighter		);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder		);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat		);
	Npc_PercEnable  	(self,	PERC_DRAWWEAPON			, 	B_AssessFighter		);		
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable  	(self, 	PERC_CATCHTHIEF			,	ZS_CatchThief 		);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHEFT		,	B_AssessTheft 		);
	Npc_PercEnable		(self, 	PERC_ASSESSTALK			,	B_AssessTalk				); 
	Npc_PercEnable		(self, 	PERC_ASSESSCALL			,	B_FriendlyAssessCall);
	Npc_SetPercTime		(self,	1);												// 1mal pro Sekunde...

	AI_SetWalkmode  	(self, 	NPC_RUN);
	AI_GotoWP			(self, 	self.wp);
};

func void ZS_FollowMode ()
{
	PrintDebugNpc 		(PD_ZS_FRAME,"ZS_FollowMode");
	B_FollowMode ();
};

//////////////////////////////////////////////////////////////////////////
//	B_CheckDistToPlayer
//	===================
//	�berpr�ft innerhalb der ZS_Followmode regelm��ig die Entfernung zum
//	Spieler und schaltet bei �berschreiten der Maximaldistanz den Zustand.
//	ZS_FollowModeWait ein.
//////////////////////////////////////////////////////////////////////////
func void B_CheckDistToPlayer ()
{
	PrintDebugNpc 		(PD_ZS_FRAME,"B_CheckDistToPlayer");

	if (Hlp_StrCmp (Npc_GetNearestWP(self), self.WP))
	{
		// Hier ist der NPC angekommen - keine Reaktion erw�nscht
	}
	else if (Npc_GetDistToNpc(self,	other) > PERC_DIST_INTERMEDIAT)
	{
		PrintDebugNpc 	(PD_ZS_CHECK,"...SC zu weit weg!");
		Npc_ClearAIQueue(self);
		AI_StandUp		(self);
		AI_TurnToNpc 	(self,	other);
		B_Say 			(self,	other,	"$CATCHUP");
		AI_StartState 	(self,	ZS_FollowModeWait,	1,	"");
	};		
};


//////////////////////////////////////////////////////////////////////////
//	ZS_FollowModeWait
//	=================
//	Wird aus ZS_FollowMode heraus aufgerufen, wenn der SC sich zu weit
//	vom zu begleitenden NSC entfernt (SC bleibt zur�ck oder sprintet
//	voraus).
//
//	NSC reagiert au�erdem auf:
//	- angegriffen werden	->	ein "entsch�rfter" Kampf
//	- bezaubert werden		-> 	n�tig f�r das korrekte Funktionieren
//								des Magiesystems (-> Opfer-Zust�nde...)
//////////////////////////////////////////////////////////////////////////
func void ZS_FollowModeWait	()
{
	PrintDebugNpc 		(PD_ZS_CHECK,	"ZS_FollowModeWait");

	C_ZSInit			();

	Npc_PercEnable		(self, 	PERC_ASSESSPLAYER		,	B_CheckDistToPlayer	);	// ...die Entfernung zum Spieler checken
	Npc_PercEnable		(self, 	PERC_ASSESSDAMAGE		,	B_FriendlyAttack	);
	Npc_PercEnable  	(self,	PERC_ASSESSMAGIC		,	B_AssessMagic		);			
	Npc_PercEnable  	(self, 	PERC_ASSESSCASTER		,	B_AssessCaster	 	);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHREAT		,	B_AssessFighter		);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder		);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat		);
	Npc_PercEnable  	(self,	PERC_DRAWWEAPON			, 	B_AssessFighter		);		
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable  	(self, 	PERC_CATCHTHIEF			,	ZS_CatchThief 		);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHEFT		,	B_AssessTheft 		);
	Npc_PercEnable		(self, 	PERC_ASSESSTALK			,	B_AssessTalk				); 
	Npc_PercEnable		(self, 	PERC_ASSESSCALL			,	B_FriendlyAssessCall);
};

func void ZS_FollowModeWait_Loop ()
{
	PrintDebugNpc 		(PD_ZS_LOOP,	"ZS_FollowModeWait_Loop");

	if (Npc_GetDistToNpc(self,	other) < 700)
	{
		AI_ContinueRoutine(self);
	};
};

func void ZS_FollowModeWait_End ()
{
	PrintDebugNpc 		(PD_ZS_CHECK,	"ZS_FollowModeWait_End");
};
	




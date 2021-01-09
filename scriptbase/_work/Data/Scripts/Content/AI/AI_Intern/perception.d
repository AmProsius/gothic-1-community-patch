// *************************************
// NSC - Wahrnehmungsreichweiten
// *************************************
// SN: Demnächst wird diese Tabelle mit der HAI_...-Tabelle aus AI_CONSTANTS.D zusammengefaßt!
CONST INT PERC_DIST_CLOSE		=	100;
CONST INT PERC_DIST_FLEE		=	300;
CONST INT PERC_DIST_DIALOG		=	500;
const int PERC_DIST_WATCHFIGHT  =   600;
const INT PERC_DIST_INTERMEDIAT	=	1000;
CONST INT PERC_DIST_MAX			=	2000;

func void B_SETCUTSCENEPERCEPTIONS()
{
 	PrintDebugNpc		(PD_ZS_CHECK,self.name);
 	PrintDebugNpc		(PD_ZS_CHECK,"CutscenePerceptions");

 	Npc_PercEnable   	(self,	PERC_ASSESSMAGIC  	,	B_AssessMagic    		);
	Npc_PercEnable   	(self,	PERC_ASSESSTHREAT  	,	B_AssessFighter    	  	);
 	Npc_PercEnable   	(self,  PERC_ASSESSTHEFT  	,	B_AssessTheft     	 	);
                                                                                
 	Npc_PercEnable   	(self, 	PERC_DRAWWEAPON   	,	B_AssessFighter		    );
                                                                                
 	Npc_PercEnable   	(self,  PERC_ASSESSTALK   	,	B_AssessTalk      	 	);
 	Npc_PercEnable   	(self, 	PERC_ASSESSDAMAGE 	,	ZS_ReactToDamage   	  	);
 	Npc_PercEnable   	(self, 	PERC_CATCHTHIEF   	,	ZS_CatchThief    		);
};

// etc. 

// Hier werden die Reichweiten der Wahrnehmungen eingestellt.
// Nur passive machen Sinn, da die Reichweite der aktiven 
// durch den senses_range Wert festgelegt ist.
FUNC VOID InitPerceptions()
{
	Perc_SetRange		(PERC_ASSESSMURDER		, HAI_DIST_RANGED 				);
	Perc_SetRange		(PERC_ASSESSDEFEAT		, HAI_DIST_RANGED				);
	Perc_SetRange		(PERC_ASSESSDAMAGE		, PERC_DIST_FLEE				);
	Perc_SetRange		(PERC_ASSESSOTHERSDAMAGE, PERC_DIST_INTERMEDIAT			);	//SN: Wird von der Menschen-AI nicht verwendet!
	Perc_SetRange		(PERC_ASSESSTHREAT		, HAI_DIST_RANGED				);
	Perc_SetRange		(PERC_ASSESSREMOVEWEAPON, PERC_DIST_MAX					);
	Perc_SetRange		(PERC_OBSERVEINTRUDER	, HAI_DIST_OBSERVEINTRUDER		);
	Perc_SetRange		(PERC_ASSESSFIGHTSOUND	, HAI_DIST_HELPATTACKEDCHARGES	);	//SN: siehe AI_CONSTANTS.D  	
	Perc_SetRange		(PERC_ASSESSQUIETSOUND	, PERC_DIST_INTERMEDIAT 		);	//MH: geändert, 500 macht NSCs/Monster zu schwach
	Perc_SetRange		(PERC_ASSESSWARN		, 3000							); 
	Perc_SetRange		(PERC_CATCHTHIEF		, HAI_DIST_CATCHTHIEF			);
	Perc_SetRange		(PERC_ASSESSTHEFT		, HAI_DIST_ASSESSTHEFT			);
	Perc_SetRange		(PERC_ASSESSCALL		, PERC_DIST_INTERMEDIAT			);
	Perc_SetRange		(PERC_ASSESSTALK		, PERC_DIST_DIALOG				);
	Perc_SetRange		(PERC_ASSESSMAGIC		, HAI_DIST_RANGED				);
	Perc_SetRange		(PERC_ASSESSSTOPMAGIC	, HAI_DIST_RANGED 				);
	Perc_SetRange		(PERC_MOVEMOB			, PERC_DIST_DIALOG				);
	Perc_SetRange		(PERC_MOVENPC			, PERC_DIST_DIALOG				);
	Perc_SetRange		(PERC_DRAWWEAPON		, HAI_DIST_MELEE				);
	Perc_SetRange		(PERC_OBSERVESUSPECT	, PERC_DIST_DIALOG 				);
	Perc_SetRange		(PERC_NPCCOMMAND		, PERC_DIST_DIALOG 				);
	Perc_SetRange		(PERC_ASSESSCASTER		, HAI_DIST_ASSESSCASTER			);
	Perc_SetRange		(PERC_ASSESSSURPRISE	, PERC_DIST_DIALOG 				);
	Perc_SetRange		(PERC_ASSESSENTERROOM	, HAI_DIST_ACTIONRANGE			);
	Perc_SetRange		(PERC_ASSESSUSEMOB		, HAI_DIST_DETECTUSEMOB			);
};

//////////////////////////////////////////////////////////////////////////
//	GuardPerception
//	===================
//	NSCs mit diesem Set haben erhöhte Aufmerksamkeit da sie aktive
//	Wahrnehmungen aktiviert haben. Sie müssen als "Warner" für die
//	passiv wahrnehmenden 'OccupiedPerception'-NSCs fungieren. Da es Wachen sind
//	werden sie für den Watchfight nicht Ihre Posten verlassen
//////////////////////////////////////////////////////////////////////////
func void GuardPerception ()
{

	//  Wahrnehmungen aktiv 
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy				);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_AssessSC					);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTER		,	B_AssessFighter				);
	
	// SN 24.09.00: auskommentiert, da die Wachen sonst ihren Posten verlassen !!!
	//Npc_PercEnable  	(self,	PERC_ASSESSITEM			,	B_AssessItem 				);
	
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage			);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic				);
	Npc_PercEnable  	(self, 	PERC_ASSESSCASTER		,	B_AssessCaster	 			);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHREAT		,	B_AssessFighter				);
	Npc_PercEnable  	(self,	PERC_DRAWWEAPON			, 	B_AssessFighter				);		
	Npc_PercEnable  	(self, 	PERC_ASSESSWARN			, 	B_AssessWarn 		 	 	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder				);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat				);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound			);
	Npc_PercEnable  	(self, 	PERC_ASSESSQUIETSOUND	,	B_AssessQuietSound			);
	Npc_PercEnable  	(self, 	PERC_CATCHTHIEF			,	ZS_CatchThief 				);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHEFT		,	B_AssessTheft 				);
	Npc_PercEnable  	(self, 	PERC_ASSESSSURPRISE		,	ZS_AssessSurprise			);
	Npc_PercEnable  	(self, 	PERC_OBSERVESUSPECT		,	B_ObserveSuspect			);
	Npc_PercEnable  	(self, 	PERC_OBSERVEINTRUDER	,	B_ObserveIntruder 			);
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 				);
	Npc_PercEnable  	(self, 	PERC_ASSESSCALL			,	ZS_ReactToCall				);
	Npc_PercEnable  	(self,	PERC_ASSESSUSEMOB		,	B_AssessUseMob 				);
	Npc_PercEnable  	(self,	PERC_ASSESSENTERROOM	,	B_AssessEnterRoom			);
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob				    );			
	Npc_PercEnable  	(self, 	PERC_MOVENPC			,	B_MoveNpc				    );	

	Npc_SetPercTime		(self,	0.5);
};

//////////////////////////////////////////////////////////////////////////
//	ObservingPerception
//	===================
//	NSCs mit diesem Set haben erhöhte Aufmerksamkeit da sie aktive
//	Wahrnehmungen aktiviert haben. Sie müssen als "Warner" für die
//	passiv wahrnehmenden 'OccupiedPerception'-NSCs fungieren.
//////////////////////////////////////////////////////////////////////////
func void ObservingPerception ()
{

	//  Wahrnehmungen aktiv 
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy				);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTER		,	B_AssessFighter				);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_AssessSC					);
	//Npc_PercEnable  	(self,	PERC_ASSESSITEM			,	B_AssessItem 				);
	
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage			);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic				);
	Npc_PercEnable  	(self, 	PERC_ASSESSCASTER		,	B_AssessCaster 				);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHREAT		,	B_AssessFighter				);
	Npc_PercEnable  	(self, 	PERC_ASSESSWARN			, 	B_AssessWarn 		 	 	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder				);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat				);
	Npc_PercEnable  	(self,	PERC_DRAWWEAPON			, 	B_AssessFighter				);		
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound			);
	Npc_PercEnable  	(self, 	PERC_ASSESSQUIETSOUND	,	B_AssessQuietSound			); // erst mal raus, weil beklauen sonst unmöglich wird
	Npc_PercEnable  	(self, 	PERC_CATCHTHIEF			,	ZS_CatchThief 				);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHEFT		,	B_AssessTheft 				);
	Npc_PercEnable  	(self, 	PERC_ASSESSSURPRISE		,	ZS_AssessSurprise			);
	Npc_PercEnable  	(self, 	PERC_OBSERVESUSPECT		,	B_ObserveSuspect			);
	Npc_PercEnable  	(self, 	PERC_OBSERVEINTRUDER	,	B_ObserveIntruder 			);
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 				);
	Npc_PercEnable  	(self, 	PERC_ASSESSCALL			,	ZS_ReactToCall				);
	Npc_PercEnable  	(self,	PERC_ASSESSUSEMOB		,	B_AssessUseMob 				);
	Npc_PercEnable  	(self,	PERC_ASSESSENTERROOM	,	B_AssessEnterRoom			);
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob					);			
	Npc_PercEnable  	(self, 	PERC_MOVENPC			,	B_MoveNpc					);		

	Npc_SetPercTime		(self,	1);
};

//////////////////////////////////////////////////////////////////////////
//	OccupiedPerception
//	==================
//	Dieses Set beschränkt sich auf passive Wahrnehmungen. Gedacht für
//	normale Charaktere, die mit etwas beschäftigt sind.
//	WICHTIG: occupied-NSCs verlassen sich darauf, daß sie von anderen
//	Charakteren mit 'ObservingPerception' gewarnt werden!!!
//////////////////////////////////////////////////////////////////////////
func void OccupiedPerception ()
{
	
	//  Wahrnehmungen passiv 
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE  		,	ZS_ReactToDamage			);		
	Npc_PercEnable  	(self,	PERC_ASSESSTHREAT		, 	B_AssessFighter				);		
	Npc_PercEnable  	(self,	PERC_DRAWWEAPON			, 	B_AssessFighter				);		
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic				);		
	Npc_PercEnable  	(self, 	PERC_ASSESSCASTER		,	B_AssessCaster 				);
//	Npc_PercEnable		(self,  PERC_ASSESSSTOPMAGIC	,   ZS_AssessStopMagic			); 
	Npc_PercEnable  	(self,	PERC_ASSESSWARN			, 	B_AssessWarn 				);		
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder				);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat				);
	Npc_PercEnable  	(self,	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound			);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHEFT		,	B_AssessTheft 				);
	Npc_PercEnable  	(self,	PERC_CATCHTHIEF			,	ZS_CatchThief 				);		
	//Npc_PercEnable  	(self, 	PERC_OBSERVEINTRUDER	,	B_OccupiedObserveIntruder	);	
	Npc_PercEnable  	(self, 	PERC_ASSESSSURPRISE		,	ZS_AssessSurprise			);
	Npc_PercEnable  	(self, 	PERC_OBSERVESUSPECT		,	B_ObserveSuspect			);
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 				);		
	Npc_PercEnable  	(self, 	PERC_ASSESSCALL			,	ZS_ReactToCall				);		
	Npc_PercEnable  	(self,	PERC_ASSESSUSEMOB		,	B_AssessUseMob 				);
	Npc_PercEnable  	(self,	PERC_ASSESSENTERROOM	,	B_AssessEnterRoom			);
	Npc_PercEnable      (self, 	PERC_MOVEMOB		    ,	B_MoveMob				    );			
	Npc_PercEnable  	(self, 	PERC_MOVENPC			,	B_MoveNpc				    );	
};	

//////////////////////////////////////////////////////////////////////////
//	DeepSleepPerception
//	===================
//	Minimalste Wahrnehmungen während eines tiefen Schlafes. Diese Jungs
//	wachen wirklich nur Schaden am eigenen Körper auf.
//////////////////////////////////////////////////////////////////////////
func void DeepSleepPerception ()
{
	//  Wahrnehmungen passiv 
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE  		,	ZS_ReactToDamage	);		
	Npc_PercEnable  	(self,	PERC_OBSERVEINTRUDER	,	B_TossAndTurn		);		
	Npc_PercEnable  	(self,	PERC_ASSESSFIGHTSOUND	,	B_TossAndTurn		);		
	Npc_PercEnable  	(self,	PERC_ASSESSWARN			,	B_TossAndTurn 		);		
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_TossAndTurn 		);		
	Npc_PercEnable  	(self, 	PERC_ASSESSCALL			,	B_TossAndTurn		);	
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic		);				
};	

//////////////////////////////////////////////////////////////////////////
//	LightSleepPerception
//	====================
//	Unruhiger Schlaf, der von der geringsten Störung unterbrochen wird.
//////////////////////////////////////////////////////////////////////////

func void LightSleepPerception ()
{
	//  Wahrnehmungen passiv 
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE  		,	ZS_ReactToDamage	);		
	Npc_PercEnable  	(self,	PERC_ASSESSWARN			,	ZS_WakeUp			);		
	Npc_PercEnable  	(self,	PERC_ASSESSFIGHTSOUND	,	ZS_WakeUp			);		
	Npc_PercEnable  	(self,	PERC_CATCHTHIEF			,	ZS_CatchThief 		);		
	Npc_PercEnable  	(self,	PERC_ASSESSQUIETSOUND	,	B_SleepQuietSound	);
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	ZS_WakeUp 			);		
	Npc_PercEnable  	(self, 	PERC_ASSESSCALL			,	ZS_WakeUp			);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic		);					
};	

func void B_SetPerception (VAR C_NPC self)
{

//	if (self.npctype == npctype_Ambient)
//	{
//		OccupiedPerception();
//	}
//	else
//	{
		ObservingPerception();
//	};	
};


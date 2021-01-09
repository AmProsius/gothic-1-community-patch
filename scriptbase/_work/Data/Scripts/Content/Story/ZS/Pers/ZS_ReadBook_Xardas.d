/*******************************************
*       NSC liest Buch an Stehtisch        *
*******************************************/

func void ZS_ReadBook_Xardas ()
//Buch auf Stehtisch, 
{
    PrintDebugNpc		(PD_TA_FRAME,"ZS_ReadBook");
    
		//  Wahrnehmungen aktiv 
	//Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy				);
	//Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTER		,	B_AssessFighter				);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_AssessSC					);
	//Npc_PercEnable  	(self,	PERC_ASSESSITEM			,	B_AssessItem 				);
	
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage			);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic				);
	Npc_PercEnable  	(self, 	PERC_ASSESSCASTER		,	B_AssessCaster 				);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHREAT		,	B_AssessFighter				);
	//Npc_PercEnable  	(self, 	PERC_ASSESSWARN			, 	B_AssessWarn 		 	 	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder				);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat				);
	Npc_PercEnable  	(self,	PERC_DRAWWEAPON			, 	B_AssessFighter				);		
	//Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound			);
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
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob					);			
	Npc_PercEnable  	(self, 	PERC_MOVENPC			,	B_MoveNpc					);		

	Npc_SetPercTime		(self,	1); 
	
	   
	AI_SetWalkmode		(self,NPC_WALK);		// Walkmode für den Zustand
	if (!C_BodyStateContains(self,BS_MOBINTERACT))
	{
		AI_GotoWP		(self, self.wp);
		AI_UseMob		(self,"BOOK",1);			// Benutze den Mob einmal bis zum angegebenen State
	};
};

func void ZS_ReadBook_Xardas_Loop ()
{	
    PrintDebugNpc		(PD_TA_LOOP,"ZS_ReadBook_Loop");
       
    var int randomizer;
 	randomizer = Hlp_Random	(20);
    if (Npc_GetStateTime ( self ) >= 100 + randomizer)
    {
    	B_InterruptMob	("BOOK");
    };
	AI_Wait				(self,1);
};

func void ZS_ReadBook_Xardas_End ()
{
	PrintDebugNpc 		(PD_TA_FRAME,"ZS_ReadBook_End");

	AI_UseMob			(self,"BOOK",-1);			// Nimm den Verlassen State ein
};

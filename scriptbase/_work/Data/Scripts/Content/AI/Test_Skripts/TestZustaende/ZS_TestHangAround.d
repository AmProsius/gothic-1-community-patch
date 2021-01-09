func void ZS_TestHangAround ()
{
		//Aktiv :
//	Npc_PercEnable  ( self, PERC_ASSESSENEMY   		,	ZS_AssessEnemy		);
//	Npc_PercEnable  ( self,	PERC_ASSESSFIGHTER 		,	B_AssessFighter		);
//	Npc_PercEnable  ( self,	PERC_ASSESSPLAYER  		,	B_AssessSC 	);
//	Npc_PercEnable  ( self,	PERC_ASSESSBODY    		,	B_AssessBody		);	
//	Npc_PercEnable  ( self,	PERC_ASSESSITEM    		, 	B_AssessItem 		);
	
  
		//Passiv:
//	Npc_PercEnable  ( self,	PERC_ASSESSMURDER		,	ZS_AssessMurder		);	
//	Npc_PercEnable  ( self,	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat		);	
//	Npc_PercEnable  ( self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage	);		
//	Npc_PercEnable  ( self,	PERC_ASSESSTHREAT		,	B_AssessFighter		);		
//	Npc_PercEnable  ( self,	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);		
//	Npc_PercEnable  ( self,	PERC_ASSESSWARN			,	B_AssessWarn 		);		
//	Npc_PercEnable  ( self, PERC_CATCHTHIEF			,	ZS_CatchThief 		);		
//	Npc_PercEnable  ( self, PERC_OBSERVEINTRUDER	,	B_ObserveIntruder 	);	
//	Npc_PercEnable  ( self,	PERC_ASSESSTHEFT		,	b_AssessTheft		);		
//	Npc_PercEnable  ( self, PERC_ASSESSTALK			,	B_AssessTalk			);		
//	Npc_PercEnable  ( self, PERC_ASSESSMAGIC		,	B_AssessMagic		);			
//	Npc_PercEnable  ( self, PERC_MOVEMOB			,	B_MoveMob			);			
//	Npc_PercEnable  ( self, PERC_MOVENPC			,	B_MoveNPC			);		
	//Npc_PercEnable  ( self,	PERC_ASSESSQUIETSOUND	,	ZS_AssessQuietSound	);	
//	Npc_PercEnable  ( self,	PERC_DRAWWEAPON			,	B_AssessFighter	);	
	//Npc_PercEnable  ( self,	PERC_OBSERVESUSPECT		,	B_ObserveSuspect	);	
	//Npc_PercEnable  ( self, PERC_NPCCOMMAND			,	ZS_GEtBackItem		);	
	Npc_PercEnable  	(self,	PERC_ASSESSENTERROOM	,	B_AssessEnterRoom	);	
	AI_GotoWP (self,self.wp);
	/*var int testint; 
	testint = 1; 
	var float testfloat; 
	testfloat = IntToFloat (testint); 
	var string testfloatstring; 
	var string testintstring; 
	testfloatstring = FloatToString (testfloat); 
	testintstring = IntToString (testint); 
	Print (testfloatstring); 
	Print (testintstring);
	*/
	
	//AI_AlignToWP			(self);		//Richte Dich aus
	/*var C_NPC test;
	test = Hlp_GetNpc 	(Sld3_Testmodell);
	if (Npc_IsPlayer	(test))
	{
		Print (" Söldner 3 ist player");
	}
	else
	{
		Print ("Es klappt wieder");
	};*/
	/*AI_PlayAni	( self, "T_PERCEPTION"); 
	var C_NPC	eins;
	var C_NPC	zwei;
	
	var int		eins_id;
	var int 	zwei_id;
	
	eins	=	Hlp_GetNpc	(SLD1_Testmodell);
	zwei	=	Hlp_GetNpc	(SLD1_Testmodell);
	
	eins_id	=	Hlp_GetInstanceID	( eins);
	zwei_id	=	Hlp_GetInstanceID	( zwei);
	
	if ( eins_id == zwei_id)
	{
		Print ("eins = zwei");
	}
	else
	{
		Print ( "Fehler");
	};*/
	
	
		
};	


func void ZS_TestHangAround_Loop ()
{
	AI_PlayAni	( self, "T_PERCEPTION"); 
	//var C_Npc test;
	//test = Hlp_GetNpc (PC_Rockefeller);
	//Npc_SendSinglePerc			( self, test, PERC_NPCCOMMAND) 	;
	
	//AI_StartState (self, ZS_TestPerception, 1, "");
	
	/*Npc_PerceiveAll	(self);
	if ( Wld_DetectNpc	( self,-1, ZS_TestHangAround, -1))
	{
		Print ("Wld_DetectNpc // Test");
	};*/
	//ExternalsTest ();
/*	if ((Npc_GetStateTime(self)/3)*3 == Npc_GetStateTime(self))
	{
		AI_Dodge	(self);//PlayAniBS (self, "t_PickUpLow", BS_STAND);	
	};*/
	
};

func void ZS_TestHangAround_End ()
{
};


func void ZS_TestPerception ()
{
	Npc_PercEnable  ( self, PERC_ASSESSTALK			,	TestPrint		);		
	//Npc_PercEnable  ( self, PERC_OBSERVEINTRUDER	,	B_ObserveIntruder 	);	
};


func void ZS_TestPerception_Loop ()
{
	if (Hlp_IsValidNpc	(other))
	{
		PrintDebugS	( "other valid im TestHang");
	};
	if (Npc_GetStateTime	(self) > 20)
	{
		//Npc_SetTarget	(self, other);
		//AI_StartState (self, ZS_TestPerception1, 1, "");
		//Npc_PercDisable  ( self, PERC_ASSESSTALK );		
		return;
	};
};
	                            
func void ZS_TestPerception_End ()
{
	
};


func void TestPrint ()
{
	Print ("Perception AN !!!");
	Npc_PercDisable  ( self, PERC_ASSESSTALK );		
};



func void ZS_TestPerception1 ()
{
	Npc_PercDisable  ( self, PERC_ASSESSTALK );		
};


func void ZS_TestPerception1_Loop ()
{
	if (Npc_GetDistToNpc	(self,other) < 500)
	{
		AI_ContinueRoutine (self);
	};
};


func void ZS_TestPerception1_End ()
{
	
};

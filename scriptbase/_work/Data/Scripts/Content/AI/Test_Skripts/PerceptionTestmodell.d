//########################################################################
//##
//##	Perception_Testmodell													
//##
//########################################################################
instance Perception_Testmodell (Npc_Default)
{
	//-------- primary data --------
	name =							"Perception_Testmodell";
	guild =							GIL_DMB;
	level =							1;
	voice =							11;//15;
	id =							2221;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		9;
	attribute[ATR_DEXTERITY] =		7;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	18;
	attribute[ATR_HITPOINTS] =		18;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Bald", 82, 1, DMB_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_MAGE;

 	//-------- Talente -------- 
	//Npc_LearnFightTalent (self, TAL_1H_SWORD2);
	//Npc_LearnFightTalent (self, TAL_1H_AXE2);		
			
	//-------- inventory --------
	//CreateInvItem	(self, ItMw1hSword01);
	//CreateInvItem	(self, ItFoApple);
	//CreateInvItems	(self, ItMiNugget, 4);
	
	//-------- ai ----------
	start_aistate = ZS_PTM_Hangaround;
	fight_tactic	=	FAI_HUMAN_MAGE;

	Npc_SetPermAttitude(self, ATT_NEUTRAL);
 
};

func void ZS_PTM_Hangaround ()
{
	PrintDebugNpc	(PD_ZS_FRAME,	"ZS_PTM_Hangaround");

	// * Wahrnehmungen aktiv *
	Npc_PercEnable  	(self,	PERC_ASSESSPLAYER		,	B_PTM_AssessPlayer		);	
	Npc_PercEnable  	(self,	PERC_ASSESSENEMY		,	B_PTM_AssessEnemy		);	
	Npc_PercEnable  	(self,	PERC_ASSESSFIGHTER		,	B_PTM_AssessFighter		);	
	Npc_PercEnable  	(self,	PERC_ASSESSBODY			,	B_PTM_AssessBody		);	
	Npc_PercEnable  	(self,	PERC_ASSESSITEM			,	B_PTM_AssessItem		);	
//	Npc_SetPercTime		(self,	0.5);
	
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self,	PERC_ASSESSMURDER		,	B_PTM_AssessMurder		);	
	Npc_PercEnable  	(self,	PERC_ASSESSDEFEAT		,	B_PTM_AssessDefeat		);
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	B_PTM_AssessDamage		);
	Npc_PercEnable  	(self,	PERC_ASSESSOTHERSDAMAGE	,	B_PTM_AssessOhtersDamage);
	Npc_PercEnable  	(self,	PERC_ASSESSTHREAT		,	B_PTM_AssessThreat		);
	Npc_PercEnable  	(self,	PERC_ASSESSREMOVEWEAPON	,	B_PTM_AssessRemoveWeapon);
	Npc_PercEnable  	(self,	PERC_OBSERVEINTRUDER	,	B_PTM_ObserveIntruder	);
	//Npc_PercEnable  	(self,	PERC_ASSESSFIGHTSOUND	,	B_PTM_AssessFightSound	);
	Npc_PercEnable  	(self,	PERC_ASSESSQUIETSOUND	,	B_PTM_AssessQuietSound	);
	Npc_PercEnable  	(self,	PERC_ASSESSWARN			,	B_PTM_AssessWarn		);
	Npc_PercEnable  	(self,	PERC_CATCHTHIEF			,	B_PTM_CatchThief		);
	Npc_PercEnable  	(self,	PERC_ASSESSTHEFT		,	B_PTM_AssessTheft		);
	Npc_PercEnable  	(self,	PERC_ASSESSCALL			,	B_PTM_AssessCall		);
	Npc_PercEnable  	(self,	PERC_ASSESSTALK			,	B_PTM_AssessTalk		);
	Npc_PercEnable  	(self,	PERC_ASSESSGIVENITEM	,	B_PTM_AssessGivenItem	);
	Npc_PercEnable  	(self,	PERC_ASSESSFAKEGUILD	,	B_PTM_AssessFakeGuild	);
	Npc_PercEnable  	(self,	PERC_MOVEMOB			,	B_PTM_MoveMob			);	
	Npc_PercEnable  	(self,	PERC_MOVENPC			,	B_PTM_MoveNpc			);	
	Npc_PercEnable  	(self,	PERC_DRAWWEAPON			,	B_PTM_DrawWeapon		);
	Npc_PercEnable  	(self,	PERC_OBSERVESUSPECT		,	B_PTM_ObserveSuspect	);
	Npc_PercEnable  	(self,	PERC_NPCCOMMAND			,	B_PTM_NpcCommand		);
	Npc_PercEnable  	(self,	PERC_ASSESSMAGIC		,	B_PTM_AssessMagic		);
	Npc_PercEnable  	(self,	PERC_ASSESSSTOPMAGIC	,	B_PTM_AssessStopMagic	);
	Npc_PercEnable  	(self,	PERC_ASSESSCASTER		,	B_PTM_AssessCaster		);
	Npc_PercEnable  	(self,	PERC_ASSESSSURPRISE		,	B_PTM_AssessSurprise	);
	Npc_PercEnable  	(self,	PERC_ASSESSENTERROOM	,	B_PTM_AssessEnterRoom	);
	Npc_PercEnable  	(self,	PERC_ASSESSUSEMOB		,	B_PTM_AssessUseMob		);
};

func void ZS_PTM_Hangaround_Loop ()
{
	PrintDebugNpc	(PD_ZS_LOOP,	"ZS_PTM_Hangaround_Loop");
};

func void ZS_PTM_Hangaround_End ()
{
	PrintDebugNpc	(PD_ZS_FRAME,	"ZS_PTM_Hangaround_End");
};




func void B_PTM_AssessPlayer		()	{	PrintDebugNpc(PD_ZS_DETAIL,	"B_PTM_AssessPlayer"		);	PrintGlobals(PD_ZS_DETAIL);	};
func void B_PTM_AssessEnemy			()	{	PrintDebugNpc(PD_ZS_DETAIL,	"B_PTM_AssessEnemy"			);	PrintGlobals(PD_ZS_DETAIL);	};
func void B_PTM_AssessFighter		()	{	PrintDebugNpc(PD_ZS_DETAIL,	"B_PTM_AssessFighter"	    );	PrintGlobals(PD_ZS_DETAIL);	};
func void B_PTM_AssessBody			()	{	PrintDebugNpc(PD_ZS_DETAIL,	"B_PTM_AssessBody"			);	PrintGlobals(PD_ZS_DETAIL);	};
func void B_PTM_AssessItem			()	{	PrintDebugNpc(PD_ZS_DETAIL,	"B_PTM_AssessItem"			);	PrintGlobals(PD_ZS_DETAIL);	};
	                                                                                                 
                                                                                                     
func void B_PTM_AssessMurder		()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessMurder"	   	);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_AssessDefeat		()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessDefeat"		);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_AssessDamage		()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessDamage"		);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_AssessOhtersDamage	()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessOhtersDamage"	);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_AssessThreat		()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessThreat"		);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_AssessRemoveWeapon	()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessRemoveWeapon"	);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_ObserveIntruder		()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_ObserveIntruder"		);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_AssessFightSound	()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessFightSound"	);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_AssessQuietSound	()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessQuietSound"	);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_AssessWarn			()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessWarn"			);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_CatchThief			()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_CatchThief"			);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_AssessTheft			()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessTheft"			);	PrintGlobals(PD_ZS_FRAME);	};//B_AssessTheft();};
func void B_PTM_AssessCall			()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessCall"			);	PrintGlobals(PD_ZS_FRAME);	
											/*AI_SetWalkmode(self, NPC_WALK);
											AI_GotoWP	 (self, "WP_START");	*/												 			};
func void B_PTM_AssessTalk			()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessTalk"			);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_AssessGivenItem		()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessGivenItem"		);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_AssessFakeGuild		()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessFakeGuild"		);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_MoveMob				()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_MoveMob"				);	PrintGlobals(PD_ZS_FRAME);	B_MoveMob();};
func void B_PTM_MoveNpc			    ()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_MoveNpc"			    );	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_DrawWeapon			()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_DrawWeapon"			);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_ObserveSuspect		()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_ObserveSuspect"		);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_NpcCommand			()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_NpcCommand"			);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_AssessMagic			()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessMagic"			);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_AssessStopMagic		()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessStopMagic"		);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_AssessCaster		()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessCaster"		);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_AssessSurprise		()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessSurprise"		);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_AssessEnterRoom		()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessEnterRoom"		);	PrintGlobals(PD_ZS_FRAME);	};
func void B_PTM_AssessUseMob		()	{	PrintDebugNpc(PD_ZS_FRAME,	"B_PTM_AssessUseMob"		);	PrintGlobals(PD_ZS_FRAME);	};//B_AssessUseMob();};

/////////////////////////////////////////
// Dr Pymonte ///////////////////////////
/////////////////////////////////////////
instance InExtremo_DrPymonte(Npc_Default)
{
	//-------- primary data --------
	name 						=	"Dr. Pymonte";
   	npctype						= 	npctype_main;
   	guild 						=	GIL_NONE;
	level 						=	4;
	voice						=	11;
	id 							=	390;
	flags      					 =   NPC_FLAG_IMMORTAL;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	=	20;
	attribute[ATR_DEXTERITY]	=	10;
	attribute[ATR_MANA_MAX] 	=	0;
	attribute[ATR_MANA] 		=	0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] 	=	88;
	
	//-------- inventory --------                                    
//	CreateInvItem (self, ItMiHarp);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,	"HUMANS.MDS");
	//							Body-Mesh						Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 	(self,	"HUM_IE_PYMONTE_INSTRUMENT",	DEFAULT,	DEFAULT,	"HUM_HEAD_PYMONTE", DEFAULT,  	DEFAULT, 	-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Concert_390;
	//start_aistate				= ZS_iepymonte;
};



FUNC VOID Rtn_concert_390 () 
{
	TA_IEPymonte	(08,00,20,00,"OCR_IE_PYMONTE");
	TA_IEPymonte	(20,00,08,00,"OCR_IE_PYMONTE");
};

FUNC VOID Rtn_off_390 () 
{
	TA_Stay	(08,00,20,00,"NOWHERE");
	TA_Stay	(20,00,08,00,"NOWHERE");
};




/////////////////////////////////////////
// The Flail ////////////////////////////
/////////////////////////////////////////
instance InExtremo_TheFlail(Npc_Default)
{
	//-------- primary data --------
	
	name =					"The Flail";
	npctype		= 	npctype_main;
   	guild =					GIL_NONE;
	level =					4;
	flags =					0;
	
	voice =					11;//10;
	id =					391;
	flags      					 =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	=	20;
	attribute[ATR_DEXTERITY]	=	10;
	attribute[ATR_MANA_MAX] 	=	0;
	attribute[ATR_MANA] 		=	0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] 	=	88;
	
	//-------- inventory --------                                    
//	CreateInvItem (self, ItMiDrumstick);
		
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,	"HUMANS.MDS");
	//							Body-Mesh						Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 	(self,	"HUM_IE_FLAIL_INSTRUMENT",		DEFAULT,	DEFAULT,	"HUM_HEAD_FLAIL", 	DEFAULT,  	DEFAULT, 	-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_concert_391;
	//start_aistate				= ZS_ieflail;
};

FUNC VOID Rtn_concert_391 () 
{
	TA_IEFlail		(08,00,20,00,"OCR_IE_FLAIL");
	TA_IEFlail		(20,00,08,00,"OCR_IE_FLAIL");
};

FUNC VOID Rtn_off_391 () 
{
	TA_Stay	(08,00,20,00,"NOWHERE");
	TA_Stay	(20,00,08,00,"NOWHERE");
};

/////////////////////////////////////////
// Thomas, the Forger ///////////////////
/////////////////////////////////////////
instance InExtremo_ThomasTheForger(Npc_Default)
{
	//-------- primary data --------
	
	name =					"Thomas the Forger";
   	npctype	= npctype_main;
   	guild =					GIL_NONE;
	level =					4;
	flags =					0;
	
	voice =					11;//10;
	id =					392;
	flags      					 =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	=	20;
	attribute[ATR_DEXTERITY]	=	10;
	attribute[ATR_MANA_MAX] 	=	0;
	attribute[ATR_MANA] 		=	0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] 	=	88;
	
	//-------- inventory --------                                    
//	CreateInvItem (self, ItMiCello);
//	CreateInvItem (self, ItMiCellobow);
		
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,	"HUMANS.MDS");
	//							Body-Mesh					Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR	
	Mdl_SetVisualBody 	(self,	"HUM_IE_THOMAS_INSTRUMENT",	DEFAULT,	DEFAULT,	"HUM_HEAD_THOMAS", 	DEFAULT,  	DEFAULT, 	-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_concert_392;
	//start_aistate				= ZS_iethomas;
};

FUNC VOID Rtn_concert_392 () 
{
	TA_IEThomas		(08,00,20,00,"OCR_IE_THOMAS");
	TA_IEThomas		(20,00,08,00,"OCR_IE_THOMAS");
};

FUNC VOID Rtn_off_392 () 
{
	TA_Stay	(08,00,20,00,"NOWHERE");
	TA_Stay	(20,00,08,00,"NOWHERE");
};


/////////////////////////////////////////
// Unicorn //////////////////////////////
/////////////////////////////////////////

instance InExtremo_Unicorn(Npc_Default)
{
	//-------- primary data --------
	
	name =					"Unicorn";
	npctype		= 	npctype_main;
   	guild =					GIL_NONE;
	level =					4;
	flags =					0;
	
	voice =					11;//10;
	id =					393;
	flags      					 =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	=	20;
	attribute[ATR_DEXTERITY]	=	10;
	attribute[ATR_MANA_MAX] 	=	0;
	attribute[ATR_MANA] 		=	0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] 	=	88;
		
	//-------- inventory --------                                    
//	CreateInvItem (self, ItMiLuteIE);
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,	"HUMANS.MDS");
	//							Body-Mesh						Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 	(self,	"HUM_IE_UNICORN_INSTRUMENT",	DEFAULT,	DEFAULT,	"HUM_HEAD_UNICORN", DEFAULT, 	DEFAULT, 	-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_concert_393;
	//start_aistate				= ZS_ieunicorn;
};

FUNC VOID Rtn_concert_393 () 
{
	TA_IEUnicorn		(08,00,20,00,"OCR_IE_UNICORN");
	TA_IEUnicorn		(20,00,08,00,"OCR_IE_UNICORN");
};

FUNC VOID Rtn_off_393 () 
{
	TA_Stay	(08,00,20,00,"NOWHERE");
	TA_Stay	(20,00,08,00,"NOWHERE");
};


/////////////////////////////////////////
// Yellow Pfeiffer //////////////////////
/////////////////////////////////////////
instance InExtremo_YellowPfeiffer(Npc_Default)
{
	//-------- primary data --------
	
	name =					"Yellow Pfeiffer";
   	npctype		= 	npctype_main;
   	guild =					GIL_NONE;
	level =					4;
	flags =					0;
	
	voice =					11;//10;
	id =					394;
	flags      					 =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	=	20;
	attribute[ATR_DEXTERITY]	=	10;
	attribute[ATR_MANA_MAX] 	=	0;
	attribute[ATR_MANA] 		=	0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] 	=	88;
		
	//-------- inventory --------                                    
//	CreateInvItem (self, ItMiYellowpipe);
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,	"HUMANS.MDS");
	//							Body-Mesh						Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 	(self,	"Hum_IE_Pfeiffer_INSTRUMENT",	DEFAULT,	DEFAULT,	"HUM_HEAD_Pfeiffer", DEFAULT,  	DEFAULT, 	-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);
	//-------------Daily Routine-------------
	daily_routine = Rtn_concert_394;
	//start_aistate				= ZS_iepfeiffer;
};

FUNC VOID Rtn_concert_394 () 
{	
	TA_IEPfeiffer		(08,00,20,00,"OCR_IE_PFEIFFER");
	TA_IEPfeiffer		(20,00,08,00,"OCR_IE_PFEIFFER");
};

FUNC VOID Rtn_off_394 () 
{
	TA_Stay	(08,00,20,00,"NOWHERE");
	TA_Stay	(20,00,08,00,"NOWHERE");
};

/////////////////////////////////////////
// Lutter ///////////////////////////////
/////////////////////////////////////////
instance InExtremo_Lutter(Npc_Default)
{
	//-------- primary data --------
	
	name =					"Lutter";
   	npctype		= 	npctype_main;
   	guild =					GIL_NONE;
	level =					4;
	voice =					11;//10;
	id =					395;
	flags      					 =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	=	20;
	attribute[ATR_DEXTERITY]	=	10;
	attribute[ATR_MANA_MAX] 	=	0;
	attribute[ATR_MANA] 		=	0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] 	=	88;

	//-------- inventory --------                                    
	//CreateInvItem (self, ItMiDrumscheit);
	//CreateInvItem (self, ItMiCellobow);
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,	"HUMANS.MDS");
	//							Body-Mesh					Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 	(self,	"Hum_IE_Lutter_INSTRUMENT",	DEFAULT,	DEFAULT,	"HUM_HEAD_Lutter", 	DEFAULT,  	DEFAULT, 	-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);

	//-------------Daily Routine-------------
	daily_routine = Rtn_concert_395;
	//start_aistate				= ZS_ielutter;
};

FUNC VOID Rtn_concert_395 () 
{
	TA_IELutter		(08,00,20,00,"OCR_IE_LUTTER");
	TA_IELutter		(20,00,08,00,"OCR_IE_LUTTER");
};

FUNC VOID Rtn_off_395() 
{
	TA_Stay	(08,00,20,00,"NOWHERE");
	TA_Stay	(20,00,08,00,"NOWHERE");
};

/////////////////////////////////////////
// Flex /////////////////////////////////
/////////////////////////////////////////
instance InExtremo_Flex(Npc_Default)
{
	//-------- primary data --------
	
	name =					"Flex";
   	npctype		= 	npctype_main;
   	guild =					GIL_NONE;
	level =					4;
	flags =					0;
	
	voice =					11;//10;
	id =					396;
	flags      					 =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	=	20;
	attribute[ATR_DEXTERITY]	=	10;
	attribute[ATR_MANA_MAX] 	=	0;
	attribute[ATR_MANA] 		=	0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] 	=	88;
			
	//-------- inventory --------                                    
//	CreateInvItem (self, ItMiBluepipe);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,	"HUMANS.MDS");
	//							Body-Mesh						Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR	
	Mdl_SetVisualBody 	(self,	"Hum_IE_Flex_INSTRUMENT",		DEFAULT,	DEFAULT,	"HUM_HEAD_Flex", 	DEFAULT,  	DEFAULT, 	-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);

	//-------------Daily Routine-------------
	daily_routine = Rtn_concert_396;
	//start_aistate				= ZS_ieflex;
};

FUNC VOID Rtn_concert_396 () 
{
	TA_IEFlex		(08,00,20,00,"OCR_IE_FLEX");
	TA_IEFlex		(20,00,08,00,"OCR_IE_FLEX");
};
FUNC VOID Rtn_off_396 () 
{
	TA_Stay	(08,00,20,00,"NOWHERE");
	TA_Stay	(20,00,08,00,"NOWHERE");
};



/////////////////////////////////////////
// STEVE GÄTCHEN	  ///////////////////
/////////////////////////////////////////

// Ansager für In Extremo

instance IE_397_Announcer(Npc_Default)
{
	//-------- primary data --------
	name 						=	"Steve";
   	npctype						= 	npctype_main;
   	guild 						=	GIL_NONE;
	level 						=	4;
	voice						=	11;
	id 							=	397;
	flags      					 =   NPC_FLAG_IMMORTAL;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	=	20;
	attribute[ATR_DEXTERITY]	=	10;
	attribute[ATR_MANA_MAX] 	=	0;
	attribute[ATR_MANA] 		=	0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] 	=	88;
	
	//-------- inventory --------                                    

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,	"HUMANS.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 	(self,	"Hum_Body_Naked0",	4,			1,			"Hum_Head_Fatbald", 113,  		DEFAULT, 	-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_announce_397;

};

FUNC VOID Rtn_announce_397 () 
{
	TA_Stay	(08,00,20,00,"OCR_AUDIENCE_02");
	TA_Stay	(20,00,08,00,"OCR_AUDIENCE_02");
};

FUNC VOID Rtn_concert_397 () 
{
	TA_Firespit	(08,00,20,00,"OCR_AUDIENCE_02");
	TA_Firespit	(20,00,08,00,"OCR_AUDIENCE_02");
};

FUNC VOID Rtn_off_397 () 
{
	TA_Stay	(08,00,20,00,"NOWHERE");
	TA_Stay	(20,00,08,00,"NOWHERE");
};



/////////////////////////////////////////
// CHARLOTTE		  ///////////////////
/////////////////////////////////////////

// Babe von VIVA

instance Charlotte (Npc_Default)
{
	//-------- primary data --------
	
	name 						=	"Charlotte";
	npctype						= 	npctype_main;
	guild 						=	GIL_BAB;
	level 						=	1;
	voice 						=	16;
	id 							=	398;
	flags      					=   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 5;
	attribute[ATR_DEXTERITY] 	= 10;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 40;
	attribute[ATR_HITPOINTS] 	= 40;

	//-------- visuals --------
	// 					animations
	Mdl_SetVisual		(self,"BABE.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR	
	Mdl_SetVisualBody	(self,	"Bab_body_Naked0", 	0, 			2,			"Bab_Head_Hair1", 	0,  		DEFAULT, 	-1);
	
	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD;


	//-------------Daily Routine-------------
	daily_routine = Rtn_announce_398;
};


FUNC VOID Rtn_announce_398 () 
{
	TA_Stay	(08,00,20,00,"OCR_AUDIENCE_03");
	TA_Stay	(20,00,08,00,"OCR_AUDIENCE_03");
};

FUNC VOID Rtn_concert_398 () 
{
	TA_Charlotte_Dance	(08,00,20,00,"OCR_AUDIENCE_03");
	TA_Charlotte_Dance	(20,00,08,00,"OCR_AUDIENCE_03");
};

FUNC VOID Rtn_off_398 () 
{
	TA_Stay		(08,00,20,00,"NOWHERE");
	TA_Stay		(20,00,08,00,"NOWHERE");
};



/////////////////////////////////////////
// Publikum		1	  ///////////////////
/////////////////////////////////////////

instance IEFan1 (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						NPCTYPE_MAIN;
	guild =							GIL_VLK;      
	level =							5;	
	voice =							2;
	id =							399;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");

	//							Body-Mesh				Body-Tex	Skin-Color	Head-MMS				Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 	(self,	"hum_body_Naked0",		1,			1,			"Hum_Head_FatBald", 	74,  		DEFAULT, 	-1);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    

	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Nailmace_01);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItFoBeer);

	//-------------Daily Routine-------------
	daily_routine = Rtn_concert_399;
};

FUNC VOID Rtn_concert_399 () 
{
	TA_WatchInExtremo	(08,00,20,00,"OCR_CROWD_01");
	TA_WatchInExtremo	(20,00,08,00,"OCR_CROWD_01");
};

FUNC VOID Rtn_off_399 () 
{
	TA_Stay		(08,00,20,00,"NOWHERE");
	TA_Stay		(20,00,08,00,"NOWHERE");
};


/////////////////////////////////////////
// Publikum		2	  ///////////////////
/////////////////////////////////////////

instance IEFan2 (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						NPCTYPE_MAIN;
	guild =							GIL_VLK;      
	level =							5;	
	voice =							2;
	id =							400;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");

	//							Body-Mesh				Body-Tex	Skin-Color	Head-MMS				Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 	(self,	"hum_body_Naked0",		2,			1,			"Hum_Head_FatBald", 	73,  		DEFAULT, 	-1);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    

	//-------- inventory --------                                    
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItFoBeer);

	//-------------Daily Routine-------------
	daily_routine = Rtn_concert_400;
};

FUNC VOID Rtn_concert_400 () 
{
	TA_WatchInExtremo	(08,00,20,00,"OCR_CROWD_02");
	TA_WatchInExtremo	(20,00,08,00,"OCR_CROWD_02");
};

FUNC VOID Rtn_off_400 () 
{
	TA_Stay		(08,00,20,00,"NOWHERE");
	TA_Stay		(20,00,08,00,"NOWHERE");
};

/////////////////////////////////////////
// Publikum		3	  ///////////////////
/////////////////////////////////////////

instance IEFan3 (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						NPCTYPE_MAIN;
	guild =							GIL_VLK;      
	level =							5;	
	voice =							2;
	id =							401;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");

	//							Body-Mesh				Body-Tex	Skin-Color	Head-MMS				Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 	(self,	"hum_body_Naked0",		2,			0,			"Hum_Head_FatBald", 	10,  		DEFAULT, 	-1);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    

	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Nailmace_01);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItFoBeer);

	//-------------Daily Routine-------------
	daily_routine = Rtn_concert_401;
	};

FUNC VOID Rtn_concert_401 () 
{
	TA_WatchInExtremo	(08,00,20,00,"OCR_CROWD_03");
	TA_WatchInExtremo	(20,00,08,00,"OCR_CROWD_03");
};

FUNC VOID Rtn_off_401 () 
{
	TA_Stay		(08,00,20,00,"NOWHERE");
	TA_Stay		(20,00,08,00,"NOWHERE");
};

/////////////////////////////////////////
// Publikum		4	  ///////////////////
/////////////////////////////////////////

instance IEFan4 (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						NPCTYPE_MAIN;
	guild =							GIL_VLK;      
	level =							5;	
	voice =							2;
	id =							402;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");

	//							Body-Mesh				Body-Tex	Skin-Color	Head-MMS				Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 	(self,	"hum_body_Naked0",		4,			2,			"Hum_Head_FatBald", 	4,  		DEFAULT, 	-1);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    

	//-------- inventory --------                                    
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItFoBeer);

	//-------------Daily Routine-------------
	daily_routine = Rtn_concert_402;
	};

FUNC VOID Rtn_concert_402 () 
{
	TA_WatchInExtremo	(08,00,20,00,"OCR_CROWD_04");
	TA_WatchInExtremo	(20,00,08,00,"OCR_CROWD_04");
};

FUNC VOID Rtn_off_402 () 
{
	TA_Stay		(08,00,20,00,"NOWHERE");
	TA_Stay		(20,00,08,00,"NOWHERE");
};

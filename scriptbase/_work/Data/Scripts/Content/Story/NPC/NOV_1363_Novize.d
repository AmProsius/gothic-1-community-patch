// Novize nur für Kap. 6 Orktempel benutzen

instance NOV_1363_Novize (Npc_Default)
{
	//-------- primary data --------
	name 	=	NAME_MadNovice;
	Npctype 		=		npctype_main;
	guild 		=		GIL_GUR;
	level 		=		30;
	flags 		=		0;
	
	voice 		=		3;
	id 			=		1363;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	115;
	attribute[ATR_DEXTERITY] 		=	50;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	250;
	attribute[ATR_HITPOINTS] 		=	250;

	//------ Protection -------
	protection	[PROT_BLUNT]		=	1000;
	protection	[PROT_EDGE]			=	1000;
	protection	[PROT_POINT]		=	1000;
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;
	protection	[PROT_MAGIC]		=	50;
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 117,  3, NOV_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	CreateInvItem (self, ItMw_2H_Staff_02);
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_OT_1363;

};

FUNC VOID Rtn_start_1363 ()
{
	TA_Meditate	(24,00,06,00,"TPL_408");
  	TA_Meditate	(06,00,24,00,"TPL_408");	 
};

FUNC VOID Rtn_OT_1363 ()
{
	TA_OTMeditate	(24,00,06,00,"TPL_390");
  	TA_OTMeditate	(06,00,24,00,"TPL_390");	 
};
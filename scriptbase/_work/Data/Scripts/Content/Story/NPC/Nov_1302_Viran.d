instance NOV_1302_Viran (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Viran";
	Npctype	 	=		Npctype_Main;
	guild 		=		GIL_NOV;
	level 		=		15;
	
	voice 		=		7;
	id 			=		1302;
		
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	15;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	100;
	attribute[ATR_HITPOINTS] 		=	100;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Bald", 26,  3, NOV_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Hatchet_01);
	CreateInvItems (self, ItMi_Plants_Swampherb_01, 50);
	CreateInvItems	(self, ItMiNugget,	5);
	CreateInvItems	(self, ItFoRice,	2);
	CreateInvItems	(self, ItFoBooze,	6);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1302;

};

FUNC VOID Rtn_start_1302 () //Sumpfkraut-Sammler-Chef
{
	TA_Boss		(07,00,19,00,"PATH_TAKE_HERB_2_1");
	TA_Boss		(19,00,07,00,"PATH_TAKE_HERB_2_1");
};
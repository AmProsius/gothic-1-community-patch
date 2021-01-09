instance NOV_1309_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 		=		Npctype_Ambient;
	guild 		=		GIL_NOV;
	level 		=		9;
	
	voice 		=		3;
	id 			=		1309;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	15;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	148;
	attribute[ATR_HITPOINTS] 		=	148;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1 , 1,"Hum_Head_Psionic", 30,  1, NOV_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
	
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Axe_Old_01);
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);
 
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1309;
};

FUNC VOID Rtn_start_1309 ()
{
    TA_HerbAlchemy	(07,00,00,00,"PSI_HERB_PLACE_2");// schläft PSI_16_HUT_IN
    TA_Sleep 		(00,00,07,00,"PSI_6_HUT_IN_BED2");
};


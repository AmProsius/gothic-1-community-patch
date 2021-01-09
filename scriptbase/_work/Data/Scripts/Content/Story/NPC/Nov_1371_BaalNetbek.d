instance NOV_1371_BaalNetbek (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Netbek";
	Npctype 	=		npctype_main;
	guild 		=		GIL_NOV;
	level 		=		3;
	flags 		=		0;
	
	voice 		=		3;
	id 			=		1371;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	10;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	76;
	attribute[ATR_HITPOINTS] 		=	76;
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Fatbald", 101,  1, NOV_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,3);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	CreateInvItem (self, ItMw_1H_Hatchet_01);
	
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1371;

};

FUNC VOID Rtn_start_1371 ()
{
	TA_Stay	(24,00,06,00,"PATH_TAKE_HERB_08");
  	TA_Stay	(06,00,24,00,"PATH_TAKE_HERB_08");	 
};


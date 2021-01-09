instance VLK_555_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_ambient;
	guild =							GIL_VLK;      
	level =							3;
	
	
	voice =							3;
	id =							555;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		15;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	76;
	attribute[ATR_HITPOINTS] =		76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,2,"Hum_Head_Psionic", 0,  1, VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Nailmace_01);
	CreateInvItem (self, ItMwPickaxe);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_555;
};

FUNC VOID Rtn_start_555 ()
{
	TA_Sleep		(22,45,07,30,"OCR_HUT_29");
	TA_SitAround	(07,30,11,00,"OCR_OUTSIDE_HUT_29");
	TA_RepairHut	(11,00,17,00,"OCR_OUTSIDE_HUT_29");
	TA_SitAround	(17,00,22,45,"OCR_OUTSIDE_HUT_29");
};








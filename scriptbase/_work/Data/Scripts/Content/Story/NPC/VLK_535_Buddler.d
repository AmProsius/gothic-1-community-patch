instance VLK_535_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_ambient;
	guild =							GIL_VLK;      
	level =							3;
	
	
	voice =							3;
	id =							535;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Bald", 73,  2,VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	
	//-------- Talents  --------                                    
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Nailmace_01);
	CreateInvItem (self, ItMwPickaxe);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItFoBeer);
	CreateInvItem (self, ItLsTorch);


	//-------------Daily Routine-------------
	daily_routine = Rtn_start_535;
};

FUNC VOID Rtn_start_535 () // Kyle-Platz UNTEN
{
	TA_Sleep		(22,30,06,45,"OCR_HUT_71");
	TA_SitAround	(06,45,08,00,"OCR_OUTSIDE_HUT_71");
	TA_StandAround	(08,00,11,00,"OCR_OUTSIDE_HUT_71");
	TA_WashSelf		(11,00,11,30,"OCR_WASH_2");	
	TA_SitAround	(11,30,16,30,"OCR_OUTSIDE_HUT_71");
	TA_SitCampfire  (16,30,22,30,"OCR_OUTSIDE_HUT_71");
};







